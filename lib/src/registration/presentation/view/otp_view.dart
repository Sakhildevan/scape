import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:scape/core/utils/common_widgets/custom_view/animated_button.dart';
import 'package:scape/core/utils/extensions.dart';
import 'package:scape/core/utils/string_constants.dart';
import 'package:scape/core/utils/styles/app_colors.dart';
import 'package:scape/core/utils/styles/dimensions.dart';
import 'package:scape/core/utils/styles/font_constants.dart';
import 'package:scape/core/utils/styles/text_styles.dart';
import 'package:scape/src/registration/presentation/bloc/registration_bloc.dart';
import '../../../../core/utils/common_widgets/custom_text.dart';

class OTPView extends StatefulWidget {
  const OTPView({super.key});

  @override
  State<OTPView> createState() => _OTPViewState();
}

class _OTPViewState extends State<OTPView> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ResponsiveBuilder(
              builder: (
                BuildContext context,
                SizingInformation sizingInformation,
              ) =>
                  Container(
                margin: EdgeInsets.symmetric(
                    horizontal:
                        sizingInformation.isMobile || sizingInformation.isTablet
                            ? 25
                            : 0),
                padding: EdgeInsets.symmetric(
                  vertical: sizingInformation.isDesktop ? 30 : 20.0,
                  horizontal: sizingInformation.isDesktop ? 40 : 20.0,
                ),
                decoration: const BoxDecoration(
                  color: AppColors.backgroundColor3,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Kstyles().bold(
                        text: "Enter your One-Time Verification Code",
                        maxLines: 2,
                        size: getValueForScreenType(
                          context: context,
                          mobile: 18,
                          desktop: 22,
                        ),
                      ),
                    ),
                    KDimension().kHeight20,
                    RichText(
                      text: TextSpan(
                        text: "Check your email at ",
                        style: GoogleFonts.openSans(
                            fontSize: 14,
                            color: AppColors.black,
                            fontWeight: FontConst().mediumFont),
                        children: [
                          WidgetSpan(
                            child: Text(
                              state.email,
                              style: GoogleFonts.openSans(
                                fontSize: 14,
                                fontWeight: FontConst().mediumFont,
                                color: AppColors.orange,
                              ),
                            ),
                          ),
                          TextSpan(
                            text: " for the one-time verification code.",
                            style: GoogleFonts.openSans(
                                fontSize: 14,
                                color: AppColors.black,
                                fontWeight: FontConst().mediumFont),
                          ),
                        ],
                      ),
                    ),
                    KDimension().kHeight15,
                    CustomWidgets.commonTextField(
                        backgroundColor: AppColors.white,
                        hintText: StringConst.otpHint,
                        hintTextStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: AppColors.grey,
                        ),
                        borderColor: AppColors.transparent,
                        textEditingController: _textEditingController),
                    KDimension().kHeight15,
                    state.errorMessage.isNotEmpty
                        ? Kstyles().med(
                            text: StringConst.otpError,
                            color: AppColors.red,
                            maxLines: 3,
                            size: 14,
                          )
                        : RichText(
                            text: TextSpan(
                              text:
                                  "OTP is valid only for 5 minutes from the time of issuance. \n",
                              style: GoogleFonts.openSans(
                                  fontSize: 14,
                                  color: AppColors.black,
                                  fontWeight: FontConst().mediumFont),
                              children: [
                                WidgetSpan(
                                  child: MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: GestureDetector(
                                      onTap: () {
                                        // resend otp by calling loginWithEmail api
                                        context.read<RegistrationBloc>().add(
                                              LoginWithEmailApiEvent(
                                                  email: state.email),
                                            );
                                      },
                                      child: Text(
                                        "Click here ",
                                        style: GoogleFonts.openSans(
                                          fontSize: 14,
                                          decoration: TextDecoration.underline,
                                          decorationColor:
                                              AppColors.orange.withOpacity(0.9),
                                          fontWeight: FontConst().mediumFont,
                                          color:
                                              AppColors.orange.withOpacity(0.9),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                TextSpan(
                                  text: " to request for a new one.",
                                  style: GoogleFonts.openSans(
                                      fontSize: 14,
                                      color: AppColors.black,
                                      fontWeight: FontConst().mediumFont),
                                ),
                              ],
                            ),
                          ),
                    KDimension().kHeight50,
                    _previousNextBtn(context, sizingInformation, state),
                    KDimension().kHeight10,
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _previousNextBtn(BuildContext context,
      SizingInformation sizingInformation, RegistrationState state) {
    // final isMobile = sizingInformation.isMobile;

    Widget buttonsContent =
        // isMobile
        // ? Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: _buildButtons(context, sizingInformation),
        //   )
        // :
        Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: _buildButtons(context, sizingInformation, state),
    );

    return SizedBox(
      width: double.infinity,
      child: Center(
        child: buttonsContent,
      ),
    );
  }

  List<Widget> _buildButtons(BuildContext context,
      SizingInformation sizingInformation, RegistrationState state) {
    return [
      AnimatedTextButton(
        fixedWidth: sizingInformation.isMobile ? 110 : 180,
        text: "Previous".toUpperCase(),
        showSuffixWidget: true,
        onPressed: () {
          context.read<RegistrationBloc>().add(
                CancelClicked(),
              );
        },
        smallDevice: sizingInformation.screenSize.width > 1000 ? false : true,
      ),
      if (sizingInformation.isMobile)
        KDimension().kHeight15, // Vertical spacing for mobile
      AnimatedTextButton(
        fixedWidth: sizingInformation.isMobile ? 110 : 180,
        text: "Next".toUpperCase(),
        showPrefixWidget: true,
        onPressed: () {
          context.read<RegistrationBloc>().add(
                OtpValidationEvent(
                    otp: _textEditingController.text.removeAllWhitespace(),
                    buildContext: context,
                    tempLoginToken: state.tempToken),
              );
        },
        smallDevice: sizingInformation.screenSize.width > 1000 ? false : true,
      ),
    ];
  }
}
