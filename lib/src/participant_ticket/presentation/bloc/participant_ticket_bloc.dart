import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:scape/core/utils/enums.dart';
import 'package:scape/src/participant_ticket/data/repository/participant_repository.dart';

import '../../model/participant_model/participant_ticket_model.dart';

part 'participant_ticket_event.dart';
part 'participant_ticket_state.dart';

class ParticipantTicketBloc
    extends Bloc<ParticipantTicketEvent, ParticipantTicketState> {
  final ParticipantRepository participantRepository;

  ParticipantTicketBloc({required this.participantRepository})
      : super(const ParticipantTicketState()) {
    on<ParticipantTicketDetails>(_fetchParticipantDetails);
    on<ToggleTextExpandEventParticipant>(_toggleTextExpand);
  }
  Future<void> _fetchParticipantDetails(ParticipantTicketDetails event,
      Emitter<ParticipantTicketState> emit) async {
    emit(state.copyWith(apiStatus: ApiStatus.loading));
    final response =
        await participantRepository.getParticipant(event.ticketCode);
    response.fold((failure) {
      emit(state.copyWith(
          apiStatus: ApiStatus.failure, errorMsg: failure.message));
      return failure;
    }, (ticket) {
      emit(state.copyWith(
        apiStatus: ApiStatus.success,
        ticketList: [ticket],
        participantTicketModel: ticket,
      ));
    });
  }

  FutureOr<void> _toggleTextExpand(ToggleTextExpandEventParticipant event,
      Emitter<ParticipantTicketState> emit) {
    emit(state.copyWith(isExpandedText: !event.currentValue));
  }
}
