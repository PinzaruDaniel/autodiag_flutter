import 'package:domain/core/usecase.dart';
import 'package:domain/modules/audio/audio_repository.dart';

class ClearAudioCacheUseCase extends UseCaseNoEitherNoParamsNoStream<void> {
  ClearAudioCacheUseCase({required this.audioRepository});

  final AudioRepository audioRepository;

  @override
  Future<void> call() {
    return audioRepository.clearCachedResults();
  }
}

