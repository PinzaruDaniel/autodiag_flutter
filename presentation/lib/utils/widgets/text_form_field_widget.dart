import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:presentation/resources/app_colors.dart';
import 'package:presentation/resources/text_styles.dart';

class TextFormFieldWidget extends StatefulWidget {
  final String? hintText;
  final String? labelText;
  final TextInputType? textInputType;
  final TextEditingController textEditingController;
  final Function(String?)? validator;

  const TextFormFieldWidget({
    super.key,
    this.hintText,
    this.labelText,
    this.textInputType,
    this.validator,
    required this.textEditingController,
  });

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormField(
          builder: (state) {
            return TextFormField(
              controller: widget.textEditingController,
              style: TextStyles.baseTextStyle,
              validator: (value) => widget.validator?.call(value),
              decoration: InputDecoration(
                hintText: widget.hintText,
                filled: true,
                fillColor: AppColors.onBackground,
                hintStyle: TextStyle(color: AppColors.hintColor),
                border: OutlineInputBorder(
                  borderRadius: .circular(10.r),
                  borderSide: BorderSide(color: AppColors.borderColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: .circular(10.r),
                  borderSide: BorderSide(color: AppColors.borderColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: .circular(10.r),
                  borderSide: BorderSide(color: AppColors.primary, width: 2.w),
                ),
              ),
              onChanged: (value) {
                state.didChange(value);
              },
              onTapOutside: (_) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
            );
          },
        ),
      ],
    );
  }
}
