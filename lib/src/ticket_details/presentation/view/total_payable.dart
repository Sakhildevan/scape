import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:scape/core/utils/string_constants.dart';
import 'package:scape/core/utils/styles/app_colors.dart';
import 'package:scape/core/utils/styles/dimensions.dart';
import 'package:scape/core/utils/styles/text_styles.dart';
import 'package:scape/src/ticket_details/presentation/bloc/ticket_details_bloc.dart';

import 'admission_row.dart';

class TotalPayable extends StatelessWidget {
  final bool isExpandedNeeds;
  const TotalPayable({super.key, this.isExpandedNeeds = false});

  @override
  Widget build(BuildContext context) {
    return isExpandedNeeds
        ? Expanded(
            child: _buildTotalPayableContent(context: context),
          )
        : _buildTotalPayableContent(context: context);
  }

  Widget _buildTotalPayableContent({required BuildContext context}) {
    return Container(
      color: AppColors.creamyColor,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Kstyles().bold(
                  text: StringConst.totalPayable,
                  size: getValueForScreenType(
                    context: context,
                    mobile: 16,
                    desktop: 20,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Kstyles().bold(
                        text: StringConst.dummyPayable,
                        size: getValueForScreenType(
                          context: context,
                          mobile: 16,
                          desktop: 20,
                        ),
                        color: AppColors.orange),
                    Kstyles().reg(
                        text: StringConst.inclusiveGSTDummy,
                        size: getValueForScreenType(
                            context: context, mobile: 12, desktop: 14))
                  ],
                ),
              ),
            ],
          ),
          KDimension().kHeight15,
          const Divider(),
          KDimension().kHeight15,
          Kstyles().bold(
            text: StringConst.admission,
            size: getValueForScreenType(
              context: context,
              mobile: 16,
              desktop: 20,
            ),
          ),
          KDimension().kHeight10,
          BlocBuilder<TicketDetailsBloc, TicketDetailsState>(
            builder: (context, state) {
              return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.admissionsList?.length ?? 0,
                  itemBuilder: (context, index) {
                    return AdmissionRow(
                        label: state.admissionsList?[index].admissionName ?? '',
                        quantity:
                            state.admissionsList?[index].admissionQuantity ??
                                '',
                        price:
                            state.admissionsList?[index].admissionPrice ?? '');
                  });
            },
          ),
          KDimension().kHeight15,
          const Divider(),
          KDimension().kHeight15,
          const AdmissionRow(
              label: StringConst.promoCodeDiscount,
              quantity: '',
              price: '-S\$5'),
          const AdmissionRow(
              label: StringConst.membershipDiscount,
              quantity: '',
              price: '-S\$5'),
        ],
      ),
    );
  }
}
