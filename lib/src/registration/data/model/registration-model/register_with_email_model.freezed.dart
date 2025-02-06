// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_with_email_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RegisterWithEmailModel _$RegisterWithEmailModelFromJson(
    Map<String, dynamic> json) {
  return _RegisterWithEmailModel.fromJson(json);
}

/// @nodoc
mixin _$RegisterWithEmailModel {
  RegistrationDetailsForOtp? get registrationDetailsForOTP =>
      throw _privateConstructorUsedError;
  String? get IsSuccess => throw _privateConstructorUsedError;
  String? get ErrorOnFailure => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegisterWithEmailModelCopyWith<RegisterWithEmailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterWithEmailModelCopyWith<$Res> {
  factory $RegisterWithEmailModelCopyWith(RegisterWithEmailModel value,
          $Res Function(RegisterWithEmailModel) then) =
      _$RegisterWithEmailModelCopyWithImpl<$Res, RegisterWithEmailModel>;
  @useResult
  $Res call(
      {RegistrationDetailsForOtp? registrationDetailsForOTP,
      String? IsSuccess,
      String? ErrorOnFailure});

  $RegistrationDetailsForOtpCopyWith<$Res>? get registrationDetailsForOTP;
}

/// @nodoc
class _$RegisterWithEmailModelCopyWithImpl<$Res,
        $Val extends RegisterWithEmailModel>
    implements $RegisterWithEmailModelCopyWith<$Res> {
  _$RegisterWithEmailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? registrationDetailsForOTP = freezed,
    Object? IsSuccess = freezed,
    Object? ErrorOnFailure = freezed,
  }) {
    return _then(_value.copyWith(
      registrationDetailsForOTP: freezed == registrationDetailsForOTP
          ? _value.registrationDetailsForOTP
          : registrationDetailsForOTP // ignore: cast_nullable_to_non_nullable
              as RegistrationDetailsForOtp?,
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
  $RegistrationDetailsForOtpCopyWith<$Res>? get registrationDetailsForOTP {
    if (_value.registrationDetailsForOTP == null) {
      return null;
    }

    return $RegistrationDetailsForOtpCopyWith<$Res>(
        _value.registrationDetailsForOTP!, (value) {
      return _then(_value.copyWith(registrationDetailsForOTP: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RegisterWithEmailModelImplCopyWith<$Res>
    implements $RegisterWithEmailModelCopyWith<$Res> {
  factory _$$RegisterWithEmailModelImplCopyWith(
          _$RegisterWithEmailModelImpl value,
          $Res Function(_$RegisterWithEmailModelImpl) then) =
      __$$RegisterWithEmailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RegistrationDetailsForOtp? registrationDetailsForOTP,
      String? IsSuccess,
      String? ErrorOnFailure});

  @override
  $RegistrationDetailsForOtpCopyWith<$Res>? get registrationDetailsForOTP;
}

/// @nodoc
class __$$RegisterWithEmailModelImplCopyWithImpl<$Res>
    extends _$RegisterWithEmailModelCopyWithImpl<$Res,
        _$RegisterWithEmailModelImpl>
    implements _$$RegisterWithEmailModelImplCopyWith<$Res> {
  __$$RegisterWithEmailModelImplCopyWithImpl(
      _$RegisterWithEmailModelImpl _value,
      $Res Function(_$RegisterWithEmailModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? registrationDetailsForOTP = freezed,
    Object? IsSuccess = freezed,
    Object? ErrorOnFailure = freezed,
  }) {
    return _then(_$RegisterWithEmailModelImpl(
      registrationDetailsForOTP: freezed == registrationDetailsForOTP
          ? _value.registrationDetailsForOTP
          : registrationDetailsForOTP // ignore: cast_nullable_to_non_nullable
              as RegistrationDetailsForOtp?,
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
class _$RegisterWithEmailModelImpl implements _RegisterWithEmailModel {
  const _$RegisterWithEmailModelImpl(
      {this.registrationDetailsForOTP, this.IsSuccess, this.ErrorOnFailure});

  factory _$RegisterWithEmailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegisterWithEmailModelImplFromJson(json);

  @override
  final RegistrationDetailsForOtp? registrationDetailsForOTP;
  @override
  final String? IsSuccess;
  @override
  final String? ErrorOnFailure;

  @override
  String toString() {
    return 'RegisterWithEmailModel(registrationDetailsForOTP: $registrationDetailsForOTP, IsSuccess: $IsSuccess, ErrorOnFailure: $ErrorOnFailure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterWithEmailModelImpl &&
            (identical(other.registrationDetailsForOTP,
                    registrationDetailsForOTP) ||
                other.registrationDetailsForOTP == registrationDetailsForOTP) &&
            (identical(other.IsSuccess, IsSuccess) ||
                other.IsSuccess == IsSuccess) &&
            (identical(other.ErrorOnFailure, ErrorOnFailure) ||
                other.ErrorOnFailure == ErrorOnFailure));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, registrationDetailsForOTP, IsSuccess, ErrorOnFailure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterWithEmailModelImplCopyWith<_$RegisterWithEmailModelImpl>
      get copyWith => __$$RegisterWithEmailModelImplCopyWithImpl<
          _$RegisterWithEmailModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegisterWithEmailModelImplToJson(
      this,
    );
  }
}

abstract class _RegisterWithEmailModel implements RegisterWithEmailModel {
  const factory _RegisterWithEmailModel(
      {final RegistrationDetailsForOtp? registrationDetailsForOTP,
      final String? IsSuccess,
      final String? ErrorOnFailure}) = _$RegisterWithEmailModelImpl;

  factory _RegisterWithEmailModel.fromJson(Map<String, dynamic> json) =
      _$RegisterWithEmailModelImpl.fromJson;

  @override
  RegistrationDetailsForOtp? get registrationDetailsForOTP;
  @override
  String? get IsSuccess;
  @override
  String? get ErrorOnFailure;
  @override
  @JsonKey(ignore: true)
  _$$RegisterWithEmailModelImplCopyWith<_$RegisterWithEmailModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RegistrationDetailsForOtp _$RegistrationDetailsForOtpFromJson(
    Map<String, dynamic> json) {
  return _RegistrationDetailsForOtp.fromJson(json);
}

/// @nodoc
mixin _$RegistrationDetailsForOtp {
  String? get TempLoginToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegistrationDetailsForOtpCopyWith<RegistrationDetailsForOtp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegistrationDetailsForOtpCopyWith<$Res> {
  factory $RegistrationDetailsForOtpCopyWith(RegistrationDetailsForOtp value,
          $Res Function(RegistrationDetailsForOtp) then) =
      _$RegistrationDetailsForOtpCopyWithImpl<$Res, RegistrationDetailsForOtp>;
  @useResult
  $Res call({String? TempLoginToken});
}

/// @nodoc
class _$RegistrationDetailsForOtpCopyWithImpl<$Res,
        $Val extends RegistrationDetailsForOtp>
    implements $RegistrationDetailsForOtpCopyWith<$Res> {
  _$RegistrationDetailsForOtpCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? TempLoginToken = freezed,
  }) {
    return _then(_value.copyWith(
      TempLoginToken: freezed == TempLoginToken
          ? _value.TempLoginToken
          : TempLoginToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegistrationDetailsForOtpImplCopyWith<$Res>
    implements $RegistrationDetailsForOtpCopyWith<$Res> {
  factory _$$RegistrationDetailsForOtpImplCopyWith(
          _$RegistrationDetailsForOtpImpl value,
          $Res Function(_$RegistrationDetailsForOtpImpl) then) =
      __$$RegistrationDetailsForOtpImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? TempLoginToken});
}

/// @nodoc
class __$$RegistrationDetailsForOtpImplCopyWithImpl<$Res>
    extends _$RegistrationDetailsForOtpCopyWithImpl<$Res,
        _$RegistrationDetailsForOtpImpl>
    implements _$$RegistrationDetailsForOtpImplCopyWith<$Res> {
  __$$RegistrationDetailsForOtpImplCopyWithImpl(
      _$RegistrationDetailsForOtpImpl _value,
      $Res Function(_$RegistrationDetailsForOtpImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? TempLoginToken = freezed,
  }) {
    return _then(_$RegistrationDetailsForOtpImpl(
      TempLoginToken: freezed == TempLoginToken
          ? _value.TempLoginToken
          : TempLoginToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RegistrationDetailsForOtpImpl implements _RegistrationDetailsForOtp {
  const _$RegistrationDetailsForOtpImpl({this.TempLoginToken});

  factory _$RegistrationDetailsForOtpImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegistrationDetailsForOtpImplFromJson(json);

  @override
  final String? TempLoginToken;

  @override
  String toString() {
    return 'RegistrationDetailsForOtp(TempLoginToken: $TempLoginToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegistrationDetailsForOtpImpl &&
            (identical(other.TempLoginToken, TempLoginToken) ||
                other.TempLoginToken == TempLoginToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, TempLoginToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegistrationDetailsForOtpImplCopyWith<_$RegistrationDetailsForOtpImpl>
      get copyWith => __$$RegistrationDetailsForOtpImplCopyWithImpl<
          _$RegistrationDetailsForOtpImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegistrationDetailsForOtpImplToJson(
      this,
    );
  }
}

abstract class _RegistrationDetailsForOtp implements RegistrationDetailsForOtp {
  const factory _RegistrationDetailsForOtp({final String? TempLoginToken}) =
      _$RegistrationDetailsForOtpImpl;

  factory _RegistrationDetailsForOtp.fromJson(Map<String, dynamic> json) =
      _$RegistrationDetailsForOtpImpl.fromJson;

  @override
  String? get TempLoginToken;
  @override
  @JsonKey(ignore: true)
  _$$RegistrationDetailsForOtpImplCopyWith<_$RegistrationDetailsForOtpImpl>
      get copyWith => throw _privateConstructorUsedError;
}
