import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:domain/modules/audio/use_cases/delete_audio_results_use_case.dart';
import 'package:domain/modules/auth/use_cases/auth_logout_use_case.dart';
import 'package:presentation/controllers/controller_imports.dart';
import 'package:presentation/utils/constants/pending_ids.dart';
import 'package:presentation/utils/routing/app_router.dart';

class ProfileController extends GetxController {
  ProfileController({
    DeleteAudioResultsUseCase? deleteAudioResultsUseCase,
    AuthLogoutUseCase? authLogoutUseCase,
  })  : _deleteAudioResultsUseCase = deleteAudioResultsUseCase ?? GetIt.instance<DeleteAudioResultsUseCase>(),
        _authLogoutUseCase = authLogoutUseCase ?? GetIt.instance<AuthLogoutUseCase>();

  final DeleteAudioResultsUseCase _deleteAudioResultsUseCase;
  final AuthLogoutUseCase _authLogoutUseCase;

  Future<void> clearHistory({required BuildContext context}) async {
    mainAppController.addPendingIds([PendingIds.clearHistory]);
    final result = await _deleteAudioResultsUseCase();
    result.fold(
      (failure) => _showSnack(context, failure.message),
      (_) => _showSnack(context, 'History cleared successfully.'),
    );
    mainAppController.removePendingIds([PendingIds.clearHistory]);
  }

  Future<void> logout({required BuildContext context}) async {
    mainAppController.addPendingIds([PendingIds.logout]);
    await _authLogoutUseCase();
    mainAppController.removePendingIds([PendingIds.logout]);
    await AppRouter.goToLoginPage(clearStack: true);
  }

  void _showSnack(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}

