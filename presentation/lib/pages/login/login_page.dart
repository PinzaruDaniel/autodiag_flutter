import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:presentation/controllers/controller_imports.dart';
import 'package:presentation/resources/app_colors.dart';
import 'package:presentation/resources/text_styles.dart';
import 'package:presentation/utils/routing/app_router.dart';
import 'package:presentation/utils/widgets/base/base_page.dart';
import 'package:presentation/utils/widgets/button_widget.dart';
import 'package:presentation/utils/widgets/text_form_field_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      pendingIds: ['da'],
      builder: (context) {
        return SingleChildScrollView(
          child: Padding(
            padding: .symmetric(horizontal: 16.w),
            child: Column(
              mainAxisAlignment: .center,
              children: [
                20.verticalSpace,
                Image.asset('assets/icons/car_icon_only.png', width: 225.w),
                8.verticalSpace,
                Text('AutoDiag AI', style: TextStyles.whiteBold(fontSize: 26.sp),),
                36.verticalSpace,
                Form(
                  child: AutofillGroup(
                    child: Column(
                      crossAxisAlignment: .center,
                      mainAxisAlignment: .center,
                      children: [
                        TextFormFieldWidget(
                          hintText: 'Email',
                          prefixIcon: Icon(Icons.email_outlined, color: AppColors.hintColor, size: 20.w),
                          autofillHints: [AutofillHints.newUsername, AutofillHints.username],
                          textEditingController: authController.loginEmailController,
                        ),
                        16.verticalSpace,
                        TextFormFieldWidget(
                          hintText: 'Password',
                          isPassword: true,
                          prefixIcon: Icon(Icons.lock_outline_rounded, color: AppColors.hintColor, size: 20.w),
                          autofillHints: [AutofillHints.password],
                          textEditingController: authController.loginPasswordController,
                        ),
                      ],
                    ),
                  ),
                ),
                8.verticalSpace,
                Row(
                  mainAxisAlignment: .end,
                  children: [
                    InkWell(
                      onTap: () => AppRouter.goToResetPasswordPage(),
                      child: Text(
                        'Forgot password?',
                        style: TextStyles.baseTextStyle.copyWith(color: AppColors.primary),
                      ),
                    ),
                  ],
                ),
                36.verticalSpace,
                ButtonWidget(
                  onTap: () => AppRouter.goToHomePage(clearStack: true),
                  title: 'Login',
                  linearGradient: LinearGradient(colors: [AppColors.primary, AppColors.secondary]),
                  boxShadow: BoxShadow(color: AppColors.primary.withAlpha(100), blurRadius: 6, spreadRadius: 2),
                ),
                16.verticalSpace,
                ButtonWidget(
                  onTap: () => AppRouter.goToSignInPage(),
                  title: 'Create account',
                  borderColor: AppColors.borderColor,
                  background: AppColors.onBackground,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
