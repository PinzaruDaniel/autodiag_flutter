import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:presentation/controllers/profile_controller.dart';
import 'package:presentation/resources/app_colors.dart';
import 'package:presentation/resources/text_styles.dart';
import 'package:presentation/utils/constants/pending_ids.dart';
import 'package:presentation/utils/widgets/base/base_page.dart';
import 'package:presentation/utils/widgets/button_widget.dart';
import 'package:presentation/utils/widgets/icon_container_widget.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return BasePage(
      pendingIds: const [PendingIds.clearHistory, PendingIds.logout],
      builder: (context) {
        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [const IconContainerWidget(iconData: Icons.person)],
              ),
              24.verticalSpace,
              Text('Profile', style: TextStyles.whiteBold(fontSize: 20.sp)),
              8.verticalSpace,
              Text('Manage your account', style: TextStyles.baseTextStyle),
              32.verticalSpace,
              ButtonWidget(
                onTap: () => controller.clearHistory(context: context),
                title: 'Clear history',
                linearGradient: LinearGradient(colors: [AppColors.primary, AppColors.secondary]),
                boxShadow: BoxShadow(color: AppColors.primary.withAlpha(100), blurRadius: 6, spreadRadius: 2),
              ),
              16.verticalSpace,
              ButtonWidget(
                onTap: () => controller.logout(context: context),
                title: 'Logout',
                background: AppColors.onBackground,
                borderColor: AppColors.borderColor,
                textStyle: TextStyles.whiteBold(),
              ),
            ],
          ),
        );
      },
    );
  }
}
