import 'package:common/constants/app_constants.dart';
import 'package:data/modules/auth/sources/remote/auth_api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

Future<void> init({required Function onSessionExpired}) async {
  var apiClientOption = BaseOptions(
    baseUrl: AppConstants.baseUrl,
    receiveTimeout: Duration(seconds: 60),
    connectTimeout: Duration(seconds: 20),
  );
  var authClient = Dio(apiClientOption);
  authClient.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

  GetIt.instance.registerLazySingleton<AuthApiService>(() => AuthApiService(authClient));
}
