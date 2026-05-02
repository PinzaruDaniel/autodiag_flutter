import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

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
  })  : _recorder = recorder ?? RecordAudioRecorderClient(),
        _directoryProvider = directoryProvider ?? PathProviderDirectoryProvider(),
        _maxDuration = maxDuration ?? const Duration(seconds: 7);

  final AudioRecorderClient _recorder;
  final DirectoryProvider _directoryProvider;
  final Duration _maxDuration;

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
    final path = '${directory.path}/recording_${DateTime.now().millisecondsSinceEpoch}.m4a';

    await _recorder.start(const RecordConfig(), path: path);
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
  }

  void _showSnack(BuildContext? context, String message) {
    if (context == null) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  void onClose() {
    _stopTimer?.cancel();
    _recorder.dispose();
    super.onClose();
  }
}

