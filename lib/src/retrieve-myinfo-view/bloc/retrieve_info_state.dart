import 'package:equatable/equatable.dart';
import 'package:scape/core/utils/enums.dart';

class RetrieveInfoState extends Equatable {
  final ApiStatus apiStatus;
  final ApiStatus initialApiStatus;
  final String errorMessage;
  final String isMyInfoVerified;
  const RetrieveInfoState({
    this.apiStatus = ApiStatus.initial,
    this.initialApiStatus = ApiStatus.initial,
    this.errorMessage = "",
    this.isMyInfoVerified = "no",
  });

  @override
  List<Object> get props => [
        apiStatus,
        initialApiStatus,
        errorMessage,
        isMyInfoVerified,
      ];

  RetrieveInfoState copyWith({
    ApiStatus? apiStatus,
    ApiStatus? initialApiStatus,
    String? errorMessage,
    String? isMyInfoVerified,
  }) {
    return RetrieveInfoState(
      apiStatus: apiStatus ?? this.apiStatus,
      initialApiStatus: initialApiStatus ?? this.initialApiStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      isMyInfoVerified: isMyInfoVerified ?? this.isMyInfoVerified,
    );
  }
}
