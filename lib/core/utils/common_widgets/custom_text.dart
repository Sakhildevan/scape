import 'package:flutter/material.dart';
import 'package:scape/core/utils/styles/app_colors.dart';

class CustomWidgets {
  static Widget commonTextField({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    Color? backgroundColor,
    Color? borderColor,
    TextAlign? align,
    int? maxLines,
    double? height,
    TextOverflow? overflow,
    FontStyle? fontStyle,
    TextStyle? hintTextStyle,
    Function()? onTap,
    TextEditingController? textEditingController,
    String? hintText,
    bool? readOnly,
    Widget? suffixIcon,
    TextInputType? keyBoardType,
    void Function(String)? onSubmitted,
    void Function(String)? onChanged,
  }) {
    return Container(
      // height: 50,
      color: backgroundColor ?? AppColors.greyShade,
      child: TextField(
        controller: textEditingController,
        maxLines: 1,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        textInputAction: TextInputAction.go,
        keyboardType: keyBoardType ?? TextInputType.text,
        readOnly: readOnly ?? false,
        decoration: InputDecoration(
          suffixIcon: suffixIcon ?? const SizedBox(),
          // suffix: suffixWidget ?? const SizedBox(),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20),
          hintText: hintText,
          hintStyle: hintTextStyle ??
              TextStyle(
                  fontSize: readOnly == true ? 16 : 12,
                  fontWeight: FontWeight.w600,
                  color: readOnly == true ? AppColors.black : AppColors.grey),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(
              color: borderColor ?? AppColors.orange,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(
              color: borderColor ?? AppColors.orange,
            ),
          ),
        ),
        onChanged: onChanged,
        onSubmitted: onSubmitted,
      ),
    );
  }
}
