import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:presentation/controllers/controller_imports.dart';
import 'package:presentation/resources/app_colors.dart';
import 'package:presentation/utils/widgets/base/base_page.dart';
import 'package:presentation/utils/widgets/text_form_field_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      pendingIds: ['da'],
      builder: (context) {
        return Padding(
          padding: .symmetric(horizontal: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                child: AutofillGroup(
                  child: Column(
                    children: [
                      TextFormFieldWidget(
                        hintText: 'email',
                        textEditingController: authController.loginEmailController,
                      ),
                      16.verticalSpace,
                      TextFormFieldWidget(
                        hintText: 'Password',
                        textEditingController: authController.loginPasswordController,
                      ),
                      36.verticalSpace,
                      InkWell(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: .circular(10.r),
                            gradient: LinearGradient(colors: [AppColors.primary, AppColors.secondary]),
                          ),
                          child: Padding(
                            padding:  .all(16.w),
                            child: Text('Login', textAlign: TextAlign.center,),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
