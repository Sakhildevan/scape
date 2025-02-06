import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:scape/core/utils/dotted_separator.dart';
import 'package:scape/core/utils/styles/app_colors.dart';
import 'package:scape/core/utils/styles/dimensions.dart';
import 'package:scape/core/utils/styles/text_styles.dart';
import 'package:scape/src/booking_confirmation/presentation/bloc/booking_confirm_bloc.dart';
import 'package:scape/src/email-providing-view/data/model/event-model/event_info_model.dart';
import 'package:scape/src/ticket_details/presentation/view/admission_row.dart';
import '../../../../core/utils/string_constants.dart';

class BookingConfirmDetailBox extends StatelessWidget {
  const BookingConfirmDetailBox(
      {super.key, required this.state, required this.eventInfo});

  final BookingConfirmState state;
  final EventInfoModel eventInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundColor3,
      child: _buildBookingDetails(
        context: context,
      ),
    );
  }

//!----booking details

  Widget _buildBookingDetails({required BuildContext context}) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: getValueForScreenType(
          context: context,
          mobile: 15,
          desktop: 20,
        ),
      ),

      //!-----column inside the right side of the container
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //!----admission section
          _admissionSection(context, state),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Kstyles().semibold(
                text: StringConst.totalPayable,
                color: AppColors.black,
                size: 18,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  buildAmount(context),
                  Kstyles().reg(
                    text: StringConst.gst,
                    size: 12,
                  ),
                ],
              ),
            ],
          ),
          KDimension().kHeight10,
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
        desktop: 18,
      ),
      color: AppColors.orange,
    );
  }

  //!-----admission section
  Widget _admissionSection(
    BuildContext context,
    BookingConfirmState state,
  ) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Kstyles().semibold(
                text: StringConst.admission,
                color: AppColors.black,
                size: 18,
              ),
              KDimension().kHeight05,
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.bookingSessionDetailModel
                        ?.bookingSessionDeatils?.BookedPackages?.length ??
                    0,
                itemBuilder: (context, index) {
                  var item = state.bookingSessionDetailModel
                      ?.bookingSessionDeatils?.BookedPackages![index];
                  var eventList = eventInfo.eventSettings?.EventPackages ?? [];

                  String packageName = eventList
                          .firstWhere((event) =>
                              event.EventPackageCode.toString() ==
                              item?.EventPackageCode)
                          .PackageName ??
                      "";
                  return AdmissionRow(
                    label: packageName,
                    quantity: item?.Quantity.toString() ?? '1',
                    price: item?.PackageCost?.toStringAsFixed(2) ?? '0.00',
                  );
                },
              ),
            ],
          ),
          Visibility(
            visible: state.bookingSessionDetailModel?.bookingSessionDeatils
                    ?.PromocodeDiscount !=
                0,
            child: _discountWidget(state, context),
          ),
          KDimension().kHeight20,
          const DottedSeparator(
            height: 1,
            dashLength: 4, // Make dots smaller
            dashGapLength: 2, // Reduce space between dots
          ),
        ],
      ),
    );
  }

  Padding _discountWidget(BookingConfirmState state, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Kstyles().semibold(
            text: StringConst.discounts,
            color: AppColors.black,
            size: 18,
          ),
          Row(
            children: [
              Kstyles().med(
                text: StringConst.promoCodeDiscount,
                color: AppColors.black,
                size: 14,
              ),
              const Spacer(),
              Kstyles().semibold(
                text:
                    '\$${state?.bookingSessionDetailModel?.bookingSessionDeatils?.PromocodeDiscount?.toStringAsFixed(2) ?? '0.00'}',
                size: getValueForScreenType(
                  context: context,
                  mobile: 14,
                  desktop: 18,
                ),
                color: AppColors.orange,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
