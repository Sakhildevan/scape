import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scape/src/home/data/repository/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

enum Pages {
  emailProviding(0),
  otpValidation(1),
  retrieveInfoPage(2),
  ticketBooking(3),
  promoCode(4),
  bookingConfirmation(5),
  profile(6),
  ticketDetails(7),
  login(8),
  registration(9),
  otp(10),
  registerFromEvent(11);

  const Pages(this.value);

  final int value;
}

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;
  HomeBloc({required this.homeRepository}) : super(const HomeState()) {}
}
