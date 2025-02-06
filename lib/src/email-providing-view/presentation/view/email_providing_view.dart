import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:scape/config/analytics.dart';
import 'package:scape/core/utils/asset_constants.dart';
import 'package:scape/core/utils/common_widgets/custom_image_network_widget.dart';
import 'package:scape/core/utils/common_widgets/custom_snackbar.dart';
import 'package:scape/core/utils/common_widgets/custom_text.dart';
import 'package:scape/core/utils/common_widgets/custom_view/animated_button.dart';
import 'package:scape/core/utils/common_widgets/custom_view/custom_view.dart';
import 'package:scape/core/utils/common_widgets/enquires_view.dart';
import 'package:scape/core/utils/common_widgets/error_view.dart';
import 'package:scape/core/utils/common_widgets/loading_widgets/initial_loader.dart';
import 'package:scape/core/utils/common_widgets/loading_widgets/popup_loading.dart';
import 'package:scape/core/utils/common_widgets/popup_message_widget.dart';
import 'package:scape/core/utils/constants.dart';
import 'package:scape/core/utils/enums.dart';
import 'package:scape/core/utils/extensions.dart';
import 'package:scape/core/utils/string_constants.dart';
import 'package:scape/core/utils/styles/app_colors.dart';
import 'package:scape/core/utils/styles/dimensions.dart';
import 'package:scape/core/utils/styles/text_styles.dart';
import 'package:scape/src/email-providing-view/data/model/event-model/event_info_model.dart';
import 'package:scape/src/email-providing-view/presentation/bloc/email_providing_bloc.dart';
import 'package:scape/src/otp-verification-view/presentation/bloc/otp_verification_bloc.dart';
import 'package:scape/src/profile/presentation/bloc/profile_bloc.dart';
import 'package:scape/src/registration/presentation/bloc/registration_bloc.dart';
import 'package:scape/src/registration/presentation/view/checkmark.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:html' as html;

class EmailProvidingView extends StatefulWidget {
  const EmailProvidingView({
    super.key,
  });

  @override
  State<EmailProvidingView> createState() => _EmailProvidingViewState();
}

class _EmailProvidingViewState extends State<EmailProvidingView> {
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    context.read<EmailProvidingBloc>().add(
          const GetEventInformation(),
        );

    WidgetsBinding.instance.addPostFrameCallback((callback) async {
      final box = GetStorage();
      String token = "";
      var result = await box.read(StringConst.loginTokenKey);
      if (result != null) {
        token = result;
      }
      if (token.isNotEmpty && mounted) {
        context.read<ProfileBloc>().add(CheckLoginIsValidEvent());
      }
    });

    //Analytics
    Analytics.logEvent("Event registration page viewed", {
      "event": "Event registration page viewed",
    });

