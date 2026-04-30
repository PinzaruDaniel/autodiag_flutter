import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../resources/app_colors.dart';

class BaseAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.hintColor),
        onPressed: () => Get.back(),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
