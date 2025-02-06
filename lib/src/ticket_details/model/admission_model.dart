// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class AdmissionModel extends Equatable {
  final String admissionName;
  final String admissionQuantity;
  final String admissionPrice;
  const AdmissionModel({
    required this.admissionName,
    required this.admissionQuantity,
    required this.admissionPrice,
  });

  @override
  List<Object> get props => [admissionName, admissionQuantity, admissionPrice];

  AdmissionModel copyWith({
    String? admissionName,
    String? admissionQuantity,
    String? admissionPrice,
  }) {
    return AdmissionModel(
      admissionName: admissionName ?? this.admissionName,
      admissionQuantity: admissionQuantity ?? this.admissionQuantity,
      admissionPrice: admissionPrice ?? this.admissionPrice,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'admissionName': admissionName,
      'admissionQuantity': admissionQuantity,
      'admissionSize': admissionPrice,
    };
  }

  factory AdmissionModel.fromMap(Map<String, dynamic> map) {
    return AdmissionModel(
      admissionName: map['admissionName'] as String,
      admissionQuantity: map['admissionQuantity'] as String,
      admissionPrice: map['admissionSize'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AdmissionModel.fromJson(String source) =>
      AdmissionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
