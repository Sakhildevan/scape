import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class RegisterFromEventEvent extends Equatable {
  const RegisterFromEventEvent();

  @override
  List<Object> get props => [];
}

class CheckboxChangeEvent extends RegisterFromEventEvent {
  final bool isChecked;

  const CheckboxChangeEvent(this.isChecked);

  @override
  List<Object> get props => [isChecked];
}

class RegisterFromEventNextBtn extends RegisterFromEventEvent {
  final BuildContext context;
  const RegisterFromEventNextBtn(this.context);
}

class StoreEmail extends RegisterFromEventEvent {
  final String email;

  const StoreEmail({
    this.email = "",
  });

  @override
  List<Object> get props => [
        email,
      ];
}

class RegisterFromEventValidationEvent extends RegisterFromEventEvent {
  final String firstName;
  final String lastName;
  // final String email;
  final BuildContext buildContext;

  const RegisterFromEventValidationEvent(
      {required this.firstName,
      required this.lastName,
      // required this.email,
      required this.buildContext});
}

class RegisterFromEventResetEvent extends RegisterFromEventEvent {}

class RegisterFromEventCheckboxMarketingConsentEvent
    extends RegisterFromEventEvent {
  final bool isChecked;

  const RegisterFromEventCheckboxMarketingConsentEvent(this.isChecked);

  @override
  List<Object> get props => [isChecked];
}

class SetQuestionAnswer extends RegisterFromEventEvent {
  final int item;
  final int questionNo;

  const SetQuestionAnswer({
    required this.questionNo,
    required this.item,
  });

  @override
  List<Object> get props => [
        item,
        questionNo,
      ];
}
