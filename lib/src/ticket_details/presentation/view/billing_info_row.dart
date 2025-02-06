// import 'package:flutter/material.dart';
// import 'package:scape/core/utils/styles/app_colors.dart';
// import 'package:scape/core/utils/styles/text_styles.dart';

// class BillingInfoRow extends StatelessWidget {
//   final String label;
//   final String value;

//   const BillingInfoRow({super.key, required this.label, required this.value});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Expanded(child: Kstyles().reg(text: '$label:', size: 16)),
//           Expanded(
//               flex: 2,
//               child: Kstyles()
//                   .bold(text: value, size: 16, color: AppColors.orange))
//         ],
//       ),
//     );
//   }
// }
