import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:scape/core/utils/common_widgets/custom_image_network_widget.dart';
import 'package:scape/core/utils/common_widgets/custom_view/animated_button.dart';
import 'package:scape/core/utils/common_widgets/custom_view/custom_view.dart';
import 'package:scape/core/utils/common_widgets/enquires_view.dart';
import 'package:scape/core/utils/common_widgets/error_view.dart';
import 'package:scape/core/utils/common_widgets/loading_widgets/initial_loader.dart';
import 'package:scape/core/utils/enums.dart';
import 'package:scape/core/utils/styles/dimensions.dart';
import 'package:scape/src/booking_confirmation/presentation/bloc/booking_confirm_bloc.dart';
import 'package:scape/src/email-providing-view/data/model/event-model/event_info_model.dart';
import 'package:scape/src/email-providing-view/presentation/bloc/email_providing_bloc.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/utils/string_constants.dart';
import '../../../../core/utils/styles/app_colors.dart';
import '../../../../core/utils/styles/text_styles.dart';
import '../widgets/booking_confirm_detail_box.dart';
import 'dart:html' as html;

class BookingConfirmationPage extends StatefulWidget {
  const BookingConfirmationPage({super.key});

  @override
  State<BookingConfirmationPage> createState() =>
      _BookingConfirmationPageState();
}

class _BookingConfirmationPageState extends State<BookingConfirmationPage> {
  EventInfoModel eventInfo = const EventInfoModel();

  @override
  void initState() {
    context.read<EmailProvidingBloc>().add(const GetEventInformation());
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EmailProvidingBloc, EmailProvidingState>(
      listener: (context, emailState) {
        if (emailState.initialApiStatus == ApiStatus.success) {
          eventInfo = emailState.eventInfo;
          context.read<BookingConfirmBloc>().add(const GetDetailAPI());
        }
      },
      builder: (context, emailState) {
        return BlocConsumer<BookingConfirmBloc, BookingConfirmState>(
          listener: (context, bookingState) {},
          buildWhen: (previous, current) => current is! ToggleTextExpandStateP,
          builder: (context, bookingState) {
            return bookingState.initialApiStatus == ApiStatus.loading ||
                    emailState.initialApiStatus == ApiStatus.loading
                ? const InitialLoader()
                : bookingState.initialApiStatus == ApiStatus.failure ||
                        emailState.initialApiStatus == ApiStatus.failure
                    ? ErrorView(
                        errorMessage: bookingState.errorMessage,
                        tryAgain: () => context
                            .read<EmailProvidingBloc>()
                            .add(const GetEventInformation()),
                      )
                    : bookingState.initialApiStatus == ApiStatus.success
                        ? //!-----------------Booking Confirmation Page-----------------!
                        CustomView(
                            isFromProfile: false,
                            showLogout: true,
                            contentWidget: _body(context, bookingState),
                          )
                        : const SizedBox.shrink();
          },
        );
      },
    );
  }

  Widget _body(BuildContext context, BookingConfirmState bookingState) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Constants.width * 0.1 - 40,
        ),
        //!---------Body of the Booking Confirmation Page---------!
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
                        _contentBodyRight(bookingState, sizingInformation),
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
                              _contentBodyRight(
                                  bookingState, sizingInformation),
                              KDimension().kHeight20,
                              const EnquiresView(),
                            ],
                          ),
                        ),
                      ],
                    ),
            ),
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
    BookingConfirmState bookingState,
    SizingInformation sizeInformation,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Kstyles().bold(
          text: StringConst.purchaseHasBeenConfirmed,
          color: AppColors.orange,
          size: getValueForScreenType(
            context: context,
            mobile: 16,
            desktop: 20,
          ),
        ),
        KDimension().kHeight15,
        _buildViewTicketSection(
          bookingState: bookingState,
        ),
        KDimension().kHeight25,
        //  !--------Booking detail content---------!
        BookingConfirmDetailBox(
          state: bookingState,
          eventInfo: eventInfo,
        ),
        KDimension().kHeight35,
        Align(
            alignment: Alignment.centerRight,
            child: AnimatedTextButton(
              fixedWidth: 200,
              text: StringConst.myAccount.toUpperCase(),
              showPrefixWidget: true,
              onPressed: () {
                context.go(StringConst.profileViewRoute);
              },
              smallDevice:
                  sizeInformation.screenSize.width > 1000 ? false : true,
            )),
        KDimension().kHeight15,
      ],
    );
  }

  Widget _buildViewTicketSection({
    required BookingConfirmState bookingState,
  }) {
    String fullName =
        "${bookingState.bookingSessionDetailModel?.bookingSessionDeatils?.BookedMemberFirstName ?? ""} ${bookingState.bookingSessionDetailModel?.bookingSessionDeatils?.BookedMemberLastName ?? ""},";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Kstyles().reg(
          text: 'Dear $fullName',
          size: 14,
          color: AppColors.black,
        ),

        KDimension().kHeight15,
        //!----content section
        Kstyles().reg(
          text: StringConst.bookingUserMessage,
          color: AppColors.black,
          size: 14,
        ),
        KDimension().kHeight20,
        if (bookingState.ticketCode.isNotEmpty)
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () async {
                if (kIsWeb) {
                  html.window.open(
                      "${html.window.location.origin}/myaccount${StringConst.ticketDetailsViewRoute}/${bookingState.ticketCode}",
                      '_blank');
                } else {
                  context.go(
                      "${StringConst.ticketDetailsViewRoute}/${bookingState.ticketCode}");
                }
              },
              child: Row(
                children: [
                  Kstyles().med(
                    text: StringConst.viewTickets,
                    color: AppColors.orange,
                    decoration: TextDecoration.underline,
                    size: getValueForScreenType(
                      context: context,
                      mobile: 14,
                      desktop: 16,
                    ),
                  ),
                  KDimension().kWidth05,
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Icon(
                      Icons.visibility_outlined,
                      color: AppColors.orange,
                      size: getValueForScreenType(
                        context: context,
                        mobile: 15,
                        desktop: 20,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

        KDimension().kHeight20,
      ],
    );
  }
}
