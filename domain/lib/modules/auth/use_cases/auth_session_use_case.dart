import 'dart:convert';

import 'package:domain/core/usecase.dart';
import 'package:domain/modules/auth/auth_repository.dart';

class AuthSessionUseCase extends UseCaseNoEitherNoParamsNoStream<bool> {
  final AuthRepository authRepository;

  AuthSessionUseCase({required this.authRepository});

  @override
  Future<bool> call() async {
    final refreshToken = await authRepository.getRefreshToken();
    if (refreshToken == null || refreshToken.trim().isEmpty) {
      return false;
    }

    if (_isTokenExpired(refreshToken)) {
      return false;
    }

    return true;
  }

  bool _isTokenExpired(String token) {
    try {
      final parts = token.split('.');
      if (parts.length < 2) {
        return false;
      }

      final payload = _decodeBase64Url(parts[1]);
      final payloadMap = jsonDecode(payload) as Map<String, dynamic>;
      final exp = payloadMap['exp'];
      if (exp is! num) {
        return false;
      }

      final expiry = DateTime.fromMillisecondsSinceEpoch(exp.toInt() * 1000, isUtc: true);
      return DateTime.now().toUtc().isAfter(expiry);
    } catch (_) {
      return false;
    }
  }

  String _decodeBase64Url(String input) {
    final normalized = base64Url.normalize(input);
    return utf8.decode(base64Url.decode(normalized));
  }
}

