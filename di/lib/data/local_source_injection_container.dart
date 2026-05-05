import 'package:data/core/objectbox_store.dart';
import 'package:data/modules/auth/sources/local/auth_local_source.dart';
import 'package:data/modules/audio/sources/local/audio_local_source.dart';
import 'package:get_it/get_it.dart';

Future<void> init() async {
  var dataDi = GetIt.instance;
  final store = await ObjectBoxStore.create();
  dataDi.registerLazySingleton<AuthLocalSource>(() => AuthLocalSourceImpl(authTokenBox: store.authTokenBox));
  dataDi.registerLazySingleton<AudioLocalSource>(
    () => AudioLocalSourceImpl(
      audioResultBox: store.audioResultBox,
      audioPredictionBox: store.audioPredictionBox,
    ),
  );
}
