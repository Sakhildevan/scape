// ignore_for_file: public_member_api_docs, sort_constructors_first
// home_state.dart
part of 'home_bloc.dart';

class HomeState extends Equatable {
  final int selectedIndex;
  final bool showAddButton;
  final String participantName;
  final String participantEmail;

  const HomeState({
    this.selectedIndex = 0,
    this.showAddButton = false,
    this.participantName = "",
    this.participantEmail = "",
  });

  @override
  List<Object> get props => [
        selectedIndex,
        showAddButton,
        participantName,
        participantEmail,
      ];

  HomeState copyWith({
    int? selectedIndex,
    bool? showAddButton,
    String? participantName,
    String? participantEmail,
  }) {
    return HomeState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      showAddButton: showAddButton ?? this.showAddButton,
      participantName: participantName ?? this.participantName,
      participantEmail: participantEmail ?? this.participantEmail,
    );
  }
}

final class HomeInitial extends HomeState {}
