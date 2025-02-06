// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_with_email_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoginWithEmailModel _$LoginWithEmailModelFromJson(Map<String, dynamic> json) {
  return _LoginWithEmailModel.fromJson(json);
}

/// @nodoc
mixin _$LoginWithEmailModel {
  LoginDetailsForOtp? get loginDetailsForOTP =>
      throw _privateConstructorUsedError;
  String? get IsSuccess => throw _privateConstructorUsedError;
  String? get ErrorOnFailure => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginWithEmailModelCopyWith<LoginWithEmailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginWithEmailModelCopyWith<$Res> {
  factory $LoginWithEmailModelCopyWith(
          LoginWithEmailModel value, $Res Function(LoginWithEmailModel) then) =
      _$LoginWithEmailModelCopyWithImpl<$Res, LoginWithEmailModel>;
  @useResult
  $Res call(
      {LoginDetailsForOtp? loginDetailsForOTP,
      String? IsSuccess,
      String? ErrorOnFailure});

  $LoginDetailsForOtpCopyWith<$Res>? get loginDetailsForOTP;
}

/// @nodoc
class _$LoginWithEmailModelCopyWithImpl<$Res, $Val extends LoginWithEmailModel>
    implements $LoginWithEmailModelCopyWith<$Res> {
  _$LoginWithEmailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginDetailsForOTP = freezed,
    Object? IsSuccess = freezed,
    Object? ErrorOnFailure = freezed,
  }) {
    return _then(_value.copyWith(
      loginDetailsForOTP: freezed == loginDetailsForOTP
          ? _value.loginDetailsForOTP
          : loginDetailsForOTP // ignore: cast_nullable_to_non_nullable
              as LoginDetailsForOtp?,
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
  $LoginDetailsForOtpCopyWith<$Res>? get loginDetailsForOTP {
    if (_value.loginDetailsForOTP == null) {
      return null;
    }

    return $LoginDetailsForOtpCopyWith<$Res>(_value.loginDetailsForOTP!,
        (value) {
      return _then(_value.copyWith(loginDetailsForOTP: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LoginWithEmailModelImplCopyWith<$Res>
    implements $LoginWithEmailModelCopyWith<$Res> {
  factory _$$LoginWithEmailModelImplCopyWith(_$LoginWithEmailModelImpl value,
          $Res Function(_$LoginWithEmailModelImpl) then) =
      __$$LoginWithEmailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LoginDetailsForOtp? loginDetailsForOTP,
      String? IsSuccess,
      String? ErrorOnFailure});

  @override
  $LoginDetailsForOtpCopyWith<$Res>? get loginDetailsForOTP;
}

/// @nodoc
class __$$LoginWithEmailModelImplCopyWithImpl<$Res>
    extends _$LoginWithEmailModelCopyWithImpl<$Res, _$LoginWithEmailModelImpl>
    implements _$$LoginWithEmailModelImplCopyWith<$Res> {
  __$$LoginWithEmailModelImplCopyWithImpl(_$LoginWithEmailModelImpl _value,
      $Res Function(_$LoginWithEmailModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginDetailsForOTP = freezed,
    Object? IsSuccess = freezed,
    Object? ErrorOnFailure = freezed,
  }) {
    return _then(_$LoginWithEmailModelImpl(
      loginDetailsForOTP: freezed == loginDetailsForOTP
          ? _value.loginDetailsForOTP
          : loginDetailsForOTP // ignore: cast_nullable_to_non_nullable
              as LoginDetailsForOtp?,
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
class _$LoginWithEmailModelImpl implements _LoginWithEmailModel {
  const _$LoginWithEmailModelImpl(
      {this.loginDetailsForOTP, this.IsSuccess, this.ErrorOnFailure});

  factory _$LoginWithEmailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginWithEmailModelImplFromJson(json);

  @override
  final LoginDetailsForOtp? loginDetailsForOTP;
  @override
  final String? IsSuccess;
  @override
  final String? ErrorOnFailure;

  @override
  String toString() {
    return 'LoginWithEmailModel(loginDetailsForOTP: $loginDetailsForOTP, IsSuccess: $IsSuccess, ErrorOnFailure: $ErrorOnFailure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginWithEmailModelImpl &&
            (identical(other.loginDetailsForOTP, loginDetailsForOTP) ||
                other.loginDetailsForOTP == loginDetailsForOTP) &&
            (identical(other.IsSuccess, IsSuccess) ||
                other.IsSuccess == IsSuccess) &&
            (identical(other.ErrorOnFailure, ErrorOnFailure) ||
                other.ErrorOnFailure == ErrorOnFailure));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, loginDetailsForOTP, IsSuccess, ErrorOnFailure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginWithEmailModelImplCopyWith<_$LoginWithEmailModelImpl> get copyWith =>
      __$$LoginWithEmailModelImplCopyWithImpl<_$LoginWithEmailModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginWithEmailModelImplToJson(
      this,
    );
  }
}

abstract class _LoginWithEmailModel implements LoginWithEmailModel {
  const factory _LoginWithEmailModel(
      {final LoginDetailsForOtp? loginDetailsForOTP,
      final String? IsSuccess,
      final String? ErrorOnFailure}) = _$LoginWithEmailModelImpl;

  factory _LoginWithEmailModel.fromJson(Map<String, dynamic> json) =
      _$LoginWithEmailModelImpl.fromJson;

  @override
  LoginDetailsForOtp? get loginDetailsForOTP;
  @override
  String? get IsSuccess;
  @override
  String? get ErrorOnFailure;
  @override
  @JsonKey(ignore: true)
  _$$LoginWithEmailModelImplCopyWith<_$LoginWithEmailModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LoginDetailsForOtp _$LoginDetailsForOtpFromJson(Map<String, dynamic> json) {
  return _LoginDetailsForOtp.fromJson(json);
}

/// @nodoc
mixin _$LoginDetailsForOtp {
  String? get TempLoginToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginDetailsForOtpCopyWith<LoginDetailsForOtp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginDetailsForOtpCopyWith<$Res> {
  factory $LoginDetailsForOtpCopyWith(
          LoginDetailsForOtp value, $Res Function(LoginDetailsForOtp) then) =
      _$LoginDetailsForOtpCopyWithImpl<$Res, LoginDetailsForOtp>;
  @useResult
  $Res call({String? TempLoginToken});
}

/// @nodoc
class _$LoginDetailsForOtpCopyWithImpl<$Res, $Val extends LoginDetailsForOtp>
    implements $LoginDetailsForOtpCopyWith<$Res> {
  _$LoginDetailsForOtpCopyWithImpl(this._value, this._then);

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
abstract class _$$LoginDetailsForOtpImplCopyWith<$Res>
    implements $LoginDetailsForOtpCopyWith<$Res> {
  factory _$$LoginDetailsForOtpImplCopyWith(_$LoginDetailsForOtpImpl value,
          $Res Function(_$LoginDetailsForOtpImpl) then) =
      __$$LoginDetailsForOtpImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? TempLoginToken});
}

/// @nodoc
class __$$LoginDetailsForOtpImplCopyWithImpl<$Res>
    extends _$LoginDetailsForOtpCopyWithImpl<$Res, _$LoginDetailsForOtpImpl>
    implements _$$LoginDetailsForOtpImplCopyWith<$Res> {
  __$$LoginDetailsForOtpImplCopyWithImpl(_$LoginDetailsForOtpImpl _value,
      $Res Function(_$LoginDetailsForOtpImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? TempLoginToken = freezed,
  }) {
    return _then(_$LoginDetailsForOtpImpl(
      TempLoginToken: freezed == TempLoginToken
          ? _value.TempLoginToken
          : TempLoginToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginDetailsForOtpImpl implements _LoginDetailsForOtp {
  const _$LoginDetailsForOtpImpl({this.TempLoginToken});

  factory _$LoginDetailsForOtpImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginDetailsForOtpImplFromJson(json);

  @override
  final String? TempLoginToken;

  @override
  String toString() {
    return 'LoginDetailsForOtp(TempLoginToken: $TempLoginToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginDetailsForOtpImpl &&
            (identical(other.TempLoginToken, TempLoginToken) ||
                other.TempLoginToken == TempLoginToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, TempLoginToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginDetailsForOtpImplCopyWith<_$LoginDetailsForOtpImpl> get copyWith =>
      __$$LoginDetailsForOtpImplCopyWithImpl<_$LoginDetailsForOtpImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginDetailsForOtpImplToJson(
      this,
    );
  }
}

abstract class _LoginDetailsForOtp implements LoginDetailsForOtp {
  const factory _LoginDetailsForOtp({final String? TempLoginToken}) =
      _$LoginDetailsForOtpImpl;

  factory _LoginDetailsForOtp.fromJson(Map<String, dynamic> json) =
      _$LoginDetailsForOtpImpl.fromJson;

  @override
  String? get TempLoginToken;
  @override
  @JsonKey(ignore: true)
  _$$LoginDetailsForOtpImplCopyWith<_$LoginDetailsForOtpImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
