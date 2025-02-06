// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'otp_verified_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OtpVerifiedModel _$OtpVerifiedModelFromJson(Map<String, dynamic> json) {
  return _OtpVerifiedModel.fromJson(json);
}

/// @nodoc
mixin _$OtpVerifiedModel {
  LoginDetails? get loginDetails => throw _privateConstructorUsedError;
  String? get IsSuccess => throw _privateConstructorUsedError;
  String? get ErrorOnFailure => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OtpVerifiedModelCopyWith<OtpVerifiedModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtpVerifiedModelCopyWith<$Res> {
  factory $OtpVerifiedModelCopyWith(
          OtpVerifiedModel value, $Res Function(OtpVerifiedModel) then) =
      _$OtpVerifiedModelCopyWithImpl<$Res, OtpVerifiedModel>;
  @useResult
  $Res call(
      {LoginDetails? loginDetails, String? IsSuccess, String? ErrorOnFailure});

  $LoginDetailsCopyWith<$Res>? get loginDetails;
}

/// @nodoc
class _$OtpVerifiedModelCopyWithImpl<$Res, $Val extends OtpVerifiedModel>
    implements $OtpVerifiedModelCopyWith<$Res> {
  _$OtpVerifiedModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginDetails = freezed,
    Object? IsSuccess = freezed,
    Object? ErrorOnFailure = freezed,
  }) {
    return _then(_value.copyWith(
      loginDetails: freezed == loginDetails
          ? _value.loginDetails
          : loginDetails // ignore: cast_nullable_to_non_nullable
              as LoginDetails?,
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
  $LoginDetailsCopyWith<$Res>? get loginDetails {
    if (_value.loginDetails == null) {
      return null;
    }

    return $LoginDetailsCopyWith<$Res>(_value.loginDetails!, (value) {
      return _then(_value.copyWith(loginDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OtpVerifiedModelImplCopyWith<$Res>
    implements $OtpVerifiedModelCopyWith<$Res> {
  factory _$$OtpVerifiedModelImplCopyWith(_$OtpVerifiedModelImpl value,
          $Res Function(_$OtpVerifiedModelImpl) then) =
      __$$OtpVerifiedModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LoginDetails? loginDetails, String? IsSuccess, String? ErrorOnFailure});

  @override
  $LoginDetailsCopyWith<$Res>? get loginDetails;
}

/// @nodoc
class __$$OtpVerifiedModelImplCopyWithImpl<$Res>
    extends _$OtpVerifiedModelCopyWithImpl<$Res, _$OtpVerifiedModelImpl>
    implements _$$OtpVerifiedModelImplCopyWith<$Res> {
  __$$OtpVerifiedModelImplCopyWithImpl(_$OtpVerifiedModelImpl _value,
      $Res Function(_$OtpVerifiedModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginDetails = freezed,
    Object? IsSuccess = freezed,
    Object? ErrorOnFailure = freezed,
  }) {
    return _then(_$OtpVerifiedModelImpl(
      loginDetails: freezed == loginDetails
          ? _value.loginDetails
          : loginDetails // ignore: cast_nullable_to_non_nullable
              as LoginDetails?,
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
class _$OtpVerifiedModelImpl implements _OtpVerifiedModel {
  const _$OtpVerifiedModelImpl(
      {this.loginDetails, this.IsSuccess, this.ErrorOnFailure});

  factory _$OtpVerifiedModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OtpVerifiedModelImplFromJson(json);

  @override
  final LoginDetails? loginDetails;
  @override
  final String? IsSuccess;
  @override
  final String? ErrorOnFailure;

  @override
  String toString() {
    return 'OtpVerifiedModel(loginDetails: $loginDetails, IsSuccess: $IsSuccess, ErrorOnFailure: $ErrorOnFailure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtpVerifiedModelImpl &&
            (identical(other.loginDetails, loginDetails) ||
                other.loginDetails == loginDetails) &&
            (identical(other.IsSuccess, IsSuccess) ||
                other.IsSuccess == IsSuccess) &&
            (identical(other.ErrorOnFailure, ErrorOnFailure) ||
                other.ErrorOnFailure == ErrorOnFailure));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, loginDetails, IsSuccess, ErrorOnFailure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OtpVerifiedModelImplCopyWith<_$OtpVerifiedModelImpl> get copyWith =>
      __$$OtpVerifiedModelImplCopyWithImpl<_$OtpVerifiedModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OtpVerifiedModelImplToJson(
      this,
    );
  }
}

abstract class _OtpVerifiedModel implements OtpVerifiedModel {
  const factory _OtpVerifiedModel(
      {final LoginDetails? loginDetails,
      final String? IsSuccess,
      final String? ErrorOnFailure}) = _$OtpVerifiedModelImpl;

  factory _OtpVerifiedModel.fromJson(Map<String, dynamic> json) =
      _$OtpVerifiedModelImpl.fromJson;

  @override
  LoginDetails? get loginDetails;
  @override
  String? get IsSuccess;
  @override
  String? get ErrorOnFailure;
  @override
  @JsonKey(ignore: true)
  _$$OtpVerifiedModelImplCopyWith<_$OtpVerifiedModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LoginDetails _$LoginDetailsFromJson(Map<String, dynamic> json) {
  return _LoginDetails.fromJson(json);
}

/// @nodoc
mixin _$LoginDetails {
  String? get LoginToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginDetailsCopyWith<LoginDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginDetailsCopyWith<$Res> {
  factory $LoginDetailsCopyWith(
          LoginDetails value, $Res Function(LoginDetails) then) =
      _$LoginDetailsCopyWithImpl<$Res, LoginDetails>;
  @useResult
  $Res call({String? LoginToken});
}

/// @nodoc
class _$LoginDetailsCopyWithImpl<$Res, $Val extends LoginDetails>
    implements $LoginDetailsCopyWith<$Res> {
  _$LoginDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? LoginToken = freezed,
  }) {
    return _then(_value.copyWith(
      LoginToken: freezed == LoginToken
          ? _value.LoginToken
          : LoginToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginDetailsImplCopyWith<$Res>
    implements $LoginDetailsCopyWith<$Res> {
  factory _$$LoginDetailsImplCopyWith(
          _$LoginDetailsImpl value, $Res Function(_$LoginDetailsImpl) then) =
      __$$LoginDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? LoginToken});
}

/// @nodoc
class __$$LoginDetailsImplCopyWithImpl<$Res>
    extends _$LoginDetailsCopyWithImpl<$Res, _$LoginDetailsImpl>
    implements _$$LoginDetailsImplCopyWith<$Res> {
  __$$LoginDetailsImplCopyWithImpl(
      _$LoginDetailsImpl _value, $Res Function(_$LoginDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? LoginToken = freezed,
  }) {
    return _then(_$LoginDetailsImpl(
      LoginToken: freezed == LoginToken
          ? _value.LoginToken
          : LoginToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginDetailsImpl implements _LoginDetails {
  const _$LoginDetailsImpl({this.LoginToken});

  factory _$LoginDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginDetailsImplFromJson(json);

  @override
  final String? LoginToken;

  @override
  String toString() {
    return 'LoginDetails(LoginToken: $LoginToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginDetailsImpl &&
            (identical(other.LoginToken, LoginToken) ||
                other.LoginToken == LoginToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, LoginToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginDetailsImplCopyWith<_$LoginDetailsImpl> get copyWith =>
      __$$LoginDetailsImplCopyWithImpl<_$LoginDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginDetailsImplToJson(
      this,
    );
  }
}

abstract class _LoginDetails implements LoginDetails {
  const factory _LoginDetails({final String? LoginToken}) = _$LoginDetailsImpl;

  factory _LoginDetails.fromJson(Map<String, dynamic> json) =
      _$LoginDetailsImpl.fromJson;

  @override
  String? get LoginToken;
  @override
  @JsonKey(ignore: true)
  _$$LoginDetailsImplCopyWith<_$LoginDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
