import 'package:domain/modules/audio/audio_repository.dart';
import 'package:domain/modules/audio/use_cases/clear_audio_cache_use_case.dart';
import 'package:domain/modules/audio/use_cases/get_audio_result_by_id_use_case.dart';
import 'package:domain/modules/audio/use_cases/get_audio_results_use_case.dart';
import 'package:domain/modules/audio/use_cases/get_cached_audio_results_use_case.dart';
import 'package:domain/modules/audio/use_cases/send_audio_use_case.dart';
import 'package:get_it/get_it.dart';

Future<void> init() async {
  final dataDi = GetIt.instance;

  dataDi.registerLazySingleton<SendAudioUseCase>(
    () => SendAudioUseCase(audioRepository: dataDi<AudioRepository>()),
  );

  dataDi.registerLazySingleton<GetAudioResultsUseCase>(
    () => GetAudioResultsUseCase(audioRepository: dataDi<AudioRepository>()),
  );

  dataDi.registerLazySingleton<GetAudioResultByIdUseCase>(
    () => GetAudioResultByIdUseCase(audioRepository: dataDi<AudioRepository>()),
  );

  dataDi.registerLazySingleton<GetCachedAudioResultsUseCase>(
    () => GetCachedAudioResultsUseCase(audioRepository: dataDi<AudioRepository>()),
  );

  dataDi.registerLazySingleton<ClearAudioCacheUseCase>(
    () => ClearAudioCacheUseCase(audioRepository: dataDi<AudioRepository>()),
  );
}

