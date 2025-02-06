import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:scape/core/helper/logger.dart';
import 'package:scape/core/utils/common_widgets/custom_image_network_widget.dart';
import 'package:scape/core/utils/common_widgets/custom_view/bottom_button_section.dart';
import 'package:scape/core/utils/common_widgets/custom_view/custom_view.dart';
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
import 'package:scape/src/profile/presentation/bloc/profile_bloc.dart';
import 'package:scape/src/retrieve-myinfo-view/bloc/retrieve_info_bloc.dart';
import 'package:scape/src/retrieve-myinfo-view/bloc/retrieve_info_event.dart';
import 'package:scape/src/retrieve-myinfo-view/bloc/retrieve_info_state.dart';
import 'package:scape/src/retrieve-myinfo-view/presentation/view/widgets/retrieve_myinfo_button.dart';

class RetrieveMyInfoView extends StatefulWidget {
  final String token;
  const RetrieveMyInfoView({super.key, required this.token});

  @override
  State<RetrieveMyInfoView> createState() => _RetrieveMyInfoViewState();
}

class _RetrieveMyInfoViewState extends State<RetrieveMyInfoView> {
  List<EventPackage> eventPackages = [];
  EventInfoModel eventInfo = const EventInfoModel();
  @override
  void initState() {
    super.initState();
    context.read<EmailProvidingBloc>().add(const SetInitialStatus());
    if (widget.token.isNotEmpty) {
      context.read<ProfileBloc>().add(CheckLoginIsValidEvent());

      context
          .read<RetrieveInfoBloc>()
          .add(ValidateSingpass(token: widget.token));
    } else {
      context.read<RetrieveInfoBloc>().add(const GetSingPassRedirectUrl());
    }
  }

  @override
  Widget build(BuildContext context) {
    return
        //  widget.token.isEmpty
        //     ? const InitialLoader()
        //     :
        BlocListener<RetrieveInfoBloc, RetrieveInfoState>(
      listener: (context, state) {
        if (state.apiStatus == ApiStatus.loading ||
            state.initialApiStatus == ApiStatus.loading) {
          popupLoading(context);
        } else if (state.apiStatus == ApiStatus.completed ||
            state.initialApiStatus == ApiStatus.completed) {
          context.pop();
        } else if (state.apiStatus == ApiStatus.success) {
          if (state.isMyInfoVerified == StringConst.yesKey) {
            context.go(StringConst.ticketBookingViewRoute);
          }
        } else if (state.apiStatus == ApiStatus.failure ||
            state.initialApiStatus == ApiStatus.failure) {
          context.read<EmailProvidingBloc>().add(const GetEventInformation());

          popupMessageWidget(context, state.errorMessage);
        }
      },
      child: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state.initialApiStatus == ApiStatus.failure) {
            String eventKey = GetStorage().read(StringConst.eventKey) ?? "";
            if (eventKey.isEmpty) {
              context.go(StringConst.registrationViewRoute);
            } else {
              context.replace("${StringConst.startBookingViewRoute}/$eventKey");
            }
          }
        },
        child: BlocConsumer<EmailProvidingBloc, EmailProvidingState>(
          listener: (context, state) {
            if (state.initialApiStatus == ApiStatus.success) {
              eventPackages =
                  state.eventInfo.eventSettings?.EventPackages ?? [];
              eventInfo = state.eventInfo;
            }
          },
          builder: (context, state) {
            logger.e("message: ${state.initialApiStatus}");
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
                            showLogout: true,
                            contentWidget: _buildContent(context),
                            bottomButtonWidget:
                                const BottomButtonSection(pageIndex: 2),
                          )
                        : CustomView(
                            isFromProfile: false,
                            showLogout: true,
                            contentWidget: _buildWaitForMoment(context),
                          );
          },
        ),
      ),
    );
  }

  //Content
  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Constants.width * 0.1 - 40),
      child: ResponsiveBuilder(
        builder: (context, sizingInformation) => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
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
    );
  }

  //Content
  Widget _buildWaitForMoment(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: sizingInformation.isDesktop
              ? sizingInformation.screenSize.width * 0.22
              : 30,
          vertical: sizingInformation.isMobile
              ? 120
              : sizingInformation.screenSize.height * 0.15,
        ),
        child: Container(
          color: AppColors.backgroundColor3,
          padding: EdgeInsets.symmetric(
            horizontal: 40,
            vertical: sizingInformation.isMobile
                ? 50
                : sizingInformation.screenSize.width * 0.12,
          ),
          child: Center(
            child: Kstyles().bold(
              text: "Please wait for a moment...",
              color: AppColors.black,
              size: 20,
              maxLines: 3,
            ),
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
          _rightInformationSection(),
          KDimension().kHeight80,
          Align(
            alignment: Alignment.centerRight,
            child: RetrieveButton(sizingInformation: sizingInformation),
          ),
          KDimension().kHeight15,
        ],
      ),
    );
  }

  //right section
  Widget _rightInformationSection() {
    return _buildRightInformationContent();
  }

  Widget _buildRightInformationContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Kstyles().bold(
          text: StringConst.weNeedBitMoreInformation,
          maxLines: 2,
          size: getValueForScreenType(
            context: context,
            mobile: 18,
            desktop: 22,
          ),
        ),
        KDimension().kHeight10,
        Kstyles().reg(
          text: StringConst.singPassVerificationDescText,
          color: AppColors.black,
          maxLines: 6,
          size: 13,
        ),
      ],
    );
  }

// //Top cover image row widget
//   Widget _topSectionWidget(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(
//         horizontal: getValueForScreenType(
//           context: context,
//           mobile: 25,
//           tablet: 25,
//           desktop: 50,
//         ),
//         vertical: 20,
//       ),
//       color: AppColors.white,
//       width: double.infinity,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Kstyles().reg(
//             text: StringConst.bookYourTicketsFor,
//             color: AppColors.orange,
//             size: getValueForScreenType(
//               context: context,
//               mobile: 14,
//               desktop: 16,
//             ),
//           ),
//           KDimension().kHeight05,
//           Kstyles().bold(
//             text: eventInfo.eventSettings?.EventName ?? "",
//             size: getValueForScreenType(
//               context: context,
//               mobile: 20,
//               desktop: 26,
//             ),
//           ),
//           _noticeText(context),
//         ],
//       ),
//     );
//   }

  // //notice text
  // Widget _noticeText(BuildContext context) {
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
