import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:scape/core/utils/string_constants.dart';
import 'package:scape/core/utils/styles/app_colors.dart';
import 'package:scape/core/utils/styles/dimensions.dart';
import 'package:scape/core/utils/styles/text_styles.dart';

import '../../../src/profile/presentation/bloc/profile_bloc.dart';
import 'custom_text.dart';

Future<void> popupMessageWidget(
  BuildContext context,
  String message, {
  Color? textColor,
  void Function()? onTap,
}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Kstyles().med12(
              text: message,
              color: textColor ?? AppColors.red,
            ),
            KDimension().kHeight15,
            SizedBox(
              width: 80,
              height: 35,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                onPressed: onTap ??
                    () {
                      context.pop();
                    },
                child: const Text(
                  StringConst.ok,
                ),
              ),
            ),
          ],
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      );
    },
  );
}

Future<void> popUpEditProfile(
  BuildContext context,
  String headerTitle, {
  Color? textColor,
  TextEditingController? nameController,
  TextEditingController? lastNameController,
  TextEditingController? emailController,
  VoidCallback? saveName,
  VoidCallback? saveEmail,
}) {
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      context.read<ProfileBloc>().add(ResetEditProfileError());

      return BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return AlertDialog(
            shape: const BeveledRectangleBorder(),
            backgroundColor: AppColors.white,
            content: SizedBox(
              width: 400,
              child: Stack(
                children: [
                  Positioned(
                    right: 10,
                    top: 10,
                    child: IconButton(
                      icon: Icon(
                        Icons.close,
                        color: AppColors.red,
                        size: getValueForScreenType(
                          context: context,
                          mobile: 20,
                          tablet: 25,
                          desktop: 30,
                        ),
                      ),
                      onPressed: () => context.pop(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        KDimension().kHeight30,
                        Kstyles().bold14(
                          text: headerTitle,
                          color: textColor ?? AppColors.black,
                        ),
                        KDimension().kHeight15,
                        Kstyles().med12(
                          text: StringConst.firstName,
                          color: textColor ?? AppColors.black,
                        ),
                        KDimension().kHeight05,
                        CustomWidgets.commonTextField(
                            textEditingController: nameController,
                            hintText: StringConst.enterYourFirstName),
                        KDimension().kHeight10,
                        Kstyles().med12(
                          text: StringConst.lastName,
                          color: textColor ?? AppColors.black,
                        ),
                        KDimension().kHeight05,
                        CustomWidgets.commonTextField(
                            textEditingController: lastNameController,
                            hintText: StringConst.enterYourLastName),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Kstyles().med12(
                            text: state.editNameError,
                            color: AppColors.darkRed,
                          ),
                        ),
                        KDimension().kHeight10,
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            width: 120,
                            height: 40,
                            child: ElevatedButton(
                              style: const ButtonStyle(
                                alignment: Alignment.centerRight,
                                backgroundColor:
                                    WidgetStatePropertyAll(AppColors.orange),
                                shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                    side: BorderSide.none,
                                  ),
                                ),
                              ),
                              onPressed: saveName,
                              child: Center(
                                child: Kstyles().semibold(
                                  text: 'SAVE NAME',
                                  size: 13,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        KDimension().kHeight30,
                        Kstyles().med12(
                          text: StringConst.email,
                          color: textColor ?? AppColors.black,
                        ),
                        KDimension().kHeight05,
                        CustomWidgets.commonTextField(
                            textEditingController: emailController,
                            hintText: StringConst.enterYourEmail),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Kstyles().med12(
                            text: state.editEmailError,
                            color: AppColors.darkRed,
                          ),
                        ),
                        KDimension().kHeight10,
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            width: 120,
                            height: 40,
                            child: ElevatedButton(
                              style: const ButtonStyle(
                                alignment: Alignment.centerRight,
                                backgroundColor:
                                    WidgetStatePropertyAll(AppColors.orange),
                                shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                    side: BorderSide.none,
                                  ),
                                ),
                              ),
                              onPressed: saveEmail,
                              child: Center(
                                child: Kstyles().semibold(
                                  text: 'SAVE EMAIL',
                                  size: 13,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        KDimension().kHeight30,
                      ],
                    ),
                  ),
                ],
              ),
            ),
            contentPadding: EdgeInsets.zero,
          );
        },
      );
    },
  );
}

Future<void> popUpConfirmOtp(
  BuildContext context,
  String message, {
  Color? textColor,
}) {
  final TextEditingController otpController = TextEditingController();
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return AlertDialog(
            shape: const BeveledRectangleBorder(),
            backgroundColor: AppColors.white,
            content: SizedBox(
              width: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Kstyles().bold(
                    size: 18,
                    text: message,
                    color: textColor ?? AppColors.black,
                  ),
                  KDimension().kHeight15,
                  CustomWidgets.commonTextField(
                      textEditingController: otpController,
                      hintText: StringConst.otpHint),
                  KDimension().kHeight10,
                  Kstyles().med(
                    text: "A one-time password will be sent to your email.",
                    size: 14,
                  ),
                  Kstyles().med14(
                    text: state.errorMessage,
                    color: AppColors.darkRed,
                  ),
                  KDimension().kHeight20,
                  Row(
                    children: [
                      ElevatedButton(
                        style: const ButtonStyle(
                          alignment: Alignment.centerRight,
                          padding: WidgetStatePropertyAll(
                            EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                          ),
                          backgroundColor:
                              WidgetStatePropertyAll(AppColors.white),
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              side: BorderSide(color: AppColors.black),
                            ),
                          ),
                        ),
                        onPressed: () {
                          context.pop();
                        },
                        child: Center(
                          child: Kstyles().semibold(
                            text: 'CANCEL',
                            size: 13,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                      KDimension().kWidth10,
                      ElevatedButton(
                        style: const ButtonStyle(
                          alignment: Alignment.centerRight,
                          padding: WidgetStatePropertyAll(
                            EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                          ),
                          backgroundColor:
                              WidgetStatePropertyAll(AppColors.orange),
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              side: BorderSide.none,
                            ),
                          ),
                        ),
                        onPressed: () {
                          context.read<ProfileBloc>().add(
                                ConfirmOtpForEmail(
                                  otpController.text,
                                  context,
                                ),
                              );
                        },
                        child: Center(
                          child: Kstyles().semibold(
                            text: StringConst.confirm,
                            size: 13,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          );
        },
      );
    },
  );
}
