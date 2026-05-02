
import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/modules/auth/auth_repository.dart';

import '../../../core/usecase.dart';

class AuthRegisterUseCase extends UseCase<void, AuthRegisterParams> {
  final AuthRepository authRepository;

  AuthRegisterUseCase({required this.authRepository});

  @override
  Future<Either<Failure, void>> call(params) async {
    final result = await authRepository.register(params.email, params.password);

    return result.fold(
          (failure) {
        return Left(failure);
      },
          (entity) {
        return Right(authRepository.insertTokens(entity.accessToken ?? '', entity.refreshToken ?? ''));
      },
    );
  }
}

class AuthRegisterParams {
  final String email;
  final String password;

  AuthRegisterParams({required this.email, required this.password});
}
