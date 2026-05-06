import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:domain/modules/auth/use_cases/auth_login_use_case.dart';
import 'package:domain/modules/auth/use_cases/auth_register_use_case.dart';
import 'package:domain/modules/auth/use_cases/auth_reset_password_use_case.dart';
import 'package:presentation/controllers/controller_imports.dart';
import 'package:presentation/utils/constants/pending_ids.dart';

class AuthController extends GetxController {
  final AuthLoginUseCase _authLoginUseCase = GetIt.instance<AuthLoginUseCase>();
  final AuthRegisterUseCase _authRegisterUseCase = GetIt.instance<AuthRegisterUseCase>();
  final AuthResetPasswordUseCase _authResetPasswordUseCase = GetIt.instance<AuthResetPasswordUseCase>();

  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();
  final TextEditingController registerEmailController = TextEditingController();
  final TextEditingController registerPasswordController = TextEditingController();
  final TextEditingController registerConfirmPasswordController = TextEditingController();
  final TextEditingController resetEmailController = TextEditingController();
  final TextEditingController resetPasswordController = TextEditingController();
  final TextEditingController resetConfirmPasswordController = TextEditingController();

  final RxBool isPasswordVisible = false.obs;

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> resetFormKey = GlobalKey<FormState>();

  final RegExp _emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

  void toggleVisibilityPassword() {
    isPasswordVisible.toggle();
  }

  String? validateEmail(String? value) {
    final email = value?.trim() ?? '';
    if (email.isEmpty) {
      return 'Email is required.';
    }
    if (!_emailRegex.hasMatch(email)) {
      return 'Invalid email format.';
    }
    return null;
  }

  String? validatePassword(String? value) {
    final password = value ?? '';
    if (password.isEmpty) {
      return 'Password is required.';
    }
    if (password.length < 6) {
      return 'Password must be at least 6 characters.';
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    final confirm = value ?? '';
    if (confirm.isEmpty) {
      return 'Please confirm your password.';
    }
    if (confirm != registerPasswordController.text) {
      return 'Passwords do not match.';
    }
    return null;
  }

  String? validateResetConfirmPassword(String? value) {
    final confirm = value ?? '';
    if (confirm.isEmpty) {
      return 'Please confirm your password.';
    }
    if (confirm != resetPasswordController.text) {
      return 'Passwords do not match.';
    }
    return null;
  }

  Future<void> login({required BuildContext context, VoidCallback? onSuccess}) async {
    final isValid = loginFormKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }

    final email = loginEmailController.text.trim();
    final password = loginPasswordController.text;

    mainAppController.addPendingIds([PendingIds.login]);
    final result = await _authLoginUseCase(AuthLoginParams(email: email, password: password));
    result.fold(
      (failure) => _showSnack(context, failure.message),
      (_) => onSuccess?.call(),
    );
    mainAppController.removePendingIds([PendingIds.login]);
  }

  Future<void> register({required BuildContext context, VoidCallback? onSuccess}) async {
    final isValid = registerFormKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }

    final email = registerEmailController.text.trim();
    final password = registerPasswordController.text;
    final confirmPassword = registerConfirmPasswordController.text;


    mainAppController.addPendingIds([PendingIds.register]);
    final result = await _authRegisterUseCase(AuthRegisterParams(email: email, password: password));
    result.fold(
      (failure) => _showSnack(context, failure.message),
      (_) => onSuccess?.call(),
    );
    mainAppController.removePendingIds([PendingIds.register]);
  }

  Future<void> resetPassword({required BuildContext context, VoidCallback? onSuccess}) async {
    final isValid = resetFormKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }

    final email = resetEmailController.text.trim();
    final password = resetPasswordController.text;

    mainAppController.addPendingIds([PendingIds.resetPassword]);
    final result = await _authResetPasswordUseCase(AuthResetPasswordParams(email: email, password: password));
    result.fold(
      (failure) => _showSnack(context, failure.message),
      (_) => onSuccess?.call(),
    );
    mainAppController.removePendingIds([PendingIds.resetPassword]);
  }

  void _showSnack(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  void onClose() {
    loginEmailController.dispose();
    loginPasswordController.dispose();
    registerEmailController.dispose();
    registerPasswordController.dispose();
    registerConfirmPasswordController.dispose();
    resetEmailController.dispose();
    resetPasswordController.dispose();
    resetConfirmPasswordController.dispose();
    super.onClose();
  }
}