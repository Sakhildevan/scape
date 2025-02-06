part of 'ticket_booking_bloc.dart';

sealed class TicketBookingEvent extends Equatable {
  const TicketBookingEvent();

  @override
  List<Object> get props => [];
}

class CheckIsSessionCreatedEvent extends TicketBookingEvent {
  final BuildContext context;
  final bool addInitialParticipantValue;
  final bool participantAdded;
  final bool updateValueFor1stUser;
  final int? ticketIndex;
  final List<int>? updateTicketQtyList;

  const CheckIsSessionCreatedEvent(
    this.context, {
    this.addInitialParticipantValue = false,
    this.participantAdded = false,
    this.updateValueFor1stUser = false,
    this.ticketIndex,
    this.updateTicketQtyList,
  });
  @override
  List<Object> get props => [
        context,
        addInitialParticipantValue,
        updateValueFor1stUser,
        participantAdded,
      ];
}

class CheckIsSessionCreatedUpdateEvent extends TicketBookingEvent {
  final BuildContext context;
  final bool addInitialParticipantValue;
  final bool participantAdded;
  final bool updateValueFor1stUser;
  final int? ticketIndex;
  final List<int>? updateTicketQtyList;

  const CheckIsSessionCreatedUpdateEvent(
    this.context, {
    this.addInitialParticipantValue = false,
    this.participantAdded = false,
    this.updateValueFor1stUser = false,
    this.ticketIndex,
    this.updateTicketQtyList,
  });
  @override
  List<Object> get props => [
        context,
        addInitialParticipantValue,
        updateValueFor1stUser,
        participantAdded,
      ];
}

class TicketBookingNextBtnClicked extends TicketBookingEvent {
  final BuildContext context;

  const TicketBookingNextBtnClicked(this.context);

  @override
  List<Object> get props => [
        context,
      ];
}

class CreateSessionDirectly extends TicketBookingEvent {
  final BuildContext context;
  final bool addInitialParticipantValue;
  final bool updateValueFor1stUser;
  final int? ticketIndex;
  final List<int>? updateTicketQtyList;

  const CreateSessionDirectly(
    this.context, {
    this.addInitialParticipantValue = false,
    this.updateValueFor1stUser = false,
    this.ticketIndex,
    this.updateTicketQtyList,
  });
  @override
  List<Object> get props => [
        context,
        addInitialParticipantValue,
        updateValueFor1stUser,
      ];
}

class GetBookingSessionInformation extends TicketBookingEvent {
  final BuildContext context;
  final bool addInitialParticipantValue;
  final bool participantAdded;
  final bool updateValueFor1stUser;
  final int? ticketIndex;
  final List<int>? updateTicketQtyList;

  const GetBookingSessionInformation(
    this.context, {
    this.addInitialParticipantValue = false,
    this.participantAdded = false,
    this.updateValueFor1stUser = false,
    this.ticketIndex,
    this.updateTicketQtyList,
  });
  @override
  List<Object> get props => [
        context,
        addInitialParticipantValue,
        updateValueFor1stUser,
        participantAdded,
      ];
}

class GetUpdatedBookingSessionEvent extends TicketBookingEvent {
  final BuildContext context;
  final bool addInitialParticipantValue;
  final bool participantAdded;
  final bool updateValueFor1stUser;
  final int? ticketIndex;
  final List<int>? updateTicketQtyList;

  const GetUpdatedBookingSessionEvent(
    this.context, {
    this.addInitialParticipantValue = false,
    this.participantAdded = false,
    this.updateValueFor1stUser = false,
    this.ticketIndex,
    this.updateTicketQtyList,
  });
  @override
  List<Object> get props => [
        context,
        addInitialParticipantValue,
        updateValueFor1stUser,
        participantAdded,
      ];
}

// class BookingSessionDetailsEvent extends TicketBookingEvent {
//   final BuildContext context;

//   const BookingSessionDetailsEvent(this.context);

//   @override
//   List<Object> get props => [
//         context,
//       ];
// }

