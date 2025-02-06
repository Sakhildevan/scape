// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tickets_participant_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TicketsParticipantListModel _$TicketsParticipantListModelFromJson(
    Map<String, dynamic> json) {
  return _TicketsParticipantListModel.fromJson(json);
}

/// @nodoc
mixin _$TicketsParticipantListModel {
  List<ListOfParticipant>? get listOfParticipants =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TicketsParticipantListModelCopyWith<TicketsParticipantListModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketsParticipantListModelCopyWith<$Res> {
  factory $TicketsParticipantListModelCopyWith(
          TicketsParticipantListModel value,
          $Res Function(TicketsParticipantListModel) then) =
      _$TicketsParticipantListModelCopyWithImpl<$Res,
          TicketsParticipantListModel>;
  @useResult
  $Res call({List<ListOfParticipant>? listOfParticipants});
}

/// @nodoc
class _$TicketsParticipantListModelCopyWithImpl<$Res,
        $Val extends TicketsParticipantListModel>
    implements $TicketsParticipantListModelCopyWith<$Res> {
  _$TicketsParticipantListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listOfParticipants = freezed,
  }) {
    return _then(_value.copyWith(
      listOfParticipants: freezed == listOfParticipants
          ? _value.listOfParticipants
          : listOfParticipants // ignore: cast_nullable_to_non_nullable
              as List<ListOfParticipant>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TicketsParticipantListModelImplCopyWith<$Res>
    implements $TicketsParticipantListModelCopyWith<$Res> {
  factory _$$TicketsParticipantListModelImplCopyWith(
          _$TicketsParticipantListModelImpl value,
          $Res Function(_$TicketsParticipantListModelImpl) then) =
      __$$TicketsParticipantListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ListOfParticipant>? listOfParticipants});
}

/// @nodoc
class __$$TicketsParticipantListModelImplCopyWithImpl<$Res>
    extends _$TicketsParticipantListModelCopyWithImpl<$Res,
        _$TicketsParticipantListModelImpl>
    implements _$$TicketsParticipantListModelImplCopyWith<$Res> {
  __$$TicketsParticipantListModelImplCopyWithImpl(
      _$TicketsParticipantListModelImpl _value,
      $Res Function(_$TicketsParticipantListModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listOfParticipants = freezed,
  }) {
    return _then(_$TicketsParticipantListModelImpl(
      listOfParticipants: freezed == listOfParticipants
          ? _value._listOfParticipants
          : listOfParticipants // ignore: cast_nullable_to_non_nullable
              as List<ListOfParticipant>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TicketsParticipantListModelImpl
    implements _TicketsParticipantListModel {
  const _$TicketsParticipantListModelImpl(
      {final List<ListOfParticipant>? listOfParticipants})
      : _listOfParticipants = listOfParticipants;

  factory _$TicketsParticipantListModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$TicketsParticipantListModelImplFromJson(json);

  final List<ListOfParticipant>? _listOfParticipants;
  @override
  List<ListOfParticipant>? get listOfParticipants {
    final value = _listOfParticipants;
    if (value == null) return null;
    if (_listOfParticipants is EqualUnmodifiableListView)
      return _listOfParticipants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TicketsParticipantListModel(listOfParticipants: $listOfParticipants)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketsParticipantListModelImpl &&
            const DeepCollectionEquality()
                .equals(other._listOfParticipants, _listOfParticipants));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_listOfParticipants));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TicketsParticipantListModelImplCopyWith<_$TicketsParticipantListModelImpl>
      get copyWith => __$$TicketsParticipantListModelImplCopyWithImpl<
          _$TicketsParticipantListModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TicketsParticipantListModelImplToJson(
      this,
    );
  }
}

abstract class _TicketsParticipantListModel
    implements TicketsParticipantListModel {
  const factory _TicketsParticipantListModel(
          {final List<ListOfParticipant>? listOfParticipants}) =
      _$TicketsParticipantListModelImpl;

  factory _TicketsParticipantListModel.fromJson(Map<String, dynamic> json) =
      _$TicketsParticipantListModelImpl.fromJson;

  @override
  List<ListOfParticipant>? get listOfParticipants;
  @override
  @JsonKey(ignore: true)
  _$$TicketsParticipantListModelImplCopyWith<_$TicketsParticipantListModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ListOfParticipant _$ListOfParticipantFromJson(Map<String, dynamic> json) {
  return _ListOfParticipant.fromJson(json);
}

/// @nodoc
mixin _$ListOfParticipant {
  String? get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListOfParticipantCopyWith<ListOfParticipant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListOfParticipantCopyWith<$Res> {
  factory $ListOfParticipantCopyWith(
          ListOfParticipant value, $Res Function(ListOfParticipant) then) =
      _$ListOfParticipantCopyWithImpl<$Res, ListOfParticipant>;
  @useResult
  $Res call({String? name, String? email});
}

/// @nodoc
class _$ListOfParticipantCopyWithImpl<$Res, $Val extends ListOfParticipant>
    implements $ListOfParticipantCopyWith<$Res> {
  _$ListOfParticipantCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListOfParticipantImplCopyWith<$Res>
    implements $ListOfParticipantCopyWith<$Res> {
  factory _$$ListOfParticipantImplCopyWith(_$ListOfParticipantImpl value,
          $Res Function(_$ListOfParticipantImpl) then) =
      __$$ListOfParticipantImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, String? email});
}

/// @nodoc
class __$$ListOfParticipantImplCopyWithImpl<$Res>
    extends _$ListOfParticipantCopyWithImpl<$Res, _$ListOfParticipantImpl>
    implements _$$ListOfParticipantImplCopyWith<$Res> {
  __$$ListOfParticipantImplCopyWithImpl(_$ListOfParticipantImpl _value,
      $Res Function(_$ListOfParticipantImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? email = freezed,
  }) {
    return _then(_$ListOfParticipantImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListOfParticipantImpl implements _ListOfParticipant {
  const _$ListOfParticipantImpl({this.name, this.email});

  factory _$ListOfParticipantImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListOfParticipantImplFromJson(json);

  @override
  final String? name;
  @override
  final String? email;

  @override
  String toString() {
    return 'ListOfParticipant(name: $name, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListOfParticipantImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListOfParticipantImplCopyWith<_$ListOfParticipantImpl> get copyWith =>
      __$$ListOfParticipantImplCopyWithImpl<_$ListOfParticipantImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListOfParticipantImplToJson(
      this,
    );
  }
}

abstract class _ListOfParticipant implements ListOfParticipant {
  const factory _ListOfParticipant({final String? name, final String? email}) =
      _$ListOfParticipantImpl;

  factory _ListOfParticipant.fromJson(Map<String, dynamic> json) =
      _$ListOfParticipantImpl.fromJson;

  @override
  String? get name;
  @override
  String? get email;
  @override
  @JsonKey(ignore: true)
  _$$ListOfParticipantImplCopyWith<_$ListOfParticipantImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
