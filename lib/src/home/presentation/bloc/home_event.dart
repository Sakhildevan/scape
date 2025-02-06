part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class PreviousBtnClicked extends HomeEvent {
  final int index;
  const PreviousBtnClicked(this.index);

  @override
  List<Object> get props => [index];
}
