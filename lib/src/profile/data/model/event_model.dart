import 'dart:convert';
import 'package:equatable/equatable.dart';

class EventModel extends Equatable {
  final String imageUrl;
  final String title;
  const EventModel({
    required this.imageUrl,
    required this.title,
  });

  @override
  List<Object> get props => [imageUrl, title];

  EventModel copyWith({
    String? imageUrl,
    String? title,
  }) {
    return EventModel(
      imageUrl: imageUrl ?? this.imageUrl,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'imageUrl': imageUrl,
      'title': title,
    };
  }

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      imageUrl: map['imageUrl'] as String,
      title: map['title'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory EventModel.fromJson(String source) =>
      EventModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
