import 'package:flutter/material.dart';
import 'package:scape/core/utils/styles/app_colors.dart';

class CustomVerticalDivider extends StatelessWidget {
  const CustomVerticalDivider(
      {super.key, this.height, this.thickness, this.color});

  final double? thickness;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color ?? AppColors.grey,
      width: thickness ?? 0.5,
      height: height,
    );
  }
}
