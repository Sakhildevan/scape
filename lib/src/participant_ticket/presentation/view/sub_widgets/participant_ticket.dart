import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:scape/core/utils/constants.dart';
import 'package:scape/core/utils/string_constants.dart';
import 'package:scape/src/ticket_details/presentation/view/participant_card.dart';

import '../../../../../core/utils/styles/app_colors.dart';
import '../../bloc/participant_ticket_bloc.dart';

class ParticipantTicketDetailsView extends StatelessWidget {
  const ParticipantTicketDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: EdgeInsets.symmetric(
        horizontal: getValueForScreenType(
          context: context,
          mobile: 0,
          tablet: Constants.width * 0.05,
          desktop: 0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Row(
            children: [],
          ),
          BlocBuilder<ParticipantTicketBloc, ParticipantTicketState>(
            builder: (context, state) {
              var participantTicket =
                  state.ticketList.firstOrNull?.participantTicket;
              bool isQrDynamic = false;
              if (state.ticketList.isNotEmpty) {
                isQrDynamic = state.ticketList[0].ticketValidationMode ==
                    StringConst.dynamicKey;
              }
              return SizedBox(
                // width: getValueForScreenType(
                //   context: context,
                //   mobile: double.infinity,
                //   tablet: double.infinity,
                //   desktop: 700,
                // ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(
                      participantTicket?.participantOnlyTickets?.length ?? 0,
                      (index) {
                    return ParticipantCard(
                      participantNumber: index + 1,
                      name: participantTicket?.participantOnlyTickets?[index]
                              .participantName ??
                          '',
                      packageName: participantTicket
                              ?.participantOnlyTickets?[index].packageName ??
                          '',
                      qrCode: participantTicket?.participantOnlyTickets?[index]
                              .participantTicketURL ??
                          '',
                      venues: participantTicket
                              ?.participantOnlyTickets?[index].venues ??
                          [],
                      isDynamicQrCode: isQrDynamic,
                      bookingReference: participantTicket
                              ?.participantOnlyTickets?[index]
                              .participantBookingReference ??
                          "",
                      // dateTime: state.participantsList?[index].dateTime ?? '',
                    );
                  }),
                ),

                // ListView.builder(
                //   shrinkWrap: true,
                //   itemCount:
                //       participantTicket?.participantOnlyTickets?.length ?? 0,
                //   itemBuilder: (context, index) {
                //     return ParticipantCard(
                //       participantNumber: index + 1,
                //       name: participantTicket?.participantOnlyTickets?[index]
                //               .participantName ??
                //           '',
                //       packageName: participantTicket
                //               ?.participantOnlyTickets?[index].packageName ??
                //           '',
                //       qrCode: participantTicket?.participantOnlyTickets?[index]
                //               .participantTicketURL ??
                //           '',
                //       venues: participantTicket
                //               ?.participantOnlyTickets?[index].venues ??
                //           [],
                //       isDynamicQrCode: isQrDynamic,
                //       bookingReference: participantTicket
                //               ?.participantOnlyTickets?[index]
                //               .participantBookingReference ??
                //           "",
                //       // dateTime: state.participantsList?[index].dateTime ?? '',
                //     );
                //   },
                // ),
              );
            },
          ),
        ],
      ),
    );
  }
}
