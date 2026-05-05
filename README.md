# AutoDiag AI (Flutter)

AutoDiag AI is a Flutter application for vehicle diagnostics that includes user authentication and a home screen for recording short audio clips from a car. The app currently provides Login/Register/Reset Password flows, a recording UI on the Home tab, and placeholder History/Profile tabs.

## Repository Structure

- `presentation/` — Flutter UI application (entry point, screens, assets)
- `di/` — dependency injection setup
- `domain/` — use cases and entities
- `data/` — repositories, remote/local sources, ObjectBox persistence
- `common/` — shared constants/utilities

## Prerequisites

- Flutter SDK (Dart 3.11.5)
- Android Studio or Xcode (Android and iOS only)

## Setup

```bash
cd presentation
flutter pub get
```

## Configure the Backend API

The API base URL is configured in:

```
common/lib/constants/app_constants.dart
```

Update `AppConstants.baseUrl` to your backend IP address. The backend runs locally, so use your machine's local network IP that your device/emulator can reach. The app expects these endpoints:

- `POST /auth/login`
- `POST /auth/register`
- `POST /auth/reset-password`
- `POST /auth/refresh`

## Run the App

From the `presentation` directory:

```bash
flutter run
```

Examples:

- Android emulator or device: `flutter run`
- iOS simulator or device: `flutter run`

## Permissions & Audio Recording

The Home screen mic button records a short audio clip (default 7 seconds).

- Android permission: `presentation/android/app/src/main/AndroidManifest.xml`
- iOS permission: `presentation/ios/Runner/Info.plist`
- Change duration: `presentation/lib/controllers/home_controller.dart`

## Code Generation (Required)

Run code generation for ObjectBox, Freezed, and Retrofit before building:

```bash
cd data
dart pub get
dart run build_runner build --delete-conflicting-outputs

cd ../domain
dart pub get
dart run build_runner build --delete-conflicting-outputs
```

## Tests (Optional)

```bash
cd presentation
flutter test
```
