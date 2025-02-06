import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:scape/core/helper/logger.dart';
import 'package:scape/core/utils/common_widgets/custom_image_network_widget.dart';
import 'package:scape/core/utils/common_widgets/custom_view/custom_view.dart';
import 'package:scape/core/utils/common_widgets/custom_view/next_btn.dart';
import 'package:scape/core/utils/common_widgets/custom_view/previous_btn.dart';
import 'package:scape/core/utils/common_widgets/enquires_view.dart';
import 'package:scape/core/utils/common_widgets/error_view.dart';
import 'package:scape/core/utils/common_widgets/loading_widgets/initial_loader.dart';
import 'package:scape/core/utils/common_widgets/loading_widgets/popup_loading.dart';
import 'package:scape/core/utils/common_widgets/popup_message_widget.dart';
import 'package:scape/core/utils/constants.dart';
import 'package:scape/core/utils/enums.dart';
import 'package:scape/core/utils/string_constants.dart';
import 'package:scape/core/utils/styles/app_colors.dart';
import 'package:scape/core/utils/styles/dimensions.dart';
import 'package:scape/core/utils/styles/text_styles.dart';
import 'package:scape/src/email-providing-view/data/model/event-model/event_info_model.dart';
import 'package:scape/src/email-providing-view/presentation/bloc/email_providing_bloc.dart';
import 'package:scape/src/otp-verification-view/presentation/bloc/otp_verification_bloc.dart';
import 'package:scape/src/otp-verification-view/presentation/view/widgets/otp_widget.dart';
import 'package:scape/src/registration/presentation/bloc/registration_bloc.dart';

class OtpVerificationView extends StatefulWidget {
  const OtpVerificationView({
    super.key,
    required this.tempLoginToken,
    required this.email,
    required this.isFromRegistration,
  });
  final String? tempLoginToken;
  final String? email;
  final bool? isFromRegistration;
  @override
  State<OtpVerificationView> createState() => _OtpVerificationViewState();
}

class _OtpVerificationViewState extends State<OtpVerificationView> {
  @override
  void initState() {
    logger.i("Email: ${widget.email}");
    logger.i("TempToken: ${widget.tempLoginToken}");
    context.read<OtpVerificationBloc>().add(OtVerificationResetEvent());
    WidgetsBinding.instance.addPostFrameCallback((callback) async {
      String eventKey = await GetStorage().read(StringConst.eventKey);
      if (widget.tempLoginToken == null) {
        if (mounted) {
          context.replace("${StringConst.startBookingViewRoute}/$eventKey");
        }
      }
    });
    context.read<EmailProvidingBloc>().add(const GetEventInformation());

    context.read<OtpVerificationBloc>().add(StoreEmailTempToken(
          email: widget.email ?? "",
          tempToken: widget.tempLoginToken ?? "",
        ));

    super.initState();
  }