    super.initState();
  }

  List<EventPackage> eventPackageList = [];
  EventInfoModel eventInfo = const EventInfoModel();
  final ScrollController scrollController = ScrollController();
  bool? loginValid;
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ProfileBloc, ProfileState>(
          listener: (context, state) {
            if (state.initialApiStatus == ApiStatus.success) {
              loginValid = true;

              ///calling singapss verification if required. Only call when login is valid
              if (eventInfo.eventSettings?.MustUseMyInfo != null) {
                if (eventInfo.eventSettings?.MustUseMyInfo ==
                    StringConst.yesKey) {
                  context
                      .read<OtpVerificationBloc>()
                      .add(const CheckSingPassVerification());
                } else {
                  context.go(StringConst.ticketBookingViewRoute);
                }
              }
            }
          },
        ),
        BlocListener<OtpVerificationBloc, OtpVerificationState>(
          listener: (context, state) {
            if (state.apiStatus == ApiStatus.success) {
              context.go(StringConst.ticketBookingViewRoute);
            } else if (state.apiStatus == ApiStatus.failure) {
              context.go(StringConst.retrieveMyInfoViewRoute);
            }
          },
        ),
        BlocListener<RegistrationBloc, RegistrationState>(
          /*--------Response listener of LoginWithEmail api*/
          listener: (context, state) {
            if (state.apiStatus == ApiStatus.completed) {
              context.pop();
            } else if (state.apiStatus == ApiStatus.failure) {
              popupMessageWidget(context, state.errorMessage);
            } else if (state.apiStatus == ApiStatus.success) {
              context.go(
                StringConst.otpViewRoute,
                extra: {
                  StringConst.emailKey: emailController.text,
                  StringConst.memberExistsActiveKey: true,
                  StringConst.tempLoginToken: state.tempToken,
                  StringConst.isFromRegistrationKey: false,
                },
              );
            }
          },
        ),
      ],
      child: BlocConsumer<EmailProvidingBloc, EmailProvidingState>(
        listener: (context, state) {
          if (state.initialApiStatus == ApiStatus.failure) {
            customErrorSnackBar(context, message: state.errorMessage);
          } else if (state.apiStatus == ApiStatus.loading) {
            popupLoading(context);
          } else if (state.apiStatus == ApiStatus.completed) {
            // context.pop();
          } else if (state.apiStatus == ApiStatus.failure) {
            context.pop();
            customErrorSnackBar(context, message: state.errorMessage);
            // if (state.errorMessage == StringConst.couldNotLocateEmail) {
            //   context.go(
            //     StringConst.otpViewRoute,
            //     extra: {
            //       StringConst.emailKey: emailController.text,
            //       StringConst.memberExistsActiveKey: false,
            //       StringConst.tempLoginToken: "",
            //     },
            //   );
            // }
          } else if (state is CheckMemberExistsState) {
            if (state.memberExists == true) {
              context.read<EmailProvidingBloc>().add(
                    CheckMemberIsActive(
                      emailController.text.removeAllWhitespace(),
                    ),
                  );
            } else {
              /*--------For new user*/
              context.go(
                StringConst.registerFromEventViewRoute,
                extra: {
                  StringConst.emailKey: emailController.text,
                },
              );
            }
          } else if (state is CheckMemberIsActiveState) {
            if (state.memberIsActive == true) {
              context.read<RegistrationBloc>().add(
                    LoginWithEmailApiEvent(
                      email: emailController.text.removeAllWhitespace(),
                    ),
                  );
            } else {
              context.pop();
              popupMessageWidget(context, "Member inactive");
            }
          } else if (state.initialApiStatus == ApiStatus.success) {
            eventInfo = state.eventInfo;
            eventPackageList =
                state.eventInfo.eventSettings?.EventPackages ?? [];

            ///calling singapss verification if required. Only call when login is valid
            if (loginValid == true) {
              if (state.eventInfo.eventSettings?.MustUseMyInfo ==
                  StringConst.yesKey) {
                context
                    .read<OtpVerificationBloc>()
                    .add(const CheckSingPassVerification());
              } else {
                context.go(StringConst.ticketBookingViewRoute);
              }
            }
          }
        },
        buildWhen: (previous, current) {
          return current.initialApiStatus == ApiStatus.loading ||
              current.initialApiStatus == ApiStatus.failure ||
              current.initialApiStatus == ApiStatus.success;
        },
        builder: (context, state) {
          return state.initialApiStatus == ApiStatus.loading
              ? const InitialLoader()
              : state.initialApiStatus == ApiStatus.failure
                  ? ErrorView(
                      errorMessage: state.errorMessage,
                      tryAgain: () => context
                          .read<EmailProvidingBloc>()
                          .add(const GetEventInformation()),
                    )
                  : state.initialApiStatus == ApiStatus.success
                      ? CustomView(
                          isFromProfile: false,
                          showLogout: false,
                          contentWidget: _buildContent(state.eventInfo, state),
                        )
                      : const SizedBox.shrink();
        },
      ),
    );
  }

  //Content
  Widget _buildContent(EventInfoModel data, EmailProvidingState state) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Constants.width * 0.1 - 40),
      child: ResponsiveBuilder(
        builder: (context, sizingInformation) => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            KDimension().kHeight60,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: sizingInformation.isMobile || sizingInformation.isTablet
                  ? Column(
                      children: [
                        _contentBodyLeft(
                          sizeInformation: sizingInformation,
                          data: data,
                        ),
                        KDimension().kHeight20,
                        _contentBodyRight(sizingInformation, state),
                        KDimension().kHeight20,
                        const EnquiresView(),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 340,
                          child: _contentBodyLeft(
                            sizeInformation: sizingInformation,
                            data: data,
                          ),
                        ),
                        SizedBox(
                          width: sizingInformation.screenSize.width * 0.04,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _contentBodyRight(sizingInformation, state),
                              KDimension().kHeight20,
                              const EnquiresView(),
                            ],
                          ),
                        ),
                      ],
                    ),
            ),
            // Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 40),
            //     child: _noticeSection(data)),
            // KDimension().kHeight30,

            KDimension().kHeight80,
          ],
        ),
      ),
    );
  }

