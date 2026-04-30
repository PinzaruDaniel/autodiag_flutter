import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:presentation/resources/text_styles.dart';
import 'package:presentation/utils/widgets/base/base_app_bar_widget.dart';
import 'package:presentation/utils/widgets/base/base_page.dart';
import 'package:presentation/utils/widgets/button_widget.dart';
import 'package:presentation/utils/widgets/icon_container_widget.dart';
import 'package:presentation/utils/widgets/text_form_field_widget.dart';

import '../../resources/app_colors.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return BasePage(
      resizeToAvoidBottomInset: true,
      appBar: BaseAppBarWidget(),
      extendBody: true,
      pendingIds: [''],
      builder: (context) {
        return SingleChildScrollView(
          child: Padding(
            padding: .symmetric(vertical: 16.h, horizontal: 16.w),
            child: Column(
              mainAxisAlignment: .start,
              children: [
                36.verticalSpace,
                Row(
                  mainAxisAlignment: .center,
                  children: [
                    IconContainerWidget(iconData: Icons.email_outlined)
                  ],
                ),
                40.verticalSpace,
                Text('Reset your password', style: TextStyles.whiteBold(fontSize: 20.sp)),
                12.verticalSpace,
                Text(
                  'Enter your email and we\'ll send you a link to reset your password',
                  style: TextStyles.baseTextStyle,
                  textAlign: .center,
                ),
                40.verticalSpace,

                TextFormFieldWidget(
                  prefixIcon: Icon(Icons.email_outlined, color: AppColors.hintColor),
                  hintText: 'Email',
                  textEditingController: .new(),
                ),
                32.verticalSpace,

                ButtonWidget(
                  onTap: () {},
                  title: 'Send resetLink',
                  linearGradient: LinearGradient(colors: [AppColors.primary, AppColors.secondary]),
                  boxShadow: BoxShadow(color: AppColors.primary.withAlpha(100), blurRadius: 6, spreadRadius: 2),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
