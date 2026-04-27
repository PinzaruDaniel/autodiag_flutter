import 'package:get/get.dart';

import '../main_app_controller.dart';

class RootBindings extends Bindings{
  @override
  void dependencies() {
    Get.putAsync<MainAppController>(() async => MainAppController(), permanent: true);
  }
}