//Content Body Left Widget
  Widget _contentBodyLeft({
    required SizingInformation sizeInformation,
    required EventInfoModel data,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomImageNetworkWidget(
          imageUrl: data.eventSettings?.BannerURL ?? "",
          boxFit: BoxFit.fitWidth,
        ),
        KDimension().kHeight30,
        Kstyles().bold(
          text: "EVENT",
          color: AppColors.orange.withOpacity(0.9),
          size: getValueForScreenType(
            context: context,
            mobile: 16,
            desktop: 22,
          ),
        ),
        KDimension().kHeight10,
        Kstyles().bold(
          text: data.eventSettings?.EventName ?? "",
          size: getValueForScreenType(
            context: context,
            mobile: 24,
            desktop: 28,
          ),
          overflow: TextOverflow.visible,
        ),
        KDimension().kHeight10,
        Kstyles().med(
          text: data.eventSettings?.EventDescription ?? "",
          color: AppColors.black,
          size: 14,
          overflow: TextOverflow.visible,
        ),
        KDimension().kHeight05,
      ],
    );
  }

//Content Body Right Widget
  Widget _contentBodyRight(
      SizingInformation sizingInformation, EmailProvidingState state) {
    return Container(
      color: AppColors.backgroundColor3,
      padding: EdgeInsets.all(
        getValueForScreenType(
          context: context,
          mobile: 20,
          desktop: 30,
        ),
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
          KDimension().kHeight20,
          CustomWidgets.commonTextField(
            textEditingController: emailController,
            backgroundColor: AppColors.white,
            hintText: StringConst.enterYourEmail,
            hintTextStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: AppColors.grey,
            ),
            borderColor: AppColors.transparent,
            keyBoardType: TextInputType.emailAddress,
            onSubmitted: (val) => context.read<EmailProvidingBloc>().add(
                  EmailValidation(
                    context: context,
                    email: val.removeAllWhitespace(),
                  ),
                ),
          ),
          KDimension().kHeight10,
          Kstyles().med(
            text: "A one-time password will be sent to your email.",
            size: getValueForScreenType(
              context: context,
              mobile: 14,
              desktop: 16,
            ),
          ),
          // KDimension().kHeight15,
          // _reCaptchaIntegration(state),
          KDimension().kHeight35,
          Align(
              alignment: Alignment.centerRight,
              child: AnimatedTextButton(
                fixedWidth: sizingInformation.isMobile ? 180 : 240,
                text: "Login / Sign up".toUpperCase(),
                showPrefixWidget: true,
                onPressed: () {
                  context.read<EmailProvidingBloc>().add(
                      EmailProvidingNextBtnClicked(
                          email: emailController.text.removeAllWhitespace(),
                          context: context));
                },
                smallDevice:
                    sizingInformation.screenSize.width > 1000 ? false : true,
              )),
          KDimension().kHeight15,
        ],
      ),
    );
  }

  //!---------(recaptcha integration method)

  // Widget _reCaptchaIntegration(EmailProvidingState state) {
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
  //                     context.read<EmailProvidingBloc>().add(
  //                           GetReCaptchaTokenEvent(),
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
  //                 height: 35,
  //                 width: 35,
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

  // //notice section
  // Widget _noticeSection(EventInfoModel data) {
  //   return Visibility(
  //     visible: data.eventSettings?.MustUseMyInfo == StringConst.yesKey,
  //     child: Container(
  //       color: AppColors.white,
  //       margin: const EdgeInsets.only(top: 30),
  //       padding: const EdgeInsets.all(20),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         children: [
  //           getValueForScreenType(
  //             context: context,
  //             mobile: KDimension().kWidth05,
  //             desktop: KDimension().kWidth30,
  //           ),
  //           const Icon(Icons.info, size: 20, color: AppColors.darkRed),
  //           KDimension().kWidth05,
  //           Expanded(
  //             child: Kstyles().reg(
  //               text: data.eventSettings?.MustUseMyInfoMessage ?? "",
  //               color: AppColors.darkGrey,
  //               maxLines: 3,
  //               size: getValueForScreenType(
  //                 context: context,
  //                 mobile: 13,
  //                 desktop: 15,
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
