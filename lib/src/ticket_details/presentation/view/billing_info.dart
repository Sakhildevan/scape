// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:responsive_builder/responsive_builder.dart';
// import 'package:scape/core/utils/string_constants.dart';
// import 'package:scape/core/utils/styles/text_styles.dart';
// import 'package:scape/src/ticket_details/presentation/bloc/ticket_details_bloc.dart';
// import 'package:scape/src/ticket_details/presentation/view/billing_info_row.dart';

// class BillingInfo extends StatelessWidget {
//   final bool isExpandedNeeds;
//   const BillingInfo({super.key, this.isExpandedNeeds = false});

//   @override
//   Widget build(BuildContext context) {
//     return isExpandedNeeds
//         ? Expanded(child: _buildBillingInfoContent())
//         : _buildBillingInfoContent();
//   }

//   Widget _buildBillingInfoContent() {
//     return BlocBuilder<TicketDetailsBloc, TicketDetailsState>(
//       builder: (context, state) {
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Kstyles().bold(
//               text: StringConst.billingInfo,
//               size: getValueForScreenType(
//                 context: context,
//                 mobile: 16,
//                 desktop: 22,
//               ),
//             ),
//             const SizedBox(height: 8),
//             BillingInfoRow(
//                 label: StringConst.name, value: state.profileModel?.name ?? ''),
//             BillingInfoRow(
//                 label: StringConst.email,
//                 value: state.profileModel?.email ?? ''),
//             BillingInfoRow(
//                 label: StringConst.floor,
//                 value: state.profileModel?.floor ?? ''),
//             BillingInfoRow(
//                 label: StringConst.unit, value: state.profileModel?.unit ?? ''),
//             BillingInfoRow(
//                 label: StringConst.block,
//                 value: state.profileModel?.block ?? ''),
//             BillingInfoRow(
//                 label: StringConst.buildingName,
//                 value: state.profileModel?.building ?? ''),
//             BillingInfoRow(
//                 label: StringConst.street,
//                 value: state.profileModel?.street ?? ''),
//             BillingInfoRow(
//                 label: StringConst.postCode,
//                 value: state.profileModel?.postCode ?? ''),
//           ],
//         );
//       },
//     );
//   }
// }
