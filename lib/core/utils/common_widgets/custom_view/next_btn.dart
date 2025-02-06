import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:scape/core/utils/common_widgets/custom_view/animated_button.dart';
import 'package:scape/core/utils/extensions.dart';
import 'package:scape/core/utils/string_constants.dart';
import 'package:scape/src/email-providing-view/presentation/bloc/email_providing_bloc.dart';
import 'package:scape/src/home/presentation/bloc/home_bloc.dart';
import 'package:scape/src/otp-verification-view/presentation/bloc/otp_verification_bloc.dart';
import 'package:scape/src/promo_code/presentation/bloc/promo_code_bloc.dart';
import 'package:scape/src/register/presentation/bloc/register_from_event_bloc.dart';
import 'package:scape/src/register/presentation/bloc/register_from_event_event.dart';
import 'package:scape/src/ticket_booking/presentation/bloc/ticket_booking_bloc.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
    required this.index,
    this.emailController,
    this.promoController,
    required this.sizingInformation,
  });
  final SizingInformation sizingInformation;
  final int index;
  final TextEditingController? emailController;
  final TextEditingController? promoController;

  @override
  Widget build(BuildContext context) {
    return AnimatedTextButton(
      text: StringConst.next.toUpperCase(),
      showPrefixWidget: true,
      onPressed: () => navigateToPage(context),
      smallDevice: sizingInformation.screenSize.width > 1000 ? false : true,
    );
  }

  void navigateToPage(BuildContext context) {
    switch (Pages.values[index]) {
      //!--- EmailProviding page---
      case Pages.emailProviding:
        context.read<EmailProvidingBloc>().add(EmailProvidingNextBtnClicked(
            email: emailController?.text.removeAllWhitespace() ?? "",
            context: context));
      //!--- RegisterFromEvent page---
      case Pages.registerFromEvent:
        context
            .read<RegisterFromEventBloc>()
            .add(RegisterFromEventNextBtn(context));
      //!--- OTPValidation page---
      case Pages.otpValidation:
        context.read<OtpVerificationBloc>().add(OtpNextBtnClicked(context));

      //!--- TicketBooking page---
      case Pages.ticketBooking:
        context
            .read<TicketBookingBloc>()
            .add(TicketBookingNextBtnClicked(context));
      //!--- PromoCodeDetails page---
      case Pages.promoCode:
        context
            .read<PromoCodeBloc>()
            .add(PromoCodeNextBtnClicked(context, promoController?.text ?? ""));

      default:
    }
  }
}
