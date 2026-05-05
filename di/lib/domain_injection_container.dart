import 'package:di/domain/auth_injection_container.dart' as auth;
import 'package:di/domain/audio_injection_container.dart' as audio;

Future<void> initDomain() async {
  auth.init();
  audio.init();
}
