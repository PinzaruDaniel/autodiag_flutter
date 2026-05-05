import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/core/usecase.dart';
import 'package:domain/modules/audio/audio_repository.dart';
import 'package:domain/modules/audio/models/index.dart';

class GetAudioResultsUseCase extends UseCase<ListAudioResultsEntity, GetAudioResultsParams> {
  GetAudioResultsUseCase({required this.audioRepository});

  final AudioRepository audioRepository;

  @override
  Future<Either<Failure, ListAudioResultsEntity>> call(GetAudioResultsParams params) {
    return audioRepository.getResults(page: params.page, forceRefresh: params.forceRefresh);
  }
}

class GetAudioResultsParams {
  final int page;
  final bool forceRefresh;

  GetAudioResultsParams({required this.page, this.forceRefresh = false});
}

