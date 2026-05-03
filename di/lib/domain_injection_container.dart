import 'package:di/domain/auth_injection_container.dart' as auth;

Future<void> initDomain() async {
  auth.init();
}
