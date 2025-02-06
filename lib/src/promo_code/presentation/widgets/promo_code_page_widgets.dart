import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:scape/core/utils/dotted_separator.dart';
import 'package:scape/src/email-providing-view/data/model/event-model/event_info_model.dart';
import 'package:scape/src/promo_code/presentation/bloc/promo_code_bloc.dart';
import '../../../../core/utils/string_constants.dart';
import '../../../../core/utils/styles/app_colors.dart';
import '../../../../core/utils/styles/dimensions.dart';
import '../../../../core/utils/styles/text_styles.dart';
import '../../../ticket_details/presentation/view/admission_row.dart';

class PayableAmount extends StatelessWidget {
  final PromoCodeState? state;

  const PayableAmount({
    super.key,
    this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Kstyles().semibold(
            text: StringConst.totalPayable,
            color: AppColors.black,
            size: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              buildAmount(context),
              Kstyles().reg(
                text: StringConst.gst,
                size: 13,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Text buildAmount(BuildContext context) {
    return Kstyles().bold(
      text:
          "\$${state?.bookingSessionDetailModel?.bookingSessionDeatils?.TotalCost?.toStringAsFixed(2) ?? '0.00'}",
      size: getValueForScreenType(
        context: context,
        mobile: 16,
        desktop: 20,
      ),
      color: AppColors.orange,
    );
  }
}

class AmountDetails extends StatelessWidget {
  final PromoCodeState? state;
  final EventInfoModel eventInfo;

  const AmountDetails({super.key, this.state, required this.eventInfo});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: getValueForScreenType(
                context: context,
                mobile: 20,
                desktop: 30,
              ),
              right: 40,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Kstyles().semibold(
                  text: StringConst.admission,
                  color: AppColors.black,
                  size: 20,
                ),
                KDimension().kHeight05,
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: state?.bookingSessionDetailModel
                          ?.bookingSessionDeatils?.BookedPackages?.length ??
                      0,
                  itemBuilder: (context, index) {
                    var item = state?.bookingSessionDetailModel
                        ?.bookingSessionDeatils?.BookedPackages?[index];
                    String packageName = "";

                    var eventList =
                        eventInfo.eventSettings?.EventPackages ?? [];

                    if (eventList.isNotEmpty) {
                      packageName = eventList
                              .firstWhere((event) =>
                                  event.EventPackageCode.toString() ==
                                  item?.EventPackageCode)
                              .PackageName ??
                          "";
                    }
                    return AdmissionRow(
                      label: packageName,
                      quantity: item?.Quantity?.toString() ?? '1',
                      price: item?.PackageCost?.toStringAsFixed(2) ?? '0.00',
                    );
                  },
                ),
              ],
            ),
          ),
          BlocBuilder<PromoCodeBloc, PromoCodeState>(builder: (context, state) {
            return state.bookingSessionDetailModel?.bookingSessionDeatils
                        ?.Promocode !=
                    ''
                ? _buildPromoCodeApplied(context)
                : const SizedBox();
          }),
          KDimension().kHeight20,
          Padding(
            padding: EdgeInsets.only(
              left: getValueForScreenType(
                context: context,
                mobile: 20,
                desktop: 30,
              ),
              right: 40,
            ),
            child: const DottedSeparator(
              height: 1,
              dashLength: 4, // Make dots smaller
              dashGapLength: 2, // Reduce space between dots
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPromoCodeApplied(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        KDimension().kHeight25,
        Padding(
          padding: EdgeInsets.only(
            left: getValueForScreenType(
              context: context,
              mobile: 20,
              desktop: 30,
            ),
            right: 40,
          ),
          child: Kstyles().semibold(
            text: StringConst.discounts,
            color: AppColors.black,
            size: 20,
          ),
        ),
        KDimension().kHeight05,
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: getValueForScreenType(
                  context: context,
                  mobile: 20,
                  desktop: 30,
                ),
                right: 40,
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Kstyles().med(
                        text: StringConst.promoCodeDiscount,
                        color: AppColors.black,
                        size: 16,
                      ),
                      const Spacer(),
                      Kstyles().semibold(
                        text:
                            '\$${state?.bookingSessionDetailModel?.bookingSessionDeatils?.PromocodeDiscount?.toStringAsFixed(2) ?? '0.00'}',
                        size: getValueForScreenType(
                          context: context,
                          mobile: 16,
                          desktop: 20,
                        ),
                        color: AppColors.orange,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              right: 12,
              top: getValueForScreenType(
                  context: context, mobile: -8, tablet: -8, desktop: -6),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: InkWell(
                  splashColor: AppColors.lighterGrey,
                  onTap: () {
                    context
                        .read<PromoCodeBloc>()
                        .add(PromoCodePrevious(context));
                  },
                  child: const SizedBox(
                    height: 40,
                    child: Icon(
                      Icons.delete,
                      color: AppColors.red,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
            left: getValueForScreenType(
              context: context,
              mobile: 20,
              desktop: 30,
            ),
            right: 40,
          ),
          child: Kstyles().med(
            text:
                "${state?.bookingSessionDetailModel?.bookingSessionDeatils?.Promocode}",
            color: AppColors.black,
            size: 16,
          ),
        ),
      ],
    );
  }
}

class PromoCode extends StatefulWidget {
  final TextEditingController promoCodeController;
  const PromoCode({
    super.key,
    required this.promoCodeController,
  });

  @override
  State<PromoCode> createState() => _PromoCodeState();
}

class _PromoCodeState extends State<PromoCode> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: _buildPromoCodeInput(context),
    );
  }

  Widget _buildPromoCodeInput(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Transform.rotate(
              angle: 320,
              child: const Icon(
                Icons.confirmation_num_outlined,
                color: AppColors.black,
                size: 20.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Kstyles().semibold(
                text: StringConst.havePromoCode,
                size: 14,
                color: AppColors.orange,
              ),
            ),
          ],
        ),
        KDimension().kHeight15,
        Container(
          width: 300,
          height: 40,
          color: AppColors.white,
          child: DottedBorder(
            dashPattern: const [10, 4],
            color: AppColors.orange,
            child: SizedBox(
              height: 40,
              child: TextField(
                textAlign: TextAlign.start,
                controller: widget.promoCodeController,
                textAlignVertical: TextAlignVertical.center,
                style: const TextStyle(
                  height: 1.0,
                ),
                readOnly: widget.promoCodeController.text.isNotEmpty,
                decoration: const InputDecoration(
                  fillColor: Colors.transparent,
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 14,
                  ),
                  constraints: BoxConstraints(
                    maxHeight: 40,
                    minHeight: 40,
                  ),
                ),
                onSubmitted: (value) {
                  context.read<PromoCodeBloc>().add(
                        PromoCodeNext(value, context),
                      );
                },
              ),
            ),
          ),
        ),
        KDimension().kHeight10,
        BlocBuilder<PromoCodeBloc, PromoCodeState>(builder: (context, state) {
          return state.bookingSessionDetailModel?.bookingSessionDeatils
                      ?.Promocode !=
                  ''
              ? Kstyles().med(
                  text: "Your promo code has been applied",
                  color: AppColors.black,
                  size: 12,
                )
              : const SizedBox();
        }),
      ],
    );
  }
}
