import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:scape/core/utils/common_widgets/custom_image_network_widget.dart';
import 'package:scape/core/utils/common_widgets/custom_snackbar.dart';
import 'package:scape/core/utils/common_widgets/custom_view/animated_button.dart';
import 'package:scape/core/utils/common_widgets/custom_view/custom_view.dart';
import 'package:scape/core/utils/common_widgets/custom_view/next_btn.dart';
import 'package:scape/core/utils/common_widgets/enquires_view.dart';
import 'package:scape/core/utils/common_widgets/error_view.dart';
import 'package:scape/core/utils/common_widgets/loading_widgets/initial_loader.dart';
import 'package:scape/core/utils/common_widgets/loading_widgets/popup_loading.dart';
import 'package:scape/core/utils/common_widgets/popup_message_widget.dart';
import 'package:scape/core/utils/enums.dart';
import 'package:scape/core/utils/string_constants.dart';
import 'package:scape/core/utils/styles/app_colors.dart';
import 'package:scape/core/utils/styles/dimensions.dart';
import 'package:scape/core/utils/styles/text_styles.dart';
import 'package:scape/src/profile/presentation/bloc/profile_bloc.dart';
import 'package:scape/src/ticket_booking/data/model/get_event_with_package_limit/get_event_with_package_limit_model.dart';
import 'package:scape/src/ticket_booking/data/model/tickets_participant_list_model/tickets_participant_list_model.dart';
import 'package:scape/src/ticket_booking/presentation/bloc/ticket_booking_bloc.dart';

import '../../../../core/utils/constants.dart';
import 'ticket_choosing_list_view.dart';

// ignore: must_be_immutable
class TicketBookingView extends StatefulWidget {
  const TicketBookingView({
    super.key,
  });

  @override
  State<TicketBookingView> createState() => _TicketBookingViewState();
}

class _TicketBookingViewState extends State<TicketBookingView> {
  @override
  void initState() {
    context.read<ProfileBloc>().add(CheckLoginIsValidEvent());

    super.initState();
  }

  List<EventPackageWithLimit> eventPackages = [];

  GetEventWithPackageLimitModel eventInfo =
      const GetEventWithPackageLimitModel();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) async {
        if (state.initialApiStatus == ApiStatus.failure) {
          var eventCode = await GetStorage().read(StringConst.eventKey);
          if (context.mounted) {
            context.replace("${StringConst.startBookingViewRoute}/$eventCode");
            customErrorSnackBar(context, message: "Login session expired");
          }
        } else if (state.initialApiStatus == ApiStatus.success) {
          context
              .read<TicketBookingBloc>()
              .add(CheckIsSessionCreatedEvent(context));
        }
      },
      buildWhen: (previous, current) {
        return current.initialApiStatus == ApiStatus.loading ||
            current.initialApiStatus == ApiStatus.failure ||
            current.initialApiStatus == ApiStatus.success;
      },
      builder: (context, profileState) {
        return BlocConsumer<TicketBookingBloc, TicketBookingState>(
          listener: (context, state) {
            if (state.initialApiStatus == ApiStatus.failure) {
              customErrorSnackBar(context, message: state.errorMessage);
            } else if (state.apiStatus == ApiStatus.success) {
              // if (state.callSessionApi) {
              //   print("object");
              //   context
              //       .read<TicketBookingBloc>()
              //       .add(CheckIsSessionCreatedEvent(context));
              // }
            } else if (state.apiStatus == ApiStatus.loading) {
              popupLoading(context);
            } else if (state.apiStatus == ApiStatus.completed) {
              if (context.canPop()) {
                context.pop();
              } else {
                print("Cant pop=> #####################################");
                // Handle case when can't pop - maybe show a dialog or exit app
              }
            } else if (state.apiStatus == ApiStatus.failure) {
              popupMessageWidget(context, state.errorMessage);
            } else if (state.initialApiStatus == ApiStatus.success) {
              if (eventPackages.isEmpty) {
                if (state.eventInfoWithLimit != null) {
                  eventPackages =
                      state.eventInfoWithLimit!.eventSettings?.EventPackages ??
                          [];
                  context
                      .read<TicketBookingBloc>()
                      .add(CreateInitialQtyList(length: eventPackages.length));

                  eventInfo = state.eventInfoWithLimit!;
                }
              }
            }
          },
          buildWhen: (previous, current) {
            return current.initialApiStatus == ApiStatus.loading ||
                current.initialApiStatus == ApiStatus.failure ||
                current.initialApiStatus == ApiStatus.success;
          },
          builder: (context, ticketState) {
            return profileState.initialApiStatus == ApiStatus.loading ||
                    ticketState.initialApiStatus == ApiStatus.loading
                ? const InitialLoader()
                : profileState.initialApiStatus == ApiStatus.failure ||
                        ticketState.initialApiStatus == ApiStatus.failure
                    ? ErrorView(
                        errorMessage: ticketState.errorMessage,
                        tryAgain: () => context
                            .read<ProfileBloc>()
                            .add(CheckLoginIsValidEvent()),
                      )
                    : profileState.initialApiStatus == ApiStatus.success &&
                            ticketState.initialApiStatus == ApiStatus.success
                        ? CustomView(
                            isFromProfile: false,
                            showLogout: true,
                            contentWidget: _buildContent(context, ticketState),
                          )
                        : const SizedBox.shrink();
          },
        );
      },
    );
  }

