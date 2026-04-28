import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:presentation/controllers/binding/root_bindings_controllers.dart';
import 'package:presentation/pages/login/login_page.dart';
import 'package:presentation/resources/app_colors.dart';

void main() {
  RootBindings().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (_, context) {
        return MaterialApp(
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
          home: LoginPage(),
        );
      },
    );
  }
}
