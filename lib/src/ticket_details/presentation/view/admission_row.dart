import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:scape/core/utils/styles/app_colors.dart';
import 'package:scape/core/utils/styles/text_styles.dart';

class AdmissionRow extends StatelessWidget {
  final String label;
  final String quantity;
  final String price;
  final bool showEstaric;

  const AdmissionRow({
    super.key,
    required this.label,
    required this.quantity,
    required this.price,
    this.showEstaric = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Kstyles().med(
              text: "$label x $quantity",
              color: AppColors.black,
              maxLines: 4,
              size: 14,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Kstyles().bold(
              text: "\$$price",
              size: getValueForScreenType(
                  context: context, mobile: 16, desktop: 18),
              color: AppColors.orange,
            ),
          ),
        ],
      ),
    );
  }
}
