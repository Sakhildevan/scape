import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:scape/core/utils/styles/dimensions.dart';

import '../../../../../core/utils/string_constants.dart';
import '../../../../../core/utils/styles/app_colors.dart';
import '../../../../../core/utils/styles/text_styles.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key, required this.eventName});
  final String eventName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: getValueForScreenType(
          context: context,
          mobile: 25,
          tablet: 25,
          desktop: 50,
        ),
        vertical: 20,
      ),
      color: AppColors.white,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Kstyles().reg(
            text: StringConst.bookYourTicketsFor,
            color: AppColors.orange,
            size: 14,
          ),
          KDimension().kHeight05,
          Kstyles().bold(
            text: eventName,
            size: getValueForScreenType(
              context: context,
              mobile: 18,
              desktop: 24,
            ),
          ),
        ],
      ),
    );
  }
}
