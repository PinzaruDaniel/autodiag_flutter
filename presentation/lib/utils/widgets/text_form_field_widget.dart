import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:presentation/resources/app_colors.dart';
import 'package:presentation/resources/text_styles.dart';

class TextFormFieldWidget extends StatefulWidget {
  final String? hintText;
  final String? labelText;
  final TextInputType? textInputType;
  final TextEditingController textEditingController;
  final List<String>? autofillHints;
  final Widget? prefixIcon;
  final Function(String?)? validator;
  final bool isPassword;

  const TextFormFieldWidget({
    super.key,
    this.hintText,
    this.labelText,
    this.textInputType,
    this.autofillHints,
    this.validator,
    this.isPassword = false,
    required this.textEditingController,
    this.prefixIcon,
  });

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  bool isObscure = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormField(
          builder: (state) {
            return TextFormField(
              autofillHints: widget.autofillHints,
              controller: widget.textEditingController,
              style: TextStyles.baseTextStyle,
              validator: (value) => widget.validator?.call(value),
              obscureText: widget.isPassword ? isObscure : false,
              decoration: InputDecoration(
                prefixIcon: widget.prefixIcon,
                suffixIcon: widget.isPassword
                    ? IconButton(
                        color: AppColors.hintColor,
                        onPressed: () {
                          isObscure = !isObscure;
                          setState(() {});
                        },
                        icon: Icon( isObscure ? Icons.visibility_off_outlined : Icons.visibility_outlined, color: AppColors.hintColor, size: 20.w),
                      )
                    : null,
                hintText: widget.hintText,

                filled: true,
                fillColor: AppColors.onBackground,
                hintStyle: TextStyle(color: AppColors.hintColor),
                border: OutlineInputBorder(
                  borderRadius: .circular(25.r),
                  borderSide: BorderSide(color: AppColors.borderColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: .circular(25.r),
                  borderSide: BorderSide(color: AppColors.borderColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: .circular(25.r),
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
