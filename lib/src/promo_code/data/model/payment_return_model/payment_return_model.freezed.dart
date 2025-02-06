// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_return_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaymentReturnModel _$PaymentReturnModelFromJson(Map<String, dynamic> json) {
  return _PaymentReturnModel.fromJson(json);
}

/// @nodoc
mixin _$PaymentReturnModel {
  PaymentReturnDetails? get paymentReturnDetails =>
      throw _privateConstructorUsedError;
  String? get IsSuccess => throw _privateConstructorUsedError;
  String? get ErrorOnFailure => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentReturnModelCopyWith<PaymentReturnModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentReturnModelCopyWith<$Res> {
  factory $PaymentReturnModelCopyWith(
          PaymentReturnModel value, $Res Function(PaymentReturnModel) then) =
      _$PaymentReturnModelCopyWithImpl<$Res, PaymentReturnModel>;
  @useResult
  $Res call(
      {PaymentReturnDetails? paymentReturnDetails,
      String? IsSuccess,
      String? ErrorOnFailure});

  $PaymentReturnDetailsCopyWith<$Res>? get paymentReturnDetails;
}

/// @nodoc
class _$PaymentReturnModelCopyWithImpl<$Res, $Val extends PaymentReturnModel>
    implements $PaymentReturnModelCopyWith<$Res> {
  _$PaymentReturnModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentReturnDetails = freezed,
    Object? IsSuccess = freezed,
    Object? ErrorOnFailure = freezed,
  }) {
    return _then(_value.copyWith(
      paymentReturnDetails: freezed == paymentReturnDetails
          ? _value.paymentReturnDetails
          : paymentReturnDetails // ignore: cast_nullable_to_non_nullable
              as PaymentReturnDetails?,
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
  $PaymentReturnDetailsCopyWith<$Res>? get paymentReturnDetails {
    if (_value.paymentReturnDetails == null) {
      return null;
    }

    return $PaymentReturnDetailsCopyWith<$Res>(_value.paymentReturnDetails!,
        (value) {
      return _then(_value.copyWith(paymentReturnDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PaymentReturnModelImplCopyWith<$Res>
    implements $PaymentReturnModelCopyWith<$Res> {
  factory _$$PaymentReturnModelImplCopyWith(_$PaymentReturnModelImpl value,
          $Res Function(_$PaymentReturnModelImpl) then) =
      __$$PaymentReturnModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PaymentReturnDetails? paymentReturnDetails,
      String? IsSuccess,
      String? ErrorOnFailure});

  @override
  $PaymentReturnDetailsCopyWith<$Res>? get paymentReturnDetails;
}

/// @nodoc
class __$$PaymentReturnModelImplCopyWithImpl<$Res>
    extends _$PaymentReturnModelCopyWithImpl<$Res, _$PaymentReturnModelImpl>
    implements _$$PaymentReturnModelImplCopyWith<$Res> {
  __$$PaymentReturnModelImplCopyWithImpl(_$PaymentReturnModelImpl _value,
      $Res Function(_$PaymentReturnModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentReturnDetails = freezed,
    Object? IsSuccess = freezed,
    Object? ErrorOnFailure = freezed,
  }) {
    return _then(_$PaymentReturnModelImpl(
      paymentReturnDetails: freezed == paymentReturnDetails
          ? _value.paymentReturnDetails
          : paymentReturnDetails // ignore: cast_nullable_to_non_nullable
              as PaymentReturnDetails?,
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
class _$PaymentReturnModelImpl implements _PaymentReturnModel {
  const _$PaymentReturnModelImpl(
      {this.paymentReturnDetails, this.IsSuccess, this.ErrorOnFailure});

  factory _$PaymentReturnModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentReturnModelImplFromJson(json);

  @override
  final PaymentReturnDetails? paymentReturnDetails;
  @override
  final String? IsSuccess;
  @override
  final String? ErrorOnFailure;

  @override
  String toString() {
    return 'PaymentReturnModel(paymentReturnDetails: $paymentReturnDetails, IsSuccess: $IsSuccess, ErrorOnFailure: $ErrorOnFailure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentReturnModelImpl &&
            (identical(other.paymentReturnDetails, paymentReturnDetails) ||
                other.paymentReturnDetails == paymentReturnDetails) &&
            (identical(other.IsSuccess, IsSuccess) ||
                other.IsSuccess == IsSuccess) &&
            (identical(other.ErrorOnFailure, ErrorOnFailure) ||
                other.ErrorOnFailure == ErrorOnFailure));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, paymentReturnDetails, IsSuccess, ErrorOnFailure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentReturnModelImplCopyWith<_$PaymentReturnModelImpl> get copyWith =>
      __$$PaymentReturnModelImplCopyWithImpl<_$PaymentReturnModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentReturnModelImplToJson(
      this,
    );
  }
}

abstract class _PaymentReturnModel implements PaymentReturnModel {
  const factory _PaymentReturnModel(
      {final PaymentReturnDetails? paymentReturnDetails,
      final String? IsSuccess,
      final String? ErrorOnFailure}) = _$PaymentReturnModelImpl;

  factory _PaymentReturnModel.fromJson(Map<String, dynamic> json) =
      _$PaymentReturnModelImpl.fromJson;

  @override
  PaymentReturnDetails? get paymentReturnDetails;
  @override
  String? get IsSuccess;
  @override
  String? get ErrorOnFailure;
  @override
  @JsonKey(ignore: true)
  _$$PaymentReturnModelImplCopyWith<_$PaymentReturnModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaymentReturnDetails _$PaymentReturnDetailsFromJson(Map<String, dynamic> json) {
  return _PaymentReturnDetails.fromJson(json);
}

/// @nodoc
mixin _$PaymentReturnDetails {
  String? get LoginToken => throw _privateConstructorUsedError;
  String? get EventCode => throw _privateConstructorUsedError;
  String? get BookingSession => throw _privateConstructorUsedError;
  String? get IsBookingCompleted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentReturnDetailsCopyWith<PaymentReturnDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentReturnDetailsCopyWith<$Res> {
  factory $PaymentReturnDetailsCopyWith(PaymentReturnDetails value,
          $Res Function(PaymentReturnDetails) then) =
      _$PaymentReturnDetailsCopyWithImpl<$Res, PaymentReturnDetails>;
  @useResult
  $Res call(
      {String? LoginToken,
      String? EventCode,
      String? BookingSession,
      String? IsBookingCompleted});
}

/// @nodoc
class _$PaymentReturnDetailsCopyWithImpl<$Res,
        $Val extends PaymentReturnDetails>
    implements $PaymentReturnDetailsCopyWith<$Res> {
  _$PaymentReturnDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? LoginToken = freezed,
    Object? EventCode = freezed,
    Object? BookingSession = freezed,
    Object? IsBookingCompleted = freezed,
  }) {
    return _then(_value.copyWith(
      LoginToken: freezed == LoginToken
          ? _value.LoginToken
          : LoginToken // ignore: cast_nullable_to_non_nullable
              as String?,
      EventCode: freezed == EventCode
          ? _value.EventCode
          : EventCode // ignore: cast_nullable_to_non_nullable
              as String?,
      BookingSession: freezed == BookingSession
          ? _value.BookingSession
          : BookingSession // ignore: cast_nullable_to_non_nullable
              as String?,
      IsBookingCompleted: freezed == IsBookingCompleted
          ? _value.IsBookingCompleted
          : IsBookingCompleted // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentReturnDetailsImplCopyWith<$Res>
    implements $PaymentReturnDetailsCopyWith<$Res> {
  factory _$$PaymentReturnDetailsImplCopyWith(_$PaymentReturnDetailsImpl value,
          $Res Function(_$PaymentReturnDetailsImpl) then) =
      __$$PaymentReturnDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? LoginToken,
      String? EventCode,
      String? BookingSession,
      String? IsBookingCompleted});
}

/// @nodoc
class __$$PaymentReturnDetailsImplCopyWithImpl<$Res>
    extends _$PaymentReturnDetailsCopyWithImpl<$Res, _$PaymentReturnDetailsImpl>
    implements _$$PaymentReturnDetailsImplCopyWith<$Res> {
  __$$PaymentReturnDetailsImplCopyWithImpl(_$PaymentReturnDetailsImpl _value,
      $Res Function(_$PaymentReturnDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? LoginToken = freezed,
    Object? EventCode = freezed,
    Object? BookingSession = freezed,
    Object? IsBookingCompleted = freezed,
  }) {
    return _then(_$PaymentReturnDetailsImpl(
      LoginToken: freezed == LoginToken
          ? _value.LoginToken
          : LoginToken // ignore: cast_nullable_to_non_nullable
              as String?,
      EventCode: freezed == EventCode
          ? _value.EventCode
          : EventCode // ignore: cast_nullable_to_non_nullable
              as String?,
      BookingSession: freezed == BookingSession
          ? _value.BookingSession
          : BookingSession // ignore: cast_nullable_to_non_nullable
              as String?,
      IsBookingCompleted: freezed == IsBookingCompleted
          ? _value.IsBookingCompleted
          : IsBookingCompleted // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentReturnDetailsImpl implements _PaymentReturnDetails {
  const _$PaymentReturnDetailsImpl(
      {this.LoginToken,
      this.EventCode,
      this.BookingSession,
      this.IsBookingCompleted});

  factory _$PaymentReturnDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentReturnDetailsImplFromJson(json);

  @override
  final String? LoginToken;
  @override
  final String? EventCode;
  @override
  final String? BookingSession;
  @override
  final String? IsBookingCompleted;

  @override
  String toString() {
    return 'PaymentReturnDetails(LoginToken: $LoginToken, EventCode: $EventCode, BookingSession: $BookingSession, IsBookingCompleted: $IsBookingCompleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentReturnDetailsImpl &&
            (identical(other.LoginToken, LoginToken) ||
                other.LoginToken == LoginToken) &&
            (identical(other.EventCode, EventCode) ||
                other.EventCode == EventCode) &&
            (identical(other.BookingSession, BookingSession) ||
                other.BookingSession == BookingSession) &&
            (identical(other.IsBookingCompleted, IsBookingCompleted) ||
                other.IsBookingCompleted == IsBookingCompleted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, LoginToken, EventCode, BookingSession, IsBookingCompleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentReturnDetailsImplCopyWith<_$PaymentReturnDetailsImpl>
      get copyWith =>
          __$$PaymentReturnDetailsImplCopyWithImpl<_$PaymentReturnDetailsImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentReturnDetailsImplToJson(
      this,
    );
  }
}

abstract class _PaymentReturnDetails implements PaymentReturnDetails {
  const factory _PaymentReturnDetails(
      {final String? LoginToken,
      final String? EventCode,
      final String? BookingSession,
      final String? IsBookingCompleted}) = _$PaymentReturnDetailsImpl;

  factory _PaymentReturnDetails.fromJson(Map<String, dynamic> json) =
      _$PaymentReturnDetailsImpl.fromJson;

  @override
  String? get LoginToken;
  @override
  String? get EventCode;
  @override
  String? get BookingSession;
  @override
  String? get IsBookingCompleted;
  @override
  @JsonKey(ignore: true)
  _$$PaymentReturnDetailsImplCopyWith<_$PaymentReturnDetailsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
