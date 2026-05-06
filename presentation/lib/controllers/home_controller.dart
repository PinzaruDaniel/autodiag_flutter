import 'dart:async';
import 'dart:io';

import 'package:common/constants/logger.dart';
import 'package:domain/modules/audio/use_cases/send_audio_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';
import 'package:presentation/controllers/controller_imports.dart';
import 'package:presentation/resources/app_colors.dart';
import 'package:presentation/view_models/audio_view_models.dart';
import 'package:record/record.dart';

import '../resources/text_styles.dart';
import '../utils/constants/pending_ids.dart';

abstract class AudioRecorderClient {
  Future<bool> hasPermission();

  Future<void> start(RecordConfig config, {required String path});

  Future<String?> stop();

  Future<void> dispose();
}

class RecordAudioRecorderClient implements AudioRecorderClient {
  final AudioRecorder _recorder = AudioRecorder();

  @override
  Future<bool> hasPermission() => _recorder.hasPermission();

  @override
  Future<void> start(RecordConfig config, {required String path}) => _recorder.start(config, path: path);

  @override
  Future<String?> stop() => _recorder.stop();

  @override
  Future<void> dispose() => _recorder.dispose();
}

abstract class DirectoryProvider {
  Future<Directory> getAppDocumentsDirectory();
}

class PathProviderDirectoryProvider implements DirectoryProvider {
  @override
  Future<Directory> getAppDocumentsDirectory() => getApplicationDocumentsDirectory();
}

class HomeController extends GetxController {
  HomeController({
    AudioRecorderClient? recorder,
    DirectoryProvider? directoryProvider,
    Duration? maxDuration,
    SendAudioUseCase? sendAudioUseCase,
  }) : _recorder = recorder ?? RecordAudioRecorderClient(),
       _directoryProvider = directoryProvider ?? PathProviderDirectoryProvider(),
       _maxDuration = maxDuration ?? const Duration(seconds: 7),
       _sendAudioUseCase = sendAudioUseCase ?? GetIt.instance<SendAudioUseCase>();

  final AudioRecorderClient _recorder;
  final DirectoryProvider _directoryProvider;
  final Duration _maxDuration;
  final SendAudioUseCase _sendAudioUseCase;

  final RxBool isRecording = false.obs;
  final RxString lastRecordingPath = ''.obs;

  Timer? _stopTimer;

  Future<void> toggleRecording({BuildContext? context}) async {
    if (isRecording.value) {
      await stopRecording();
      return;
    }
    await startRecording(context: context);
  }

  Future<void> startRecording({BuildContext? context}) async {
    if (isRecording.value) {
      return;
    }

    final hasPermission = await _recorder.hasPermission();
    if (!hasPermission) {
      _showSnack(context, 'Microphone permission is required to record audio.');
      return;
    }

    final directory = await _directoryProvider.getAppDocumentsDirectory();
    final path = '${directory.path}/recording_${DateTime.now().millisecondsSinceEpoch}.wav';

    await _recorder.start(const RecordConfig(encoder: AudioEncoder.wav, sampleRate: 48000), path: path);
    lastRecordingPath.value = path;
    isRecording.value = true;

    _stopTimer?.cancel();
    _stopTimer = Timer(_maxDuration, () async {
      await stopRecording();
    });
  }

  Future<void> stopRecording() async {
    if (!isRecording.value) {
      return;
    }

    _stopTimer?.cancel();
    _stopTimer = null;

    await _recorder.stop();
    isRecording.value = false;

    final path = lastRecordingPath.value;
    if (path.isEmpty) {
      return;
    }

    final file = File(path);
    if (!await file.exists()) {
      return;
    }
    
    mainAppController.addPendingIds([PendingIds.sendAudio]);
    await _sendAudioUseCase(SendAudioParams(file: file)).then((result) {
      result.fold(
        (failure) => _showSnack(Get.context, 'Failed to send audio: ${failure.message}'),
        (r) {

          consoleLog('Audio sent successfully, received predictions: ${r.predictions.length}');
          var mapped= r.predictions.map((e)=>e.toVm()).toList();
          consoleLog('mapped predictions: $mapped ');
          _showPredictionDialog(r.predictions.map((prediction) => prediction.toVm()).toList());
        }
      );
    });
    mainAppController.removePendingIds([PendingIds.sendAudio]);
  }

  void _showPredictionDialog(List<PredictionVm> predictions) {
    final topPredictions = predictions.take(3).toList();
    final title = topPredictions.isEmpty ? 'No prediction' : 'AI thinks that it is:';
    final message = topPredictions.isEmpty
        ? 'No predictions returned.'
        : topPredictions
            .map(
              (prediction) =>
                  '${prediction.label}: ${/*(prediction.score * 100) >= 70 ? */(prediction.score * 100).toStringAsFixed(1)/*: (prediction.score * 100 + 25).toStringAsFixed(1)*/}%',
            )
            .join('\n');
    Get.dialog(
      AlertDialog(
        backgroundColor: AppColors.onBackground,
        shape: OutlineInputBorder(borderRadius: .circular(16), borderSide: .new(color: AppColors.borderColor)),
        title: Text(title, style: TextStyles.whiteBold(fontSize: 18.sp),),
        content: Text(message, style: TextStyles.baseTextStyle,),
        actions: [TextButton(onPressed: () => Get.back(), child:  Text('OK', style: TextStyles.whiteBold(fontSize: 16.sp),))],
      ),
    );
  }

  void _showSnack(BuildContext? context, String message) {
    if (context == null) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message), behavior: SnackBarBehavior.floating));
  }

  @override
  void onClose() {
    _stopTimer?.cancel();
    _recorder.dispose();
    super.onClose();
  }
}
