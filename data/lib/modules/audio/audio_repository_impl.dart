import 'dart:io';

import 'package:common/constants/failure_class.dart';
import 'package:common/constants/logger.dart';
import 'package:dartz/dartz.dart';
import 'package:data/mapper/audio_results_mapper.dart';
import 'package:data/modules/audio/sources/local/audio_local_source.dart';
import 'package:data/modules/audio/sources/remote/audio_api_service.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart' as p;
import 'package:domain/modules/audio/audio_repository.dart';
import 'package:domain/modules/audio/models/index.dart';

class AudioRepositoryImpl implements AudioRepository {
  AudioRepositoryImpl({
    required this.apiService,
    required this.localSource,
  });

  final AudioApiService apiService;
  final AudioLocalSource localSource;

  @override
  Future<Either<Failure, AudioResultsEntity>> sendAudio(File file) async {
    try {
      final contentType = _resolveContentType(file.path);
      final multipartFile = await MultipartFile.fromFile(
        file.path,
        filename: p.basename(file.path),
        contentType: contentType,
      );
      final response = await apiService.sendAudio(multipartFile);

      consoleLog('received response: ${response.predictions}');

      return Right(response.toEntity());
    } catch (e, stackTrace) {
      if (e is DioException) {
        return Left(Failure.dio(e));
      }
      return Left(Failure.error(e, stackTrace));
    }
  }

  @override
  Future<Either<Failure, ListAudioResultsEntity>> getResults({
    required int page,
    bool forceRefresh = false,
  }) async {
    if (!forceRefresh) {
      final cached = await localSource.getResultsByPage(page);
      if (cached.isNotEmpty) {
        return Right(ListAudioResultsEntity(page: page, items: cached.toEntities()));
      }
    }

    try {
      final response = await apiService.getResults({'page': page, 'limit': 20});
      await localSource.saveResultsForPage(page, response.toBoxes());
      return Right(response.toEntity());
    } catch (e, stackTrace) {
      if (e is DioException) {
        return Left(Failure.dio(e));
      }
      return Left(Failure.error(e, stackTrace));
    }
  }

  @override
  Future<Either<Failure, AudioResultsEntity>> getResultById(int id) async {
    try {
      final response = await apiService.getResultById(id);
      return Right(response.toEntity());
    } catch (e, stackTrace) {
      if (e is DioException) {
        return Left(Failure.dio(e));
      }
      return Left(Failure.error(e, stackTrace));
    }
  }

  @override
  Future<Either<Failure, ListAudioResultsEntity>> getCachedResults({
    required int page,
  }) async {
    final cached = await localSource.getResultsByPage(page);
    return Right(ListAudioResultsEntity(page: page, items: cached.toEntities()));
  }

  @override
  Future<void> clearCachedResults() async {
    await localSource.clearResults();
  }

  @override
  Future<Either<Failure, void>> deleteResults() async {
    try {
      await apiService.deleteResults();
      await localSource.clearResults();
      return const Right(null);
    } catch (e, stackTrace) {
      if (e is DioException) {
        return Left(Failure.dio(e));
      }
      return Left(Failure.error(e, stackTrace));
    }
  }

  MediaType _resolveContentType(String path) {
    final ext = p.extension(path).toLowerCase();
    switch (ext) {
      case '.wav':
        return MediaType('audio', 'wav');
      case '.mp3':
        return MediaType('audio', 'mpeg');
      case '.m4a':
        return MediaType('audio', 'mp4');
      case '.ogg':
        return MediaType('audio', 'ogg');
      default:
        return MediaType('application', 'octet-stream');
    }
  }
}
