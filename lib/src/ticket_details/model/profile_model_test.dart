// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class ProfileModelTest extends Equatable {
  final String name;
  final String email;
  final String floor;
  final String unit;
  final String block;
  final String building;
  final String street;
  final String postCode;
  const ProfileModelTest({
    required this.name,
    required this.email,
    required this.floor,
    required this.unit,
    required this.block,
    required this.building,
    required this.street,
    required this.postCode,
  });

  ProfileModelTest copyWith({
    String? name,
    String? email,
    String? floor,
    String? unit,
    String? block,
    String? building,
    String? street,
    String? postCode,
  }) {
    return ProfileModelTest(
      name: name ?? this.name,
      email: email ?? this.email,
      floor: floor ?? this.floor,
      unit: unit ?? this.unit,
      block: block ?? this.block,
      building: building ?? this.building,
      street: street ?? this.street,
      postCode: postCode ?? this.postCode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'floor': floor,
      'unit': unit,
      'block': block,
      'building': building,
      'street': street,
      'postCode': postCode,
    };
  }

  factory ProfileModelTest.fromMap(Map<String, dynamic> map) {
    return ProfileModelTest(
      name: map['name'] as String,
      email: map['email'] as String,
      floor: map['floor'] as String,
      unit: map['unit'] as String,
      block: map['block'] as String,
      building: map['building'] as String,
      street: map['street'] as String,
      postCode: map['postCode'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileModelTest.fromJson(String source) =>
      ProfileModelTest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
  @override
  List<Object> get props {
    return [
      name,
      email,
      floor,
      unit,
      block,
      building,
      street,
      postCode,
    ];
  }
}
