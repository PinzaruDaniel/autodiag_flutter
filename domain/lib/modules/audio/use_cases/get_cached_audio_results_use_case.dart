import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/core/usecase.dart';
import 'package:domain/modules/audio/audio_repository.dart';
import 'package:domain/modules/audio/models/index.dart';

class GetCachedAudioResultsUseCase
    extends UseCase<ListAudioResultsEntity, GetCachedAudioResultsParams> {
  GetCachedAudioResultsUseCase({required this.audioRepository});

  final AudioRepository audioRepository;

  @override
  Future<Either<Failure, ListAudioResultsEntity>> call(GetCachedAudioResultsParams params) {
    return audioRepository.getCachedResults(page: params.page);
  }
}

class GetCachedAudioResultsParams {
  final int page;

  GetCachedAudioResultsParams({required this.page});
}

