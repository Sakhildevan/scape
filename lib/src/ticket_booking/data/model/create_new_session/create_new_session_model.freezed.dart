// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_new_session_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateNewSessionModel _$CreateNewSessionModelFromJson(
    Map<String, dynamic> json) {
  return _CreateNewSessionModel.fromJson(json);
}

/// @nodoc
mixin _$CreateNewSessionModel {
  BookingSessionDetails? get bookingSessionDetails =>
      throw _privateConstructorUsedError;
  String? get IsSuccess => throw _privateConstructorUsedError;
  String? get ErrorOnFailure => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateNewSessionModelCopyWith<CreateNewSessionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateNewSessionModelCopyWith<$Res> {
  factory $CreateNewSessionModelCopyWith(CreateNewSessionModel value,
          $Res Function(CreateNewSessionModel) then) =
      _$CreateNewSessionModelCopyWithImpl<$Res, CreateNewSessionModel>;
  @useResult
  $Res call(
      {BookingSessionDetails? bookingSessionDetails,
      String? IsSuccess,
      String? ErrorOnFailure});

  $BookingSessionDetailsCopyWith<$Res>? get bookingSessionDetails;
}

/// @nodoc
class _$CreateNewSessionModelCopyWithImpl<$Res,
        $Val extends CreateNewSessionModel>
    implements $CreateNewSessionModelCopyWith<$Res> {
  _$CreateNewSessionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingSessionDetails = freezed,
    Object? IsSuccess = freezed,
    Object? ErrorOnFailure = freezed,
  }) {
    return _then(_value.copyWith(
      bookingSessionDetails: freezed == bookingSessionDetails
          ? _value.bookingSessionDetails
          : bookingSessionDetails // ignore: cast_nullable_to_non_nullable
              as BookingSessionDetails?,
      IsSuccess: freezed == IsSuccess
          ? _value.IsSuccess
          : IsSuccess // ignore: cast_nullable_to_non_nullable
              as String?,
      ErrorOnFailure: freezed == ErrorOnFailure
          ? _value.ErrorOnFailure
          : ErrorOnFailure // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BookingSessionDetailsCopyWith<$Res>? get bookingSessionDetails {
    if (_value.bookingSessionDetails == null) {
      return null;
    }

    return $BookingSessionDetailsCopyWith<$Res>(_value.bookingSessionDetails!,
        (value) {
      return _then(_value.copyWith(bookingSessionDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreateNewSessionModelImplCopyWith<$Res>
    implements $CreateNewSessionModelCopyWith<$Res> {
  factory _$$CreateNewSessionModelImplCopyWith(
          _$CreateNewSessionModelImpl value,
          $Res Function(_$CreateNewSessionModelImpl) then) =
      __$$CreateNewSessionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BookingSessionDetails? bookingSessionDetails,
      String? IsSuccess,
      String? ErrorOnFailure});

  @override
  $BookingSessionDetailsCopyWith<$Res>? get bookingSessionDetails;
}

/// @nodoc
class __$$CreateNewSessionModelImplCopyWithImpl<$Res>
    extends _$CreateNewSessionModelCopyWithImpl<$Res,
        _$CreateNewSessionModelImpl>
    implements _$$CreateNewSessionModelImplCopyWith<$Res> {
  __$$CreateNewSessionModelImplCopyWithImpl(_$CreateNewSessionModelImpl _value,
      $Res Function(_$CreateNewSessionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingSessionDetails = freezed,
    Object? IsSuccess = freezed,
    Object? ErrorOnFailure = freezed,
  }) {
    return _then(_$CreateNewSessionModelImpl(
      bookingSessionDetails: freezed == bookingSessionDetails
          ? _value.bookingSessionDetails
          : bookingSessionDetails // ignore: cast_nullable_to_non_nullable
              as BookingSessionDetails?,
      IsSuccess: freezed == IsSuccess
          ? _value.IsSuccess
          : IsSuccess // ignore: cast_nullable_to_non_nullable
              as String?,
      ErrorOnFailure: freezed == ErrorOnFailure
          ? _value.ErrorOnFailure
          : ErrorOnFailure // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateNewSessionModelImpl implements _CreateNewSessionModel {
  const _$CreateNewSessionModelImpl(
      {this.bookingSessionDetails, this.IsSuccess, this.ErrorOnFailure});

  factory _$CreateNewSessionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateNewSessionModelImplFromJson(json);

  @override
  final BookingSessionDetails? bookingSessionDetails;
  @override
  final String? IsSuccess;
  @override
  final String? ErrorOnFailure;

  @override
  String toString() {
    return 'CreateNewSessionModel(bookingSessionDetails: $bookingSessionDetails, IsSuccess: $IsSuccess, ErrorOnFailure: $ErrorOnFailure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateNewSessionModelImpl &&
            (identical(other.bookingSessionDetails, bookingSessionDetails) ||
                other.bookingSessionDetails == bookingSessionDetails) &&
            (identical(other.IsSuccess, IsSuccess) ||
                other.IsSuccess == IsSuccess) &&
            (identical(other.ErrorOnFailure, ErrorOnFailure) ||
                other.ErrorOnFailure == ErrorOnFailure));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, bookingSessionDetails, IsSuccess, ErrorOnFailure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateNewSessionModelImplCopyWith<_$CreateNewSessionModelImpl>
      get copyWith => __$$CreateNewSessionModelImplCopyWithImpl<
          _$CreateNewSessionModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateNewSessionModelImplToJson(
      this,
    );
  }
}

abstract class _CreateNewSessionModel implements CreateNewSessionModel {
  const factory _CreateNewSessionModel(
      {final BookingSessionDetails? bookingSessionDetails,
      final String? IsSuccess,
      final String? ErrorOnFailure}) = _$CreateNewSessionModelImpl;

  factory _CreateNewSessionModel.fromJson(Map<String, dynamic> json) =
      _$CreateNewSessionModelImpl.fromJson;

  @override
  BookingSessionDetails? get bookingSessionDetails;
  @override
  String? get IsSuccess;
  @override
  String? get ErrorOnFailure;
  @override
  @JsonKey(ignore: true)
  _$$CreateNewSessionModelImplCopyWith<_$CreateNewSessionModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

BookingSessionDetails _$BookingSessionDetailsFromJson(
    Map<String, dynamic> json) {
  return _BookingSessionDetails.fromJson(json);
}

/// @nodoc
mixin _$BookingSessionDetails {
  String? get BookingSession => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookingSessionDetailsCopyWith<BookingSessionDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingSessionDetailsCopyWith<$Res> {
  factory $BookingSessionDetailsCopyWith(BookingSessionDetails value,
          $Res Function(BookingSessionDetails) then) =
      _$BookingSessionDetailsCopyWithImpl<$Res, BookingSessionDetails>;
  @useResult
  $Res call({String? BookingSession});
}

/// @nodoc
class _$BookingSessionDetailsCopyWithImpl<$Res,
        $Val extends BookingSessionDetails>
    implements $BookingSessionDetailsCopyWith<$Res> {
  _$BookingSessionDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? BookingSession = freezed,
  }) {
    return _then(_value.copyWith(
      BookingSession: freezed == BookingSession
          ? _value.BookingSession
          : BookingSession // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookingSessionDetailsImplCopyWith<$Res>
    implements $BookingSessionDetailsCopyWith<$Res> {
  factory _$$BookingSessionDetailsImplCopyWith(
          _$BookingSessionDetailsImpl value,
          $Res Function(_$BookingSessionDetailsImpl) then) =
      __$$BookingSessionDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? BookingSession});
}

/// @nodoc
class __$$BookingSessionDetailsImplCopyWithImpl<$Res>
    extends _$BookingSessionDetailsCopyWithImpl<$Res,
        _$BookingSessionDetailsImpl>
    implements _$$BookingSessionDetailsImplCopyWith<$Res> {
  __$$BookingSessionDetailsImplCopyWithImpl(_$BookingSessionDetailsImpl _value,
      $Res Function(_$BookingSessionDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? BookingSession = freezed,
  }) {
    return _then(_$BookingSessionDetailsImpl(
      BookingSession: freezed == BookingSession
          ? _value.BookingSession
          : BookingSession // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookingSessionDetailsImpl implements _BookingSessionDetails {
  const _$BookingSessionDetailsImpl({this.BookingSession});

  factory _$BookingSessionDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookingSessionDetailsImplFromJson(json);

  @override
  final String? BookingSession;

  @override
  String toString() {
    return 'BookingSessionDetails(BookingSession: $BookingSession)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingSessionDetailsImpl &&
            (identical(other.BookingSession, BookingSession) ||
                other.BookingSession == BookingSession));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, BookingSession);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingSessionDetailsImplCopyWith<_$BookingSessionDetailsImpl>
      get copyWith => __$$BookingSessionDetailsImplCopyWithImpl<
          _$BookingSessionDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookingSessionDetailsImplToJson(
      this,
    );
  }
}

abstract class _BookingSessionDetails implements BookingSessionDetails {
  const factory _BookingSessionDetails({final String? BookingSession}) =
      _$BookingSessionDetailsImpl;

  factory _BookingSessionDetails.fromJson(Map<String, dynamic> json) =
      _$BookingSessionDetailsImpl.fromJson;

  @override
  String? get BookingSession;
  @override
  @JsonKey(ignore: true)
  _$$BookingSessionDetailsImplCopyWith<_$BookingSessionDetailsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