class NavigateConfirmBooking extends TicketBookingEvent {
  final BuildContext context;

  const NavigateConfirmBooking(this.context);

  @override
  List<Object> get props => [
        context,
      ];
}

class UpdateTicketQty extends TicketBookingEvent {
  final int ticketIndex;
  final int participantIndex;
  final bool isIncrement;
  final bool fromAddParticipant;
  final BuildContext context;

  const UpdateTicketQty({
    this.fromAddParticipant = false,
    required this.isIncrement,
    required this.ticketIndex,
    required this.participantIndex,
    required this.context,
  });

  @override
  List<Object> get props => [
        ticketIndex,
        isIncrement,
        participantIndex,
        fromAddParticipant,
        context,
      ];
}

class CreateInitialQtyList extends TicketBookingEvent {
  final int length;
  const CreateInitialQtyList({required this.length});

  @override
  List<Object> get props => [length];
}

class CreateQtyList extends TicketBookingEvent {
  final int length;
  final List<EventPackageWithLimit> eventPackages;
  const CreateQtyList({
    required this.length,
    required this.eventPackages,
  });

  @override
  List<Object> get props => [
        length,
        eventPackages,
      ];
}

class AddMultipleTicketInitial extends TicketBookingEvent {
  const AddMultipleTicketInitial({required this.context});
  final BuildContext context;
  @override
  List<Object> get props => [context];
}

class GetEventInfoWithLimit extends TicketBookingEvent {
  const GetEventInfoWithLimit();

  @override
  List<Object> get props => [];
}

class GetUpdatedEventInfoWithLimit extends TicketBookingEvent {
  const GetUpdatedEventInfoWithLimit();

  @override
  List<Object> get props => [];
}

class BackToParticipantAddPage extends TicketBookingEvent {
  const BackToParticipantAddPage();

  @override
  List<Object> get props => [];
}

class BackToQuantityAddPage extends TicketBookingEvent {
  const BackToQuantityAddPage();

  @override
  List<Object> get props => [];
}

class InitializeParticipantsController extends TicketBookingEvent {
  const InitializeParticipantsController({required this.eventData});
  final GetEventWithPackageLimitModel eventData;

  @override
  List<Object> get props => [eventData];
}

class AddEmptyParticipant extends TicketBookingEvent {
  const AddEmptyParticipant({
    required this.eventPackageCode,
    required this.context,
    required this.ticketIndex,
  });
  final String eventPackageCode;
  final BuildContext context;
  final int ticketIndex;
  @override
  List<Object> get props => [
        eventPackageCode,
        context,
        ticketIndex,
      ];
}

class DeleteParticipant extends TicketBookingEvent {
  const DeleteParticipant({
    required this.participantCode,
    required this.context,
    required this.ticketIndex,
    required this.participantIndex,
  });
  final String participantCode;
  final BuildContext context;
  final int ticketIndex;
  final int participantIndex;
  @override
  List<Object> get props => [
        participantCode,
        context,
        ticketIndex,
        participantIndex,
      ];
}

class PackageParticipantUpdateEvent extends TicketBookingEvent {
  final String name;
  final String email;
  final String packageCode;
  final bool isCompleted;
  final bool showLoading;
  final BuildContext context;

  const PackageParticipantUpdateEvent({
    required this.name,
    required this.email,
    required this.packageCode,
    required this.isCompleted,
    required this.showLoading,
    required this.context,
  });

  @override
  List<Object> get props => [
        name,
        email,
        packageCode,
        isCompleted,
        showLoading,
        context,
      ];
}

class CheckAllParticipantUpdatedEvent extends TicketBookingEvent {
  const CheckAllParticipantUpdatedEvent({
    required this.isCompleted,
    required this.context,
  });

  final bool isCompleted;
  final BuildContext context;
  @override
  List<Object> get props => [
        isCompleted,
        context,
      ];
}

class ConfirmFreeBooking extends TicketBookingEvent {
  const ConfirmFreeBooking({
    required this.context,
  });
  final BuildContext context;
  @override
  List<Object> get props => [context];
}
