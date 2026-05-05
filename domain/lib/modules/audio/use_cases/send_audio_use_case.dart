import 'dart:io';

import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/core/usecase.dart';
import 'package:domain/modules/audio/audio_repository.dart';
import 'package:domain/modules/audio/models/index.dart';

class SendAudioUseCase extends UseCase<AudioResultsEntity, SendAudioParams> {
  SendAudioUseCase({required this.audioRepository});

  final AudioRepository audioRepository;

  @override
  Future<Either<Failure, AudioResultsEntity>> call(SendAudioParams params) async {
    return await audioRepository.sendAudio(params.file);
  }
}

class SendAudioParams {
  final File file;

  SendAudioParams({required this.file});
}

