import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:scape/core/utils/common_widgets/custom_view/next_btn.dart';
import 'package:scape/src/promo_code/presentation/bloc/promo_code_bloc.dart';
import 'package:scape/src/promo_code/presentation/widgets/confirm_order_btn.dart';

class PromoBottomButton extends StatefulWidget {
  const PromoBottomButton({
    super.key,
    required this.promoCodeController,
  });
  final TextEditingController promoCodeController;

  @override
  State<PromoBottomButton> createState() => _PromoBottomButtonState();
}

class _PromoBottomButtonState extends State<PromoBottomButton> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) =>
          BlocBuilder<PromoCodeBloc, PromoCodeState>(
        builder: (context, state) {
          return state.isPromoCodeApplied
              ? ConfirmOrderButton(
                  sizingInformation: sizingInformation,
                  totalCost: state.bookingSessionDetailModel
                      ?.bookingSessionDeatils?.TotalCost,
                )
              : NextButton(
                  index: 4,
                  promoController: widget.promoCodeController,
                  sizingInformation: sizingInformation,
                );
        },
      ),
    );
  }
}
