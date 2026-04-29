import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:presentation/controllers/controller_imports.dart';
import 'package:presentation/resources/app_colors.dart';
import 'package:presentation/resources/text_styles.dart';
import 'package:presentation/utils/routing/app_router.dart';
import 'package:presentation/utils/widgets/base/base_page.dart';
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
                Image.asset('assets/icons/car_icon_only.png', width: 250.w),
                50.verticalSpace,
                Form(
                  child: AutofillGroup(
                    child: Column(
                      crossAxisAlignment: .center,
                      mainAxisAlignment: .center,
                      children: [
                        TextFormFieldWidget(
                          hintText: 'Email',
                          autofillHints: [AutofillHints.newUsername, AutofillHints.username],
                          textEditingController: authController.loginEmailController,
                        ),
                        16.verticalSpace,
                        TextFormFieldWidget(
                          hintText: 'Password',
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
                InkWell(
                  onTap: () => AppRouter.goToHomePage(clearStack: false),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      boxShadow: [BoxShadow(color: AppColors.primary.withAlpha(100), blurRadius: 6, spreadRadius: 2)],
                      borderRadius: .circular(25.r),
                      gradient: LinearGradient(colors: [AppColors.primary, AppColors.secondary]),
                    ),
                    child: Padding(
                      padding: .all(16.w),
                      child: Text('Login', textAlign: TextAlign.center, style: TextStyles.whiteBold),
                    ),
                  ),
                ),
                16.verticalSpace,
                InkWell(
                  onTap: () => AppRouter.goToSignInPage(),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: .circular(25.r),
                      border: .all(color: AppColors.borderColor),
                      color: AppColors.onBackground,
                    ),
                    child: Padding(
                      padding: .all(16.w),
                      child: Text('Create account', textAlign: TextAlign.center, style: TextStyles.whiteBold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
