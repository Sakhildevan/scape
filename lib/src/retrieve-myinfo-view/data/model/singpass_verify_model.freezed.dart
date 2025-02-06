// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'singpass_verify_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SingPassVerifyModel _$SingPassVerifyModelFromJson(Map<String, dynamic> json) {
  return _SingPassVerifyModel.fromJson(json);
}

/// @nodoc
mixin _$SingPassVerifyModel {
  SingPassValidateRedirectDetails? get singPassValidateRedirectDetails =>
      throw _privateConstructorUsedError;
  String? get IsSuccess => throw _privateConstructorUsedError;
  String? get ErrorOnFailure => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SingPassVerifyModelCopyWith<SingPassVerifyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SingPassVerifyModelCopyWith<$Res> {
  factory $SingPassVerifyModelCopyWith(
          SingPassVerifyModel value, $Res Function(SingPassVerifyModel) then) =
      _$SingPassVerifyModelCopyWithImpl<$Res, SingPassVerifyModel>;
  @useResult
  $Res call(
      {SingPassValidateRedirectDetails? singPassValidateRedirectDetails,
      String? IsSuccess,
      String? ErrorOnFailure});

  $SingPassValidateRedirectDetailsCopyWith<$Res>?
      get singPassValidateRedirectDetails;
}

/// @nodoc
class _$SingPassVerifyModelCopyWithImpl<$Res, $Val extends SingPassVerifyModel>
    implements $SingPassVerifyModelCopyWith<$Res> {
  _$SingPassVerifyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? singPassValidateRedirectDetails = freezed,
    Object? IsSuccess = freezed,
    Object? ErrorOnFailure = freezed,
  }) {
    return _then(_value.copyWith(
      singPassValidateRedirectDetails: freezed ==
              singPassValidateRedirectDetails
          ? _value.singPassValidateRedirectDetails
          : singPassValidateRedirectDetails // ignore: cast_nullable_to_non_nullable
              as SingPassValidateRedirectDetails?,
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
  $SingPassValidateRedirectDetailsCopyWith<$Res>?
      get singPassValidateRedirectDetails {
    if (_value.singPassValidateRedirectDetails == null) {
      return null;
    }

    return $SingPassValidateRedirectDetailsCopyWith<$Res>(
        _value.singPassValidateRedirectDetails!, (value) {
      return _then(
          _value.copyWith(singPassValidateRedirectDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SingPassVerifyModelImplCopyWith<$Res>
    implements $SingPassVerifyModelCopyWith<$Res> {
  factory _$$SingPassVerifyModelImplCopyWith(_$SingPassVerifyModelImpl value,
          $Res Function(_$SingPassVerifyModelImpl) then) =
      __$$SingPassVerifyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SingPassValidateRedirectDetails? singPassValidateRedirectDetails,
      String? IsSuccess,
      String? ErrorOnFailure});

  @override
  $SingPassValidateRedirectDetailsCopyWith<$Res>?
      get singPassValidateRedirectDetails;
}

/// @nodoc
class __$$SingPassVerifyModelImplCopyWithImpl<$Res>
    extends _$SingPassVerifyModelCopyWithImpl<$Res, _$SingPassVerifyModelImpl>
    implements _$$SingPassVerifyModelImplCopyWith<$Res> {
  __$$SingPassVerifyModelImplCopyWithImpl(_$SingPassVerifyModelImpl _value,
      $Res Function(_$SingPassVerifyModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? singPassValidateRedirectDetails = freezed,
    Object? IsSuccess = freezed,
    Object? ErrorOnFailure = freezed,
  }) {
    return _then(_$SingPassVerifyModelImpl(
      singPassValidateRedirectDetails: freezed ==
              singPassValidateRedirectDetails
          ? _value.singPassValidateRedirectDetails
          : singPassValidateRedirectDetails // ignore: cast_nullable_to_non_nullable
              as SingPassValidateRedirectDetails?,
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
class _$SingPassVerifyModelImpl implements _SingPassVerifyModel {
  const _$SingPassVerifyModelImpl(
      {this.singPassValidateRedirectDetails,
      this.IsSuccess,
      this.ErrorOnFailure});

  factory _$SingPassVerifyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SingPassVerifyModelImplFromJson(json);

  @override
  final SingPassValidateRedirectDetails? singPassValidateRedirectDetails;
  @override
  final String? IsSuccess;
  @override
  final String? ErrorOnFailure;

  @override
  String toString() {
    return 'SingPassVerifyModel(singPassValidateRedirectDetails: $singPassValidateRedirectDetails, IsSuccess: $IsSuccess, ErrorOnFailure: $ErrorOnFailure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SingPassVerifyModelImpl &&
            (identical(other.singPassValidateRedirectDetails,
                    singPassValidateRedirectDetails) ||
                other.singPassValidateRedirectDetails ==
                    singPassValidateRedirectDetails) &&
            (identical(other.IsSuccess, IsSuccess) ||
                other.IsSuccess == IsSuccess) &&
            (identical(other.ErrorOnFailure, ErrorOnFailure) ||
                other.ErrorOnFailure == ErrorOnFailure));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, singPassValidateRedirectDetails, IsSuccess, ErrorOnFailure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SingPassVerifyModelImplCopyWith<_$SingPassVerifyModelImpl> get copyWith =>
      __$$SingPassVerifyModelImplCopyWithImpl<_$SingPassVerifyModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SingPassVerifyModelImplToJson(
      this,
    );
  }
}

abstract class _SingPassVerifyModel implements SingPassVerifyModel {
  const factory _SingPassVerifyModel(
      {final SingPassValidateRedirectDetails? singPassValidateRedirectDetails,
      final String? IsSuccess,
      final String? ErrorOnFailure}) = _$SingPassVerifyModelImpl;

  factory _SingPassVerifyModel.fromJson(Map<String, dynamic> json) =
      _$SingPassVerifyModelImpl.fromJson;

  @override
  SingPassValidateRedirectDetails? get singPassValidateRedirectDetails;
  @override
  String? get IsSuccess;
  @override
  String? get ErrorOnFailure;
  @override
  @JsonKey(ignore: true)
  _$$SingPassVerifyModelImplCopyWith<_$SingPassVerifyModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SingPassValidateRedirectDetails _$SingPassValidateRedirectDetailsFromJson(
    Map<String, dynamic> json) {
  return _SingPassValidateRedirectDetails.fromJson(json);
}

/// @nodoc
mixin _$SingPassValidateRedirectDetails {
  String? get LoginToken => throw _privateConstructorUsedError;
  String? get EventCode => throw _privateConstructorUsedError;
  String? get IsMyInfoVerified => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SingPassValidateRedirectDetailsCopyWith<SingPassValidateRedirectDetails>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SingPassValidateRedirectDetailsCopyWith<$Res> {
  factory $SingPassValidateRedirectDetailsCopyWith(
          SingPassValidateRedirectDetails value,
          $Res Function(SingPassValidateRedirectDetails) then) =
      _$SingPassValidateRedirectDetailsCopyWithImpl<$Res,
          SingPassValidateRedirectDetails>;
  @useResult
  $Res call({String? LoginToken, String? EventCode, String? IsMyInfoVerified});
}

/// @nodoc
class _$SingPassValidateRedirectDetailsCopyWithImpl<$Res,
        $Val extends SingPassValidateRedirectDetails>
    implements $SingPassValidateRedirectDetailsCopyWith<$Res> {
  _$SingPassValidateRedirectDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? LoginToken = freezed,
    Object? EventCode = freezed,
    Object? IsMyInfoVerified = freezed,
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
      IsMyInfoVerified: freezed == IsMyInfoVerified
          ? _value.IsMyInfoVerified
          : IsMyInfoVerified // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SingPassValidateRedirectDetailsImplCopyWith<$Res>
    implements $SingPassValidateRedirectDetailsCopyWith<$Res> {
  factory _$$SingPassValidateRedirectDetailsImplCopyWith(
          _$SingPassValidateRedirectDetailsImpl value,
          $Res Function(_$SingPassValidateRedirectDetailsImpl) then) =
      __$$SingPassValidateRedirectDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? LoginToken, String? EventCode, String? IsMyInfoVerified});
}

/// @nodoc
class __$$SingPassValidateRedirectDetailsImplCopyWithImpl<$Res>
    extends _$SingPassValidateRedirectDetailsCopyWithImpl<$Res,
        _$SingPassValidateRedirectDetailsImpl>
    implements _$$SingPassValidateRedirectDetailsImplCopyWith<$Res> {
  __$$SingPassValidateRedirectDetailsImplCopyWithImpl(
      _$SingPassValidateRedirectDetailsImpl _value,
      $Res Function(_$SingPassValidateRedirectDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? LoginToken = freezed,
    Object? EventCode = freezed,
    Object? IsMyInfoVerified = freezed,
  }) {
    return _then(_$SingPassValidateRedirectDetailsImpl(
      LoginToken: freezed == LoginToken
          ? _value.LoginToken
          : LoginToken // ignore: cast_nullable_to_non_nullable
              as String?,
      EventCode: freezed == EventCode
          ? _value.EventCode
          : EventCode // ignore: cast_nullable_to_non_nullable
              as String?,
      IsMyInfoVerified: freezed == IsMyInfoVerified
          ? _value.IsMyInfoVerified
          : IsMyInfoVerified // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SingPassValidateRedirectDetailsImpl
    implements _SingPassValidateRedirectDetails {
  const _$SingPassValidateRedirectDetailsImpl(
      {this.LoginToken, this.EventCode, this.IsMyInfoVerified});

  factory _$SingPassValidateRedirectDetailsImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$SingPassValidateRedirectDetailsImplFromJson(json);

  @override
  final String? LoginToken;
  @override
  final String? EventCode;
  @override
  final String? IsMyInfoVerified;

  @override
  String toString() {
    return 'SingPassValidateRedirectDetails(LoginToken: $LoginToken, EventCode: $EventCode, IsMyInfoVerified: $IsMyInfoVerified)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SingPassValidateRedirectDetailsImpl &&
            (identical(other.LoginToken, LoginToken) ||
                other.LoginToken == LoginToken) &&
            (identical(other.EventCode, EventCode) ||
                other.EventCode == EventCode) &&
            (identical(other.IsMyInfoVerified, IsMyInfoVerified) ||
                other.IsMyInfoVerified == IsMyInfoVerified));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, LoginToken, EventCode, IsMyInfoVerified);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SingPassValidateRedirectDetailsImplCopyWith<
          _$SingPassValidateRedirectDetailsImpl>
      get copyWith => __$$SingPassValidateRedirectDetailsImplCopyWithImpl<
          _$SingPassValidateRedirectDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SingPassValidateRedirectDetailsImplToJson(
      this,
    );
  }
}

abstract class _SingPassValidateRedirectDetails
    implements SingPassValidateRedirectDetails {
  const factory _SingPassValidateRedirectDetails(
      {final String? LoginToken,
      final String? EventCode,
      final String? IsMyInfoVerified}) = _$SingPassValidateRedirectDetailsImpl;

  factory _SingPassValidateRedirectDetails.fromJson(Map<String, dynamic> json) =
      _$SingPassValidateRedirectDetailsImpl.fromJson;

  @override
  String? get LoginToken;
  @override
  String? get EventCode;
  @override
  String? get IsMyInfoVerified;
  @override
  @JsonKey(ignore: true)
  _$$SingPassValidateRedirectDetailsImplCopyWith<
          _$SingPassValidateRedirectDetailsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
