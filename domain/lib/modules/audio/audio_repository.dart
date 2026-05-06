import 'dart:io';

import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/modules/audio/models/index.dart';

abstract class AudioRepository {
  Future<Either<Failure, AudioResultsEntity>> sendAudio(File file);

  Future<Either<Failure, ListAudioResultsEntity>> getResults({
    required int page,
    bool forceRefresh = false,
  });

  Future<Either<Failure, AudioResultsEntity>> getResultById(int id);

  Future<Either<Failure, ListAudioResultsEntity>> getCachedResults({
    required int page,
  });

  Future<void> clearCachedResults();
  Future<Either<Failure, void>> deleteResults();
}
