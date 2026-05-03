// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:common/constants/failure_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:dartz/dartz.dart';
import 'package:presentation/controllers/auth_controller.dart';
import 'package:presentation/controllers/main_app_controller.dart';
import 'package:presentation/pages/login/login_page.dart';
import 'package:domain/modules/auth/auth_repository.dart';
import 'package:domain/modules/auth/use_cases/auth_login_use_case.dart';
import 'package:domain/modules/auth/use_cases/auth_register_use_case.dart';
import 'package:domain/modules/auth/use_cases/auth_session_use_case.dart';
import 'package:domain/modules/auth/models/index.dart';

class FakeAuthRepository implements AuthRepository {
  @override
  Future<Either<Failure, AuthTokensEntity>> login(String email, String password) async {
    return Right(AuthTokensEntity(accessToken: 'token', refreshToken: 'refresh'));
  }

  @override
  Future<Either<Failure, AuthTokensEntity>> register(String email, String password) async {
    return Right(AuthTokensEntity(accessToken: 'token', refreshToken: 'refresh'));
  }

  @override
  Future<Either<Failure, AuthTokensEntity>> resetPassword(String email, String password) async {
    return Right(AuthTokensEntity(accessToken: 'token', refreshToken: 'refresh'));
  }

  @override
  Future<void> insertTokens(String accessToken, String refreshToken) async {}

  @override
  Future<void> deleteTokens() async {}

  @override
  Future<String?> getAccessToken() async => null;

  @override
  Future<String?> getRefreshToken() async => null;
}

void main() {
  setUp(() {
    Get.testMode = true;
    final getIt = GetIt.instance;
    getIt.reset();
    getIt.registerLazySingleton<AuthRepository>(() => FakeAuthRepository());
    getIt.registerLazySingleton<AuthLoginUseCase>(
      () => AuthLoginUseCase(authRepository: getIt<AuthRepository>()),
    );
    getIt.registerLazySingleton<AuthRegisterUseCase>(
      () => AuthRegisterUseCase(authRepository: getIt<AuthRepository>()),
    );
    getIt.registerLazySingleton<AuthSessionUseCase>(
      () => AuthSessionUseCase(authRepository: getIt<AuthRepository>()),
    );

    Get.deleteAll(force: true);
    Get.put(MainAppController());
    Get.put(AuthController());
  });

  testWidgets('Login page shows title', (WidgetTester tester) async {
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (_, __) => const GetMaterialApp(home: LoginPage()),
      ),
    );

    expect(find.text('AutoDiag AI'), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);
  });
}
