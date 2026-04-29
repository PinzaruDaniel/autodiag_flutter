import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../pages/home/home_page.dart';
import '../../pages/login/login_page.dart';
import '../../pages/reset_password/reset_password_page.dart';
import '../../pages/sign_in/sign_in_page.dart';

class AppRouter {
  static NavigatorState? get _nav => Get.context != null
      ? Navigator.of(Get.context!, rootNavigator: true)
      : null;

  static Future<T?> _push<T>(Widget page) {
    if (_nav == null) return Future.value();
    return _nav!.push<T>(
      CupertinoPageRoute(builder: (_) => page),
    );
  }

  static Future<T?> _pushAndRemoveAll<T>(Widget page) {
    if (_nav == null) return Future.value();
    return _nav!.pushAndRemoveUntil<T>(
      CupertinoPageRoute(builder: (_) => page),
          (route) => false,
    );
  }

  static void pop<T>([T? result]) {
    _nav?.pop(result);
  }

  // ================= ROUTES =================

  static Future<void> goToLoginPage({bool clearStack = true}) {
    return clearStack
        ? _pushAndRemoveAll(const LoginPage())
        : _push(const LoginPage());
  }

  static Future<void> goToHomePage({bool clearStack = true}) {
    return clearStack
        ? _pushAndRemoveAll(const HomePage())
        : _push(const HomePage());
  }

  static Future<void> goToResetPasswordPage() {
    return _push(const ResetPasswordPage());
  }

  static Future<void> goToSignInPage() {
    return _push(const SignInPage());
  }
}