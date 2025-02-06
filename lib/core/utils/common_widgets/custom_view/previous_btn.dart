import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:scape/core/utils/common_widgets/custom_view/animated_button.dart';
import 'package:scape/core/utils/string_constants.dart';
import 'package:scape/src/home/presentation/bloc/home_bloc.dart';

class PreviousButton extends StatelessWidget {
  const PreviousButton({
    super.key,
    required this.index,
    required this.sizingInformation,
  });
  final int index;
  final SizingInformation sizingInformation;

  @override
  Widget build(BuildContext context) {
    return AnimatedTextButton(
      text: StringConst.previous.toUpperCase(),
      showSuffixWidget: true,
      onPressed: () => backTo(context),
      smallDevice: sizingInformation.screenSize.width > 1000 ? false : true,
    );
  }

  void backTo(BuildContext context) async {
    switch (Pages.values[index]) {
      //!--- EmailProviding page---
      case Pages.emailProviding:

      //!--- RegisterFromEvent page---
      case Pages.registerFromEvent:
        var eventCode = await GetStorage().read(StringConst.eventKey);
        context.replace("${StringConst.startBookingViewRoute}/$eventCode");

      //!--- OTPValidation page---
      case Pages.otpValidation:
        var eventCode = await GetStorage().read(StringConst.eventKey);
        context.replace("${StringConst.startBookingViewRoute}/$eventCode");

      // //!--- Retrieve Info page---
      // case Pages.retrieveInfoPage:
      //   context.go(StringConst.otpViewRoute);

      //!--- TicketBooking page---
      // case Pages.ticketBooking:
      //   context.go(StringConst.retrieveMyInfoViewRoute);

      //!--- PromocodeDetails page---
      case Pages.promoCode:
        context.go(StringConst.ticketBookingViewRoute);

      //todo:
      // case Pages.bookingConfirmation:
      //   context.go(StringConst.promoCodeViewRoute);

      // //!-----profile page---
      // case Pages.profile:
      //   context.go(StringConst.bookingConfirmationViewRoute);

      case Pages.ticketDetails:
        context.go(StringConst.profileViewRoute);
      // context.go(StringConst.ticketDetailsViewRoute);

      default:
    }
  }
}
