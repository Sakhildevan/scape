import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:scape/core/utils/common_widgets/custom_view/animated_button.dart';
import 'package:scape/core/utils/string_constants.dart';
import 'package:scape/src/promo_code/presentation/bloc/promo_code_bloc.dart';
import 'package:scape/src/ticket_booking/presentation/bloc/ticket_booking_bloc.dart';

class ConfirmOrderButton extends StatelessWidget {
  const ConfirmOrderButton({
    super.key,
    required this.sizingInformation,
    required this.totalCost,
  });
  final SizingInformation sizingInformation;
  final num? totalCost;
  @override
  Widget build(BuildContext context) {
    return AnimatedTextButton(
      text: !isGreaterThanZero(totalCost)
          ? StringConst.confirm.toUpperCase()
          : "Next".toUpperCase(),
      showPrefixWidget: true,
      onPressed: () {
        !isGreaterThanZero(totalCost)
            ? context
                .read<TicketBookingBloc>()
                .add(ConfirmFreeBooking(context: context))
            : context
                .read<PromoCodeBloc>()
                .add(PromoCodeNextBtnClicked(context, "test"));
      },
      smallDevice: sizingInformation.screenSize.width > 1000 ? false : true,
    );
  }

  bool isGreaterThanZero(num? value) {
    // First check if value is null
    if (value == null) {
      return false;
    }
    return value > 0;
  }
}
