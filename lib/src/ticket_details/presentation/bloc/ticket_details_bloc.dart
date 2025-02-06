import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:scape/core/utils/enums.dart';
import 'package:scape/src/ticket_details/model/admission_model.dart';
import 'package:scape/src/ticket_details/model/dynamic_ticket_model/dynamic_ticket_model.dart';
import 'package:scape/src/ticket_details/model/participant_model.dart';
import 'package:scape/src/ticket_details/model/static_page_model/static_page_model.dart';
import '../../model/profile_model_test.dart';
import '../../data/repository/ticket_details_repostory.dart';
import '../../model/ticket_model/ticket_model.dart';

part 'ticket_details_event.dart';
part 'ticket_details_state.dart';

class TicketDetailsBloc extends Bloc<TicketDetailsEvent, TicketDetailsState> {
  final TicketDetailsRepostory repository;
  static const int _duration = 5 * 60;
  Timer? _timer;

  TicketDetailsBloc({required this.repository})
      : super(const TicketDetailsState()) {
    on<StartTimer>(_startTimer);
    on<TimerTicked>(_timerTicked);
    on<FetchTicket>(_fetchTicket);
    on<GetDynamicTicketEvent>(_getDynamicTicket);
    on<GetStaticPage>(_getStaticPage);
    on<ToggleTextExpandEvent>(_toggleTextExpand);
  }

  Future<void> _fetchTicket(
      FetchTicket event, Emitter<TicketDetailsState> emit) async {
    emit(state.copyWith(initialApiStatus: ApiStatus.loading));
    final response = await repository.getTicket(event.ticketCode);
    response.fold((failure) {
      emit(state.copyWith(
        initialApiStatus: ApiStatus.failure,
        errorMessage: failure.message,
      ));
      return failure;
    }, (ticket) {
      // Grouping tickets by packageName
      Map<String, List<ParticipantTicket>> groupedTickets = {};

      for (var ticket in ticket.ticket?.participantTickets ?? []) {
        if (!groupedTickets.containsKey(ticket.packageName)) {
          groupedTickets[ticket.packageName ?? ""] = [];
        }
        groupedTickets[ticket.packageName]?.add(ticket);
      }

      emit(state.copyWith(
        ticketModel: ticket,
        ticket: [ticket],
        initialApiStatus: ApiStatus.success,
        sortedMap: groupedTickets,
      ));
    });
  }

  Future<void> _getDynamicTicket(
      GetDynamicTicketEvent event, Emitter<TicketDetailsState> emit) async {
    emit(
        state.copyWith(apiStatus: ApiStatus.loading, timerDuration: _duration));
    final response = await repository.getDynamicTicket(event.referenceCode);
    response.fold((failure) {
      emit(state.copyWith(
        apiStatus: ApiStatus.failure,
        errorMessage: failure.message,
      ));
      return failure;
    }, (data) {
      emit(state.copyWith(
        dynamicTicketModel: data,
        apiStatus: ApiStatus.success,
      ));
      add(StartTimer());
    });
  }

  Future<void> _getStaticPage(
      GetStaticPage event, Emitter<TicketDetailsState> emit) async {
    emit(state.copyWith(apiStatus: ApiStatus.loading));
    final response = await repository.getStatic();
    response.fold((failure) {
      emit(state.copyWith(
        apiStatus: ApiStatus.failure,
        errorMessage: failure.message,
      ));
      return failure;
    }, (staticPage) {
      emit(state.copyWith(
        staticPageModel: staticPage,
        apiStatus: ApiStatus.success,
      ));
    });
  }

  FutureOr<void> _toggleTextExpand(
      ToggleTextExpandEvent event, Emitter<TicketDetailsState> emit) {
    emit(state.copyWith(isExpandedText: !event.currentValue));
  }

  FutureOr<void> _timerTicked(
      TimerTicked event, Emitter<TicketDetailsState> emit) {
    if (event.duration > 0) {
      emit(state.copyWith(timerDuration: event.duration));
    } else {
      emit(state.copyWith(timerStatus: TIMER.complete));
      _timer?.cancel();
    }
  }

  FutureOr<void> _startTimer(
      StartTimer event, Emitter<TicketDetailsState> emit) {
    emit(state.copyWith(timerDuration: _duration, timerStatus: TIMER.running));
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      add(TimerTicked(_duration - timer.tick));
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
