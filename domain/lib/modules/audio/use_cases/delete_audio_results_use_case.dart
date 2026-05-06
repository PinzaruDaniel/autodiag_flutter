import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/core/usecase.dart';
import 'package:domain/modules/audio/audio_repository.dart';

class DeleteAudioResultsUseCase extends UseCaseNoParams<void> {
  final AudioRepository audioRepository;

  DeleteAudioResultsUseCase({required this.audioRepository});

  @override
  Future<Either<Failure, void>> call() {
    return audioRepository.deleteResults();
  }
}

