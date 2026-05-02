import 'package:data/modules/auth/models/local/auth_token_box.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import '../objectbox.g.dart';

class ObjectBoxStore {
  late final Store _store;
  late final Box<AuthTokenBox> authTokenBox;
  ObjectBoxStore._create(this._store) {
    authTokenBox = Box<AuthTokenBox>(_store);
  }

  static Future<ObjectBoxStore> create() async {
    final supportDir = await getApplicationSupportDirectory();

    final store = await openStore(
      directory: p.join(supportDir.path, "obx-demo"),
    );

    return ObjectBoxStore._create(store);
  }
}
