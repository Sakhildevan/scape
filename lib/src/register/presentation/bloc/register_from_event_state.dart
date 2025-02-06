import 'package:equatable/equatable.dart';
import 'package:scape/core/utils/enums.dart';

class RegisterFromEventState extends Equatable {
  final bool isChecked;
  final bool isCheckedMarketingConsent;
  final String firstName;
  final String lastName;
  final String email;
  final int question1AnswerNo;
  final int question2AnswerNo;

  final ApiStatus apiStatus;
  final String errorMessage;
  const RegisterFromEventState({
    this.apiStatus = ApiStatus.initial,
    this.isChecked = true,
    this.isCheckedMarketingConsent = true,
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.errorMessage = '',
    this.question1AnswerNo = 0,
    this.question2AnswerNo = 0,
  });

  @override
  List<Object> get props => [
        apiStatus,
        errorMessage,
        isChecked,
        isCheckedMarketingConsent,
        firstName,
        lastName,
        email,
        question1AnswerNo,
        question2AnswerNo,
      ];

  RegisterFromEventState copyWith({
    ApiStatus? apiStatus,
    String? errorMessage,
    bool? showOtpWidget,
    bool? isChecked,
    bool? isCheckedMarketingConsent,
    bool? needRegistration,
    String? firstName,
    String? lastName,
    String? email,
    String? tempToken,
    String? otp,
    int? question1AnswerNo,
    int? question2AnswerNo,
  }) {
    return RegisterFromEventState(
      apiStatus: apiStatus ?? this.apiStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      isChecked: isChecked ?? this.isChecked,
      isCheckedMarketingConsent:
          isCheckedMarketingConsent ?? this.isCheckedMarketingConsent,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      question1AnswerNo: question1AnswerNo ?? this.question1AnswerNo,
      question2AnswerNo: question2AnswerNo ?? this.question2AnswerNo,
    );
  }
}

final class RegisterFromEventStateInitial extends RegisterFromEventState {}
