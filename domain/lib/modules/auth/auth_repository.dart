import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/modules/auth/models/index.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthTokensEntity>> login(String email, String password);
  Future<Either<Failure, AuthTokensEntity>> register(String email, String password);
  Future<Either<Failure, AuthTokensEntity>> resetPassword(String email, String password);
  Future<void> insertTokens(String accessToken, String refreshToken);
  Future<void> deleteTokens();
}