//Content
  Widget _buildContent(BuildContext context, TicketBookingState state) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Constants.width * 0.1 - 40,
          vertical: 10,
        ),
        child: Column(
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
                        _contentBodyRight(
                          sizingInformation,
                          state,
                          state.showParticipantField,
                          state.showFreeTicketField,
                          state.participantListForTickets,
                        ),
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
                          child: _contentBodyRight(
                            sizingInformation,
                            state,
                            state.showParticipantField,
                            state.showFreeTicketField,
                            state.participantListForTickets,
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
    required GetEventWithPackageLimitModel data,
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
    SizingInformation sizingInformation,
    TicketBookingState state,
    bool showParticipantField,
    bool showFreeTicketField,
    List<TicketsParticipantListModel> ticketsParticipantListModel,
  ) {
    return isLimitExceededAll(eventPackages)
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Kstyles().semibold(
                text:
                    "The event is fully booked, or you have already reached your quota for participation.",
                size: 16,
                color: AppColors.red,
              ),
              KDimension().kHeight20,
              const EnquiresView(),
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (showParticipantField == false)
                _rightSectionTopWidget(
                    showParticipantField, showFreeTicketField),
              showFreeTicketField
                  ? _showFreeTicketSection(state)
                  : TicketChoosingListView(
                      eventPackageList: eventPackages,
                      state: state,
                      showParticipantField: showParticipantField,
                      // ticketsParticipantListModel: ticketsParticipantListModel,
                    ),
              _rightSectionBottomWidget(
                sizingInformation,
                showParticipantField,
                showFreeTicketField,
              ),
              KDimension().kHeight20,
              const EnquiresView(),
            ],
          );
  }

  Widget _showFreeTicketSection(
    TicketBookingState state,
  ) {
    return Container(
      color: AppColors.backgroundColor3,
      padding: EdgeInsets.symmetric(
        horizontal: getValueForScreenType(
          context: context,
          mobile: 20,
          desktop: 30,
        ),
      ),
      child: Column(
        children: [
          ...List.generate(state.bookedPackages!.length, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Kstyles().med(
                      text:
                          "${eventName(state.bookedPackages![index].EventPackageCode ?? "")} x ${state.bookedPackages![index].Participants!.length}",
                      color: AppColors.black,
                      maxLines: 5,
                      size: 14,
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  String eventName(String packageCode) {
    var event = eventPackages
        .firstWhere((item) => item.EventPackageCode == packageCode);
    return event.PackageName ?? "";
  }

  //Right section top widget
  Widget _rightSectionTopWidget(
    bool showParticipantField,
    bool showFreeTicketField,
  ) {
    return Container(
      width: double.infinity,
      color: AppColors.backgroundColor3,
      padding: EdgeInsets.only(
        top: getValueForScreenType(
          context: context,
          mobile: 20,
          desktop: 30,
        ),
        right: getValueForScreenType(
          context: context,
          mobile: 20,
          desktop: 30,
        ),
        left: getValueForScreenType(
          context: context,
          mobile: 20,
          desktop: 30,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Kstyles().bold(
            text: showFreeTicketField && showParticipantField == false
                ? "Free Admission"
                : "Select Your Tickets",
            size: getValueForScreenType(
              context: context,
              mobile: 18,
              desktop: 22,
            ),
          ),
          showFreeTicketField && showParticipantField == false
              ? const SizedBox()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    KDimension().kHeight10,
                    Kstyles().med(
                      text:
                          "You can buy up to four (4) tickets, subject to availability.",
                      color: AppColors.black,
                      maxLines: 5,
                      size: getValueForScreenType(
                        context: context,
                        mobile: 14,
                        desktop: 16,
                      ),
                    ),
                  ],
                ),
          KDimension().kHeight10,
        ],
      ),
    );
  }

  //Right section top widget
  Widget _rightSectionBottomWidget(
    SizingInformation sizingInformation,
    bool showParticipantField,
    bool showFreeTicketField,
  ) {
    return Container(
      color: AppColors.backgroundColor3,
      padding: EdgeInsets.only(
        bottom: getValueForScreenType(
          context: context,
          mobile: 20,
          desktop: 30,
        ),
        right: getValueForScreenType(
          context: context,
          mobile: 20,
          desktop: 30,
        ),
        left: getValueForScreenType(
          context: context,
          mobile: 20,
          desktop: 30,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          KDimension().kHeight35,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /* showFreeTicketField == false && showParticipantField == true
                  ? AnimatedTextButton(
                      text: StringConst.previous.toUpperCase(),
                      showSuffixWidget: true,
                      onPressed: () {
                        context
                            .read<TicketBookingBloc>()
                            .add(const BackToQuantityAddPage());
                      },
                      smallDevice: sizingInformation.screenSize.width > 1000
                          ? false
                          : true,
                    )
                  : const SizedBox(), */
              showFreeTicketField && showParticipantField == false
                  ? AnimatedTextButton(
                      text: StringConst.previous.toUpperCase(),
                      showSuffixWidget: true,
                      onPressed: () {
                        context
                            .read<TicketBookingBloc>()
                            .add(const BackToParticipantAddPage());
                      },
                      smallDevice: sizingInformation.screenSize.width > 1000
                          ? false
                          : true,
                    )
                  : const SizedBox(),
              showFreeTicketField && showParticipantField == false
                  ? AnimatedTextButton(
                      text: StringConst.confirm.toUpperCase(),
                      showPrefixWidget: true,
                      onPressed: () {
                        context
                            .read<TicketBookingBloc>()
                            .add(ConfirmFreeBooking(context: context));
                      },
                      smallDevice: sizingInformation.screenSize.width > 1000
                          ? false
                          : true,
                    )
                  : showParticipantField
                      ? NextButton(
                          index: 3,
                          sizingInformation: sizingInformation,
                        )
                      : AnimatedTextButton(
                          text: StringConst.next.toUpperCase(),
                          showPrefixWidget: true,
                          onPressed: () {
                            context.read<TicketBookingBloc>().add(
                                AddMultipleTicketInitial(context: context));
                          },
                          smallDevice: sizingInformation.screenSize.width > 1000
                              ? false
                              : true,
                        ),
            ],
          ),
          KDimension().kHeight15,
        ],
      ),
    );
  }

  bool isLimitExceededAll(List<EventPackageWithLimit> eventPackages) {
    bool isLimitExceededAll = false;

    int index =
        eventPackages.indexWhere((package) => (package.PackageLimit ?? 0) > 0);
    if (index > -1) {
      isLimitExceededAll = false;
    } else {
      isLimitExceededAll = true;
    }
    return isLimitExceededAll;
  }
}