  EventInfoModel eventInfo = const EventInfoModel();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EmailProvidingBloc, EmailProvidingState>(
      listener: (context, state) {
        if (state.initialApiStatus == ApiStatus.success) {
          eventInfo = state.eventInfo;
        }
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
                        contentWidget: _buildContent(),
                      )
                    : const SizedBox.shrink();
      },
    );
  }

  //Content
  Widget _buildContent() {
    return MultiBlocListener(
      listeners: [
        BlocListener<RegistrationBloc, RegistrationState>(
          listener: (context, state) {
            if (state.apiStatus == ApiStatus.loading) {
              popupLoading(context);
            } else if (state.apiStatus == ApiStatus.completed) {
              context.pop();
            } else if (state.apiStatus == ApiStatus.failure) {
              if (state.confirmOtpApi != true) {
                popupMessageWidget(context, state.errorMessage);
              } else {
                context.read<OtpVerificationBloc>().add(const ShowOtpError());
              }
            } else if (state.apiStatus == ApiStatus.success) {
              //[canNavigate] value will be [true] when OTP got verified
              if (state.canNavigate) {
                if (eventInfo.eventSettings?.MustUseMyInfo ==
                    StringConst.yesKey) {
                  //Check [singpass] verification
                  context
                      .read<OtpVerificationBloc>()
                      .add(const CheckSingPassVerification());
                } else {
                  if (widget.isFromRegistration == true) {
                    context
                        .read<OtpVerificationBloc>()
                        .add(MyProfileUpdateQuizEvent(
                          context: context,
                          navigateTicketBooking: true,
                        ));
                  } else {
                    context.go(StringConst.ticketBookingViewRoute);
                  }
                }
              } //After resend the otp by calling loginWithEmail api
              else {
                context.read<OtpVerificationBloc>().add(StoreEmailTempToken(
                      email: widget.email ?? "",
                      tempToken: state.tempToken,
                    ));
              }
            }
          },
        ),
        BlocListener<OtpVerificationBloc, OtpVerificationState>(
          //!-----This listener only called when CheckSingPassIsVerified
          // api get called--------!//
          listener: (context, state) {
            if (state.apiStatus == ApiStatus.loading) {
              popupLoading(context);
            } else if (state.apiStatus == ApiStatus.completed) {
              context.pop();
            } else if (state.apiStatus == ApiStatus.failure) {
              //User haven't been verified with SingPass
              //Navigate to Retrieve My info page for SingPass verification.
              if (widget.isFromRegistration == true) {
                context
                    .read<OtpVerificationBloc>()
                    .add(MyProfileUpdateQuizEvent(
                      context: context,
                      navigateTicketBooking: false,
                    ));
              } else {
                context.go(StringConst.retrieveMyInfoViewRoute);
              }

              // popupMessageWidget(context, state.errorMessage);
            } else if (state.apiStatus == ApiStatus.success) {
              logger.e("Navigate to Ticket booking");
              //SingPass verified
              //Navigate to Ticket booking page
              if (widget.isFromRegistration == true) {
                context
                    .read<OtpVerificationBloc>()
                    .add(MyProfileUpdateQuizEvent(
                      context: context,
                      navigateTicketBooking: true,
                    ));
              } else {
                context.go(StringConst.ticketBookingViewRoute);
              }
            } else if (state.initialApiStatus == ApiStatus.loading) {
              popupLoading(context);
            } else if (state.initialApiStatus == ApiStatus.completed) {
              context.pop();
            } else if (state.initialApiStatus == ApiStatus.failure) {
              popupMessageWidget(context, state.errorMessage);
            }
          },
        ),
      ],
      child: Padding(
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
                            data: eventInfo,
                          ),
                          KDimension().kHeight20,
                          _contentBodyRight(sizingInformation),
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
                              data: eventInfo,
                            ),
                          ),
                          SizedBox(
                            width: sizingInformation.screenSize.width * 0.04,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _contentBodyRight(sizingInformation),
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
  Widget _contentBodyRight(SizingInformation sizingInformation) {
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
          OtpWidget(
            email: widget.email ?? "",
          ),
          KDimension().kHeight35,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PreviousButton(
                index: 1,
                sizingInformation: sizingInformation,
              ),
              NextButton(
                index: 1,
                sizingInformation: sizingInformation,
              ),
            ],
          ),
          KDimension().kHeight15,
        ],
      ),
    );
  }

  // //notice text
  // Widget _noticeText() {
  //   return Visibility(
  //     visible: eventInfo.eventSettings?.MustUseMyInfo == StringConst.yesKey,
  //     child: Padding(
  //       padding: const EdgeInsets.only(top: 10),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         children: [
  //           const Icon(Icons.info, size: 20, color: AppColors.darkRed),
  //           KDimension().kWidth05,
  //           Expanded(
  //             child: Kstyles().reg(
  //               text: eventInfo.eventSettings?.MustUseMyInfoMessage ?? "",
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
