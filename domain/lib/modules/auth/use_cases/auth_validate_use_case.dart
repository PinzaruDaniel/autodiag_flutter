import 'package:domain/core/usecase.dart';
import 'package:domain/modules/auth/auth_repository.dart';

class AuthValidateUseCase extends UseCaseNoEitherNoParamsNoStream<bool> {
  final AuthRepository authRepository;

  AuthValidateUseCase({required this.authRepository});

  @override
  Future<bool> call() async {
    final accessToken = await authRepository.getAccessToken();
    final refreshToken = await authRepository.getRefreshToken();

    if (accessToken == null || refreshToken == null) {
      return false;
    }

    if (accessToken.trim().isEmpty || refreshToken.trim().isEmpty) {
      return false;
    }

    final result = await authRepository.validate(accessToken, refreshToken);
    final entity = result.fold((_) => null, (value) => value);
    if (entity != null) {
      await authRepository.insertTokens(entity.accessToken ?? '', entity.refreshToken ?? '');
      return true;
    }

    final refreshed = await authRepository.refresh(refreshToken);
    final refreshedEntity = refreshed.fold((_) => null, (value) => value);
    if (refreshedEntity == null) {
      return false;
    }

    await authRepository.insertTokens(refreshedEntity.accessToken ?? '', refreshedEntity.refreshToken ?? '');
    return true;
  }
}
