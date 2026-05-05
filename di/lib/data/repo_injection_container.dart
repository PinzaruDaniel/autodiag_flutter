import 'package:data/modules/auth/auth_repository_impl.dart';
import 'package:data/modules/auth/sources/local/auth_local_source.dart';
import 'package:data/modules/auth/sources/remote/auth_api_service.dart';
import 'package:data/modules/audio/audio_repository_impl.dart';
import 'package:data/modules/audio/sources/local/audio_local_source.dart';
import 'package:data/modules/audio/sources/remote/audio_api_service.dart';
import 'package:domain/modules/auth/auth_repository.dart';
import 'package:domain/modules/audio/audio_repository.dart';
import 'package:get_it/get_it.dart';

Future<void> init() async {
  var dataDi = GetIt.instance;

  dataDi.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(apiService: dataDi<AuthApiService>(), localSource: dataDi<AuthLocalSource>()),
  );

  dataDi.registerLazySingleton<AudioRepository>(
    () => AudioRepositoryImpl(apiService: dataDi<AudioApiService>(), localSource: dataDi<AudioLocalSource>()),
  );
}
