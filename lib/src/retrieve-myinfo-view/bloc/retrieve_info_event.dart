import 'package:equatable/equatable.dart';

sealed class RetrieveInfoEvent extends Equatable {
  const RetrieveInfoEvent();

  @override
  List<Object> get props => [];
}

class GetSingPassRedirectUrl extends RetrieveInfoEvent {
  const GetSingPassRedirectUrl();
  @override
  List<Object> get props => [];
}

class ValidateSingpass extends RetrieveInfoEvent {
  final String token;
  const ValidateSingpass({required this.token});
  @override
  List<Object> get props => [token];
}
