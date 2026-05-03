import 'package:di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:domain/modules/auth/use_cases/auth_session_use_case.dart';
import 'package:presentation/controllers/binding/root_bindings_controllers.dart';
import 'package:presentation/pages/home/home_page.dart';
import 'package:presentation/pages/login/login_page.dart';
import 'package:presentation/resources/app_colors.dart';

void main() async{
  bool isSessionExpired = false;
  WidgetsFlutterBinding.ensureInitialized();
  await initDi(onSessionExpired: (){});

  RootBindings().dependencies();
  final hasSession = await GetIt.instance<AuthSessionUseCase>().call();
  runApp(MyApp(initialLoggedIn: hasSession));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.initialLoggedIn});

  final bool initialLoggedIn;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (_, context) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: AppColors.primary,
              selectionColor: AppColors.primary.withAlpha(50),
              selectionHandleColor: AppColors.primary,
            ),
            useMaterial3: true,
          ),
          title: 'AutoDiag AI',
          home: initialLoggedIn ? const HomePage() : const LoginPage(),
        );
      },
    );
  }
}
