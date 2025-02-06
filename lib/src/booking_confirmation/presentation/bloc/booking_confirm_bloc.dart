import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:scape/src/booking_confirmation/data/booking_confirm_repository.dart';

import '../../../../core/utils/enums.dart';
import '../../../ticket_booking/data/model/booking_session_detail/booking_session_detail_model.dart';

part 'booking_confirm_event.dart';

part 'booking_confirm_state.dart';

class BookingConfirmBloc
    extends Bloc<BookingConfirmEvent, BookingConfirmState> {
  final BookingConfirmationRepository repository;

  BookingConfirmBloc({required this.repository})
      : super(const BookingConfirmState()) {
    on<GetDetailAPI>(_getDetailAPI);
    on<GetTicketFromBookingSessionAPI>(_getTicketFromBookingSessionAPI);
    on<ToggleTextExpandEventP>(_toggleTextExpand);
  }

  FutureOr<void> _getDetailAPI(
    GetDetailAPI event,
    Emitter<BookingConfirmState> emit,
  ) async {
    emit(state.copyWith(initialApiStatus: ApiStatus.loading));

    final response = await repository.checkIsEventSessionSaved();

    response.fold((failure) {
      emit(state.copyWith(
        initialApiStatus: ApiStatus.failure,
        errorMessage: failure.message,
      ));
    }, (bookingSession) {
      List<BookedPackage> bookedParticipants =
          bookingSession.bookingSessionDeatils?.BookedPackages ?? [];

      emit(state.copyWith(
        // initialApiStatus: ApiStatus.success,
        bookingSessionDetailModel: bookingSession,
        bookedParticipants: bookedParticipants,
      ));
      add(const GetTicketFromBookingSessionAPI());
    });
  }

  FutureOr<void> _toggleTextExpand(
      ToggleTextExpandEventP event, Emitter<BookingConfirmState> emit) {
    emit(ToggleTextExpandStateP(isExpandedText: !event.currentValue));
  }

  FutureOr<void> _getTicketFromBookingSessionAPI(
      GetTicketFromBookingSessionAPI event,
      Emitter<BookingConfirmState> emit) async {
    final response = await repository.getTicketCodeByBookingSessionApi();

    response.fold((failure) {
      emit(state.copyWith(
        initialApiStatus: ApiStatus.failure,
        errorMessage: failure.message,
      ));
    }, (result) {
      emit(state.copyWith(
        initialApiStatus: ApiStatus.success,
        ticketCode: result.TicketCode ?? "",
      ));
    });
  }
}
