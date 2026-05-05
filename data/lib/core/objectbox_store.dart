import 'package:data/modules/auth/models/local/auth_token_box.dart';
import 'package:data/modules/audio/models/local/audio_result_box.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import '../objectbox.g.dart';

class ObjectBoxStore {
  late final Store _store;
  late final Box<AuthTokenBox> authTokenBox;
  late final Box<AudioResultBox> audioResultBox;
  late final Box<AudioPredictionBox> audioPredictionBox;

  ObjectBoxStore._create(this._store) {
    authTokenBox = Box<AuthTokenBox>(_store);
    audioResultBox = Box<AudioResultBox>(_store);
    audioPredictionBox = Box<AudioPredictionBox>(_store);
  }

  static Future<ObjectBoxStore> create() async {
    final supportDir = await getApplicationSupportDirectory();

    final store = await openStore(
      directory: p.join(supportDir.path, "obx-demo"),
    );

    return ObjectBoxStore._create(store);
  }
}
