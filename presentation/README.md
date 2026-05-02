# presentation

A new Flutter project.

## Audio Recording

The Home screen mic button records a short (7s) audio clip using the `record` plugin.

Permissions:
- Android: `android.permission.RECORD_AUDIO` in `presentation/android/app/src/main/AndroidManifest.xml`
- iOS: `NSMicrophoneUsageDescription` in `presentation/ios/Runner/Info.plist`

You can adjust the recording duration in `presentation/lib/controllers/home_controller.dart`.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
