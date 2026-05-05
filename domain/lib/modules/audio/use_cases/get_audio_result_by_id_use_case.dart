import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/core/usecase.dart';
import 'package:domain/modules/audio/audio_repository.dart';
import 'package:domain/modules/audio/models/index.dart';

class GetAudioResultByIdUseCase extends UseCase<AudioResultsEntity, GetAudioResultByIdParams> {
  GetAudioResultByIdUseCase({required this.audioRepository});

  final AudioRepository audioRepository;

  @override
  Future<Either<Failure, AudioResultsEntity>> call(GetAudioResultByIdParams params) {
    return audioRepository.getResultById(params.id);
  }
}

class GetAudioResultByIdParams {
  final int id;

  GetAudioResultByIdParams({required this.id});
}

