import 'package:common/constants/app_constants.dart';
import 'package:common/constants/session_expired_callback.dart';
import 'package:data/core/auth_interceptor.dart';
import 'package:data/modules/audio/sources/remote/audio_api_service.dart';
import 'package:data/modules/auth/sources/local/auth_local_source.dart';
import 'package:data/modules/auth/sources/remote/auth_api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

Future<void> init({required Function() onSessionExpired}) async {
  var apiClientOption = BaseOptions(
    baseUrl: AppConstants.baseUrl,
    receiveTimeout: Duration(seconds: 60),
    connectTimeout: Duration(seconds: 20),
  );
  var authClient = Dio(apiClientOption);
  authClient.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  GetIt.instance.registerLazySingleton<AuthApiService>(() => AuthApiService(authClient));

  var audioClient = Dio(apiClientOption);
  audioClient.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

  var refreshInterceptor = RefreshInterceptor(
    authApiService: GetIt.instance<AuthApiService>(),
    authLocalSource: GetIt.instance<AuthLocalSource>(),
    onSessionExpired: SessionExpiredCallback(onSessionExpired: onSessionExpired),
  );
  audioClient.interceptors.add(AuthInterceptor(dio: audioClient, refreshInterceptor: refreshInterceptor));
  GetIt.instance.registerLazySingleton<AudioApiService>(() => AudioApiService(audioClient));
}
