import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:scape/core/utils/common_widgets/custom_text.dart';
import 'package:scape/core/utils/extensions.dart';
import 'package:scape/core/utils/string_constants.dart';
import 'package:scape/core/utils/styles/app_colors.dart';
import 'package:scape/core/utils/styles/dimensions.dart';
import 'package:scape/core/utils/styles/font_constants.dart';
import 'package:scape/core/utils/styles/text_styles.dart';
import 'package:scape/src/otp-verification-view/presentation/bloc/otp_verification_bloc.dart';
import 'package:scape/src/registration/presentation/bloc/registration_bloc.dart';

class OtpWidget extends StatelessWidget {
  final String email;
  const OtpWidget({
    super.key,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return _buildContent(context: context);
  }

  Widget _buildContent({required BuildContext context}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: "Check your email at ",
            style: GoogleFonts.openSans(
                fontSize: getValueForScreenType(
                  context: context,
                  mobile: 14,
                  desktop: 16,
                ),
                color: AppColors.black,
                fontWeight: FontConst().mediumFont),
            children: [
              WidgetSpan(
                child: Text(
                  email,
                  style: GoogleFonts.openSans(
                    fontSize: getValueForScreenType(
                      context: context,
                      mobile: 14,
                      desktop: 16,
                    ),
                    fontWeight: FontConst().mediumFont,
                    color: AppColors.orange,
                  ),
                ),
              ),
              TextSpan(
                text: " for the one-time verification code.",
                style: GoogleFonts.openSans(
                    fontSize: getValueForScreenType(
                      context: context,
                      mobile: 14,
                      desktop: 16,
                    ),
                    color: AppColors.black,
                    fontWeight: FontConst().mediumFont),
              ),
            ],
          ),
        ),
        // Kstyles().med(
        //   text: StringConst.pleaseProvideTheOTP,
        //   color: AppColors.black,
        //   maxLines: 2,
        //   size: getValueForScreenType(
        //     context: context,
        //     mobile: 14,
        //     desktop: 16,
        //   ),
        // ),
        // Kstyles().med(
        //   text: email,
        //   color: AppColors.orange,
        //   maxLines: 2,
        //   size: getValueForScreenType(
        //     context: context,
        //     mobile: 14,
        //     desktop: 16,
        //   ),
        // ),
        KDimension().kHeight15,
        CustomWidgets.commonTextField(
          backgroundColor: AppColors.white,
          hintText: StringConst.otpHint,
          hintTextStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            color: AppColors.grey,
          ),
          borderColor: AppColors.transparent,
          onChanged: (value) {
            //Store Otp in State
            context.read<OtpVerificationBloc>().add(StoreOtp(
                  otp: value.removeAllWhitespace(),
                ));
          },
        ),
        KDimension().kHeight15,
        BlocBuilder<OtpVerificationBloc, OtpVerificationState>(
          builder: (context, state) {
            return state.otpError
                ? Kstyles().med(
                    text: StringConst.otpError,
                    color: AppColors.red,
                    maxLines: 3,
                    size: getValueForScreenType(
                      context: context,
                      mobile: 14,
                      desktop: 16,
                    ),
                  )
                : RichText(
                    text: TextSpan(
                      text:
                          "OTP is valid only for 5 minutes from the time of issuance. \n",
                      style: GoogleFonts.openSans(
                          fontSize: getValueForScreenType(
                            context: context,
                            mobile: 14,
                            desktop: 16,
                          ),
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
                                      LoginWithEmailApiEvent(email: email),
                                    );
                              },
                              child: Text(
                                "Click here ",
                                style: GoogleFonts.openSans(
                                  fontSize: getValueForScreenType(
                                    context: context,
                                    mobile: 14,
                                    desktop: 16,
                                  ),
                                  decoration: TextDecoration.underline,
                                  decorationColor:
                                      AppColors.orange.withOpacity(0.9),
                                  fontWeight: FontConst().mediumFont,
                                  color: AppColors.orange.withOpacity(0.9),
                                ),
                              ),
                            ),
                          ),
                        ),
                        TextSpan(
                          text: " to request for a new one.",
                          style: GoogleFonts.openSans(
                              fontSize: getValueForScreenType(
                                context: context,
                                mobile: 14,
                                desktop: 16,
                              ),
                              color: AppColors.black,
                              fontWeight: FontConst().mediumFont),
                        ),
                      ],
                    ),
                  );
          },
        ),
      ],
    );
  }
}
