import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:scape/core/utils/enums.dart';
import 'package:scape/src/start-booking/data/repository/start_booking_repository.dart';

part 'start_booking_event.dart';
part 'start_booking_state.dart';

class StartBookingBloc extends Bloc<StartBookingEvent, StartBookingState> {
  final StartBookingRepository repository;
  StartBookingBloc({required this.repository})
      : super(const StartBookingState()) {
    on<StoreEventInformation>(_storeEventInformation);
  }

  FutureOr<void> _storeEventInformation(
      StoreEventInformation event, Emitter<StartBookingState> emit) async {
    emit(state.copyWith(initialApiStatus: ApiStatus.loading));
    final result = await repository.storeEventKey(
      eventKey: event.eventKey,
    );
    result.fold(
      (failure) {
        emit(state.copyWith(
          initialApiStatus: ApiStatus.failure,
          errorMessage: failure.message,
        ));
      },
      (val) => emit(state.copyWith(
        initialApiStatus: ApiStatus.success,
      )),
    );
  }
}
