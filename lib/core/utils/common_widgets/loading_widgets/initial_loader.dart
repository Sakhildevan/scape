import 'package:flutter/material.dart';
import 'package:scape/core/utils/styles/app_colors.dart';

class InitialLoader extends StatelessWidget {
  const InitialLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LinearProgressIndicator(
        color: AppColors.darkGrey,
        backgroundColor: AppColors.grey,
        minHeight: 10,
      ),
    );
  }
}
