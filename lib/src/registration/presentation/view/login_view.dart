import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:scape/core/utils/common_widgets/custom_snackbar.dart';
import 'package:scape/core/utils/common_widgets/custom_view/animated_button.dart';
import 'package:scape/core/utils/common_widgets/loading_widgets/popup_loading.dart';
import 'package:scape/core/utils/enums.dart';
import 'package:scape/core/utils/extensions.dart';
import 'package:scape/core/utils/string_constants.dart';
import 'package:scape/core/utils/styles/app_colors.dart';
import 'package:scape/core/utils/styles/dimensions.dart';
import 'package:scape/core/utils/styles/text_styles.dart';
import 'package:scape/src/email-providing-view/presentation/bloc/email_providing_bloc.dart';
import 'package:scape/src/registration/presentation/bloc/registration_bloc.dart';
import '../../../../core/utils/common_widgets/custom_text.dart';
// import 'dart:html' as html;

class EmailView extends StatefulWidget {
  const EmailView({super.key, required this.emailController});
  final TextEditingController emailController;

  @override
  State<EmailView> createState() => _EmailViewState();
}

class _EmailViewState extends State<EmailView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EmailProvidingBloc, EmailProvidingState>(
      listener: (context, state) {
        if (state.apiStatus == ApiStatus.loading) {
          popupLoading(context);
        } else if (state.apiStatus == ApiStatus.failure) {
          context.pop();
          customErrorSnackBar(context, message: state.errorMessage);
        } else if (state is CheckMemberExistsState) {
          context.pop();
          if (state.memberExists == true) {
            context.read<EmailProvidingBloc>().add(
                  CheckMemberIsActive(
                    widget.emailController.text.removeAllWhitespace(),
                  ),
                );
          } else {
            context.read<RegistrationBloc>().add(ShowRegistrationEvent());
          }
        } else if (state is CheckMemberIsActiveState) {
          context.pop();
          if (state.memberIsActive == true) {
            context.read<RegistrationBloc>().add(
                  LoginWithEmailApiEvent(
                    email: widget.emailController.text.removeAllWhitespace(),
                  ),
                );
          }
        }
      },
      builder: (context, state) {
        return BlocBuilder<RegistrationBloc, RegistrationState>(
          builder: (context, state) {
            return ResponsiveBuilder(
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
                    Kstyles().bold(
                      text: "Login / Sign up".toUpperCase(),
                      size: getValueForScreenType(
                        context: context,
                        mobile: 18,
                        desktop: 22,
                      ),
                    ),
                    KDimension().kHeight50,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: CustomWidgets.commonTextField(
                              backgroundColor: AppColors.white,
                              hintText: StringConst.enterYourEmail,
                              keyBoardType: TextInputType.emailAddress,
                              hintTextStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                color: AppColors.grey,
                              ),
                              borderColor: AppColors.transparent,
                              textEditingController: widget.emailController),
                        ),
                        KDimension().kHeight10,
                        Kstyles().med(
                          text:
                              "A one-time password will be sent to your email.",
                          size: getValueForScreenType(
                            context: context,
                            mobile: 14,
                            desktop: 16,
                          ),
                        ),
                        KDimension().kHeight15,
                        // _reCaptchaIntegration(state),
                        KDimension().kHeight50,
                        _nextBtn(
                          context,
                          sizingInformation,
                        ),
                        KDimension().kHeight80,
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  //!---------(recaptcha integration method)

  // Widget _reCaptchaIntegration(RegistrationState state) {
  //   return Container(
  //     width: 304,
  //     height: 78,
  //     decoration: BoxDecoration(
  //       color: AppColors.captchaBg,
  //       borderRadius: BorderRadius.circular(5),
  //       border: Border.all(
  //         color: AppColors.grey.withValues(alpha: 150),
  //         width: 1,
  //       ),
  //     ),
  //     child: Padding(
  //       padding: const EdgeInsets.symmetric(
  //         horizontal: 10,
  //       ),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         children: <Widget>[
  //           state.captchaLoading
  //               ? Padding(
  //                   padding: const EdgeInsets.only(right: 15),
  //                   child: const SizedBox(
  //                     height: 25,
  //                     width: 25,
  //                     child: CircularProgressIndicator(
  //                       color: AppColors.blue,
  //                     ),
  //                   ),
  //                 )
  //               : GestureDetector(
  //                   onTap: () {
  //                     context.read<RegistrationBloc>().add(
  //                           GetReCaptchaToken(),
  //                         );
  //                   },
  //                   child: AnimatedCheckmark(
  //                     isChecked: state.isCheckedReCaptcha,
  //                     size: 50,
  //                   ),
  //                 ),
  //           // KDimension().kWidth10,
  //           Kstyles().med(
  //             text: StringConst.imNotARobot,
  //             color: AppColors.black,
  //             size: 16,
  //           ),
  //           Spacer(),
  //           Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: <Widget>[
  //               Image.asset(
  //                 height: 40,
  //                 width: 40,
  //                 AssetsConst.reCaptcha,
  //                 fit: BoxFit.cover,
  //               ),
  //               Kstyles().med(
  //                 text: StringConst.reCaptcha,
  //                 color: AppColors.black,
  //                 size: 10,
  //               ),
  //               RichText(
  //                 text: TextSpan(
  //                   style: const TextStyle(fontSize: 12.0, color: Colors.grey),
  //                   children: <TextSpan>[
  //                     TextSpan(
  //                       text: 'Privacy',
  //                       style: const TextStyle(
  //                           fontSize: 9, color: AppColors.black),
  //                       recognizer: TapGestureRecognizer()
  //                         ..onTap = () async =>
  //                             _launchURL('https://policies.google.com/privacy'),
  //                     ),
  //                     const TextSpan(text: ' - '),
  //                     TextSpan(
  //                       text: 'Terms',
  //                       style: const TextStyle(
  //                           fontSize: 9, color: AppColors.black),
  //                       recognizer: TapGestureRecognizer()
  //                         ..onTap = () async =>
  //                             _launchURL('https://policies.google.com/terms'),
  //                     ),
  //                   ],
  //                 ),
  //               )
  //             ],
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // Future<void> _launchURL(String url) async {
  //   if (kIsWeb) {
  //     html.window.open(url, '_blank');
  //   } else {
  //     final Uri uri = Uri.parse(url);
  //     try {
  //       if (await canLaunchUrl(uri)) {
  //         await launchUrl(
  //           uri,
  //           mode: LaunchMode.externalApplication,
  //         );
  //       } else {
  //         throw 'Could not launch $uri';
  //       }
  //     } catch (e) {
  //       debugPrint('Error launching URL: $e');
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text("Unable to open")),
  //       );
  //     }
  //   }
  // }

//
  Widget _nextBtn(
    BuildContext context,
    SizingInformation sizingInformation,
    // bool isCheckedReCaptcha,
  ) {
    return Align(
        alignment: Alignment.centerRight,
        child: AnimatedTextButton(
          fixedWidth: sizingInformation.isMobile ? 180 : 240,
          text: "Login / Sign up".toUpperCase(),
          showPrefixWidget: true,
          onPressed: () {
            context.read<RegistrationBloc>().add(
                  EmailValidationEvent(
                      email: widget.emailController.text,
                      buildContext: context),
                );

            //!------------------For testing only------------------
            // context.go(
            //     "${StringConst.startBookingViewRoute}/33e07dde959e41e9acc9156a736f8a7d");
            // context.go(
            //     "${StringConst.startBookingViewRoute}/d8cd4fbcf67e40c9af9fd71fb36e767d");
            // context.go(
            //     "${StringConst.startBookingViewRoute}/2501322dee744e7ba20073167f9404dd");
            //!-----------------------------------------------------
          },
          smallDevice: sizingInformation.screenSize.width > 1000 ? false : true,
        ));
  }
}
