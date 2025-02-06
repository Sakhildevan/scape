import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:scape/core/utils/constants.dart';
import 'package:scape/core/utils/string_constants.dart';
import 'package:scape/core/utils/styles/app_colors.dart';
import 'package:scape/core/utils/styles/dimensions.dart';
import 'package:scape/core/utils/styles/text_styles.dart';

class ErrorView extends StatefulWidget {
  const ErrorView(
      {super.key, required this.errorMessage, required this.tryAgain});
  final String errorMessage;
  final void Function() tryAgain;

  @override
  State<ErrorView> createState() => _ErrorViewState();
}

class _ErrorViewState extends State<ErrorView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: ResponsiveBuilder(builder: (context, sizingInfo) {
        return SizedBox(
          width: Constants.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Kstyles().reg(
                  text: widget.errorMessage,
                  size: 13,
                ),
              ),
              KDimension().kHeight15,
              tryAgainBtn(widget.tryAgain),
            ],
          ),
        );
      }),
    );
  }

  Widget tryAgainBtn(void Function() tryAgain) {
    return ElevatedButton(
      style: const ButtonStyle(
        padding: WidgetStatePropertyAll(
          EdgeInsets.all(20),
        ),
        backgroundColor: WidgetStatePropertyAll(AppColors.white),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            side: BorderSide(color: AppColors.black, width: 2.0),
          ),
        ),
      ),
      onPressed: tryAgain,
      child: Kstyles().semibold(
        text: StringConst.tryAgain,
        size: 13,
      ),
    );
  }
}
