import 'package:get/get.dart';
import 'package:presentation/controllers/auth_controller.dart';

import '../main_app_controller.dart';

class RootBindings extends Bindings {
  @override
  void dependencies() {
    Get.putAsync<MainAppController>(() async => MainAppController(), permanent: true);
    Get.putAsync<AuthController>(() async => AuthController(), permanent: true);
  }
}
