import 'package:flutter/material.dart';
import 'package:jumping_dot/jumping_dot.dart';
import 'package:scape/core/utils/styles/app_colors.dart';

Future<void> popupLoading(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        child: JumpingDots(
          innerPadding: 3,
          color: AppColors.orange,
          radius: 20,
          numberOfDots: 5,
        ),
      );
    },
  );
}
