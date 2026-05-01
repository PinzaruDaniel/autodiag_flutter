import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:presentation/utils/widgets/base/base_page.dart';
import 'package:presentation/utils/widgets/button_widget.dart';
import 'package:presentation/utils/widgets/icon_container_widget.dart';

import '../../resources/app_colors.dart';
import '../../resources/text_styles.dart';
import '../../utils/widgets/base/base_app_bar_widget.dart';
import '../../utils/widgets/text_form_field_widget.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      appBar: BaseAppBarWidget(),
      pendingIds: ['da'],
      builder: (context) {
        return SingleChildScrollView(
          child: Padding(
            padding: .symmetric(vertical: 16.h, horizontal: 16.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: .center,
                  children: [IconContainerWidget(iconData: Icons.person_add_alt_1_outlined)],
                ),
                36.verticalSpace,
                Text('Create a new account', style: TextStyles.whiteBold(fontSize: 20.sp)),
                12.verticalSpace,
                Text(
                  'Enter your email and password to create a new account',
                  style: TextStyles.baseTextStyle,
                  textAlign: .center,
                ),
                36.verticalSpace,
                Form(
                  child: Column(
                    children: [
                      TextFormFieldWidget(
                        prefixIcon: Icon(Icons.email_outlined, color: AppColors.hintColor),
                        hintText: 'Email',
                        textEditingController: .new(),
                      ),
                      16.verticalSpace,
                      TextFormFieldWidget(
                        prefixIcon: Icon(Icons.lock_outline_rounded, color: AppColors.hintColor),
                        hintText: 'New password',
                        textEditingController: .new(),
                      ),
                      16.verticalSpace,
                      TextFormFieldWidget(
                        prefixIcon: Icon(Icons.lock_reset_outlined, color: AppColors.hintColor),
                        hintText: 'Confirm new password',
                        textEditingController: .new(),
                      ),
                      32.verticalSpace,
                      ButtonWidget(
                        onTap: () {},
                        title: 'Create a new account',
                        linearGradient: LinearGradient(colors: [AppColors.primary, AppColors.secondary]),
                        boxShadow: BoxShadow(color: AppColors.primary.withAlpha(100), blurRadius: 6, spreadRadius: 2),
                      ),
                    ],
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
