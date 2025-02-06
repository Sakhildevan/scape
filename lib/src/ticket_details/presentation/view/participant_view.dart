import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:scape/core/utils/common_func.dart';
import 'package:scape/core/utils/common_widgets/loading_widgets/popup_loading.dart';
import 'package:scape/core/utils/constants.dart';
import 'package:scape/core/utils/string_constants.dart';
import 'package:scape/core/utils/styles/app_colors.dart';
import 'package:scape/core/utils/styles/dimensions.dart';
import 'package:scape/src/ticket_details/presentation/bloc/ticket_details_bloc.dart';
import 'package:scape/src/ticket_details/presentation/custom-pdf-generation/custom_export_delegate.dart';

import '../../../../core/utils/styles/text_styles.dart';
import 'participant_card.dart';

class ParticipantsView extends StatelessWidget {
  const ParticipantsView(
      {super.key,
      required this.exportDelegate,
      required this.sizingInformation,
      required this.eventName});
  final CustomExportDelegate exportDelegate;
  final SizingInformation sizingInformation;
  final String eventName;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.transparent,
      padding: EdgeInsets.symmetric(
        horizontal: getValueForScreenType(
          context: context,
          mobile: 0,
          tablet: Constants.width * 0.05,
          desktop: 0,
        ),
      ),
      child: BlocBuilder<TicketDetailsBloc, TicketDetailsState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(state.sortedMap.keys.length, (index) {
              final packageName = state.sortedMap.keys.elementAt(index);
              final tickets = state.sortedMap[packageName];
              bool isQrDynamic = false;
              if (state.ticket.isNotEmpty) {
                isQrDynamic = state.ticket[0].ticketValidationMode ==
                    StringConst.dynamicKey;
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (index == 0 && !isQrDynamic)
                    SizedBox(
                      width: getValueForScreenType(
                        context: context,
                        mobile: double.infinity,
                        // desktop: Constants.width > 1440 ? 900 : 800,
                      ),
                      child: GestureDetector(
                        onTap: () async {
                          popupLoading(context);
                          try {
                            await generatePdf(
                              context,
                              exportDelegate,
                              sizingInformation,
                              eventName,
                            );
                            if (context.mounted) {
                              context.pop();
                            }
                          } catch (e) {
                            print(e.toString());
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: Icon(
                                Icons.download,
                                size: 20,
                                color: AppColors.red,
                              ),
                            ),
                            KDimension().kWidth05,
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: Kstyles().med(
                                  text: "Download ticket",
                                  color: AppColors.red,
                                  size: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                  KDimension().kHeight10,
                  SizedBox(
                    // width: getValueForScreenType(
                    //   context: context,
                    //   mobile: double.infinity,
                    //   desktop: Constants.width > 1440 ? 900 : 800,
                    // ),
                    child: Row(
                      children: [
                        Kstyles().bold(
                          text: packageName,
                          size: getValueForScreenType(
                            context: context,
                            mobile: 16,
                            tablet: 18,
                            desktop: 20,
                          ),
                        ),
                        KDimension().kWidth15,
                        const Expanded(
                          flex: 4,
                          child: Divider(
                            color: AppColors.orange,
                          ),
                        )
                      ],
                    ),
                  ),
                  KDimension().kHeight10,
                  Column(
                    children: tickets
                            ?.asMap()
                            .entries
                            .map(
                              (ticket) => ParticipantCard(
                                participantNumber: (ticket.key + 1),
                                name: ticket.value.participantName ?? "",
                                packageName: ticket.value.packageName ?? "",
                                qrCode: ticket.value.participantTicketURL ?? "",
                                venues: ticket.value.venues ?? [],
                                isDynamicQrCode: isQrDynamic,
                                bookingReference:
                                    ticket.value.participantBookingReference ??
                                        "",
                              ),
                            )
                            .toList() ??
                        [],
                  ),
                  KDimension().kHeight15,
                  const Divider(
                    color: AppColors.greyShade,
                  ),
                ],
              );
            }),
          );

          // ListView.builder(
          //   shrinkWrap: true,
          //   itemCount: state.sortedMap.keys.length,
          //   itemBuilder: (context, index) {
          //     final packageName = state.sortedMap.keys.elementAt(index);
          //     final tickets = state.sortedMap[packageName];
          //     bool isQrDynamic = false;
          //     if (state.ticket.isNotEmpty) {
          //       isQrDynamic = state.ticket[0].ticketValidationMode ==
          //           StringConst.dynamicKey;
          //     }

          //     return Column(
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       children: [
          //         if (index == 0 && !isQrDynamic)
          //           SizedBox(
          //             width: getValueForScreenType(
          //               context: context,
          //               mobile: double.infinity,
          //               // desktop: Constants.width > 1440 ? 900 : 800,
          //             ),
          //             child: GestureDetector(
          //               onTap: () async {
          //                 popupLoading(context);
          //                 try {
          //                   await generatePdf(
          //                     context,
          //                     exportDelegate,
          //                     sizingInformation,
          //                     eventName,
          //                   );
          //                   if (context.mounted) {
          //                     context.pop();
          //                   }
          //                 } catch (e) {
          //                   print(e.toString());
          //                 }
          //               },
          //               child: Row(
          //                 mainAxisAlignment: MainAxisAlignment.end,
          //                 children: [
          //                   const MouseRegion(
          //                     cursor: SystemMouseCursors.click,
          //                     child: Icon(
          //                       Icons.download,
          //                       size: 20,
          //                       color: AppColors.red,
          //                     ),
          //                   ),
          //                   KDimension().kWidth05,
          //                   MouseRegion(
          //                     cursor: SystemMouseCursors.click,
          //                     child: Kstyles().med(
          //                         text: "Download ticket",
          //                         color: AppColors.red,
          //                         size: 14),
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           ),
          //         KDimension().kHeight10,
          //         SizedBox(
          //           // width: getValueForScreenType(
          //           //   context: context,
          //           //   mobile: double.infinity,
          //           //   desktop: Constants.width > 1440 ? 900 : 800,
          //           // ),
          //           child: Row(
          //             children: [
          //               Kstyles().bold(
          //                 text: packageName,
          //                 size: getValueForScreenType(
          //                   context: context,
          //                   mobile: 16,
          //                   tablet: 18,
          //                   desktop: 20,
          //                 ),
          //               ),
          //               KDimension().kWidth15,
          //               const Expanded(
          //                 flex: 4,
          //                 child: Divider(
          //                   color: AppColors.orange,
          //                 ),
          //               )
          //             ],
          //           ),
          //         ),
          //         KDimension().kHeight10,
          //         Column(
          //           children: tickets
          //                   ?.asMap()
          //                   .entries
          //                   .map(
          //                     (ticket) => ParticipantCard(
          //                       participantNumber: (ticket.key + 1),
          //                       name: ticket.value.participantName ?? "",
          //                       packageName: ticket.value.packageName ?? "",
          //                       qrCode: ticket.value.participantTicketURL ?? "",
          //                       venues: ticket.value.venues ?? [],
          //                       isDynamicQrCode: isQrDynamic,
          //                       bookingReference:
          //                           ticket.value.participantBookingReference ??
          //                               "",
          //                     ),
          //                   )
          //                   .toList() ??
          //               [],
          //         ),
          //         KDimension().kHeight15,
          //         const Divider(
          //           color: AppColors.greyShade,
          //         ),
          //       ],
          //     );
          //   },
          // );
        },
      ),
    );
  }
}
