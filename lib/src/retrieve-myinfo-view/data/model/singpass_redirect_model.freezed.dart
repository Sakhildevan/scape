// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'singpass_redirect_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SingPassRedirectModel _$SingPassRedirectModelFromJson(
    Map<String, dynamic> json) {
  return _SingPassRedirectModel.fromJson(json);
}

/// @nodoc
mixin _$SingPassRedirectModel {
  SingPassRedirectDetails? get singPassRedirectDetails =>
      throw _privateConstructorUsedError;
  String? get IsSuccess => throw _privateConstructorUsedError;
  String? get ErrorOnFailure => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SingPassRedirectModelCopyWith<SingPassRedirectModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SingPassRedirectModelCopyWith<$Res> {
  factory $SingPassRedirectModelCopyWith(SingPassRedirectModel value,
          $Res Function(SingPassRedirectModel) then) =
      _$SingPassRedirectModelCopyWithImpl<$Res, SingPassRedirectModel>;
  @useResult
  $Res call(
      {SingPassRedirectDetails? singPassRedirectDetails,
      String? IsSuccess,
      String? ErrorOnFailure});

  $SingPassRedirectDetailsCopyWith<$Res>? get singPassRedirectDetails;
}

/// @nodoc
class _$SingPassRedirectModelCopyWithImpl<$Res,
        $Val extends SingPassRedirectModel>
    implements $SingPassRedirectModelCopyWith<$Res> {
  _$SingPassRedirectModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? singPassRedirectDetails = freezed,
    Object? IsSuccess = freezed,
    Object? ErrorOnFailure = freezed,
  }) {
    return _then(_value.copyWith(
      singPassRedirectDetails: freezed == singPassRedirectDetails
          ? _value.singPassRedirectDetails
          : singPassRedirectDetails // ignore: cast_nullable_to_non_nullable
              as SingPassRedirectDetails?,
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
  $SingPassRedirectDetailsCopyWith<$Res>? get singPassRedirectDetails {
    if (_value.singPassRedirectDetails == null) {
      return null;
    }

    return $SingPassRedirectDetailsCopyWith<$Res>(
        _value.singPassRedirectDetails!, (value) {
      return _then(_value.copyWith(singPassRedirectDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SingPassRedirectModelImplCopyWith<$Res>
    implements $SingPassRedirectModelCopyWith<$Res> {
  factory _$$SingPassRedirectModelImplCopyWith(
          _$SingPassRedirectModelImpl value,
          $Res Function(_$SingPassRedirectModelImpl) then) =
      __$$SingPassRedirectModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SingPassRedirectDetails? singPassRedirectDetails,
      String? IsSuccess,
      String? ErrorOnFailure});

  @override
  $SingPassRedirectDetailsCopyWith<$Res>? get singPassRedirectDetails;
}

/// @nodoc
class __$$SingPassRedirectModelImplCopyWithImpl<$Res>
    extends _$SingPassRedirectModelCopyWithImpl<$Res,
        _$SingPassRedirectModelImpl>
    implements _$$SingPassRedirectModelImplCopyWith<$Res> {
  __$$SingPassRedirectModelImplCopyWithImpl(_$SingPassRedirectModelImpl _value,
      $Res Function(_$SingPassRedirectModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? singPassRedirectDetails = freezed,
    Object? IsSuccess = freezed,
    Object? ErrorOnFailure = freezed,
  }) {
    return _then(_$SingPassRedirectModelImpl(
      singPassRedirectDetails: freezed == singPassRedirectDetails
          ? _value.singPassRedirectDetails
          : singPassRedirectDetails // ignore: cast_nullable_to_non_nullable
              as SingPassRedirectDetails?,
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
class _$SingPassRedirectModelImpl implements _SingPassRedirectModel {
  const _$SingPassRedirectModelImpl(
      {this.singPassRedirectDetails, this.IsSuccess, this.ErrorOnFailure});

  factory _$SingPassRedirectModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SingPassRedirectModelImplFromJson(json);

  @override
  final SingPassRedirectDetails? singPassRedirectDetails;
  @override
  final String? IsSuccess;
  @override
  final String? ErrorOnFailure;

  @override
  String toString() {
    return 'SingPassRedirectModel(singPassRedirectDetails: $singPassRedirectDetails, IsSuccess: $IsSuccess, ErrorOnFailure: $ErrorOnFailure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SingPassRedirectModelImpl &&
            (identical(
                    other.singPassRedirectDetails, singPassRedirectDetails) ||
                other.singPassRedirectDetails == singPassRedirectDetails) &&
            (identical(other.IsSuccess, IsSuccess) ||
                other.IsSuccess == IsSuccess) &&
            (identical(other.ErrorOnFailure, ErrorOnFailure) ||
                other.ErrorOnFailure == ErrorOnFailure));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, singPassRedirectDetails, IsSuccess, ErrorOnFailure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SingPassRedirectModelImplCopyWith<_$SingPassRedirectModelImpl>
      get copyWith => __$$SingPassRedirectModelImplCopyWithImpl<
          _$SingPassRedirectModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SingPassRedirectModelImplToJson(
      this,
    );
  }
}

abstract class _SingPassRedirectModel implements SingPassRedirectModel {
  const factory _SingPassRedirectModel(
      {final SingPassRedirectDetails? singPassRedirectDetails,
      final String? IsSuccess,
      final String? ErrorOnFailure}) = _$SingPassRedirectModelImpl;

  factory _SingPassRedirectModel.fromJson(Map<String, dynamic> json) =
      _$SingPassRedirectModelImpl.fromJson;

  @override
  SingPassRedirectDetails? get singPassRedirectDetails;
  @override
  String? get IsSuccess;
  @override
  String? get ErrorOnFailure;
  @override
  @JsonKey(ignore: true)
  _$$SingPassRedirectModelImplCopyWith<_$SingPassRedirectModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SingPassRedirectDetails _$SingPassRedirectDetailsFromJson(
    Map<String, dynamic> json) {
  return _SingPassRedirectDetails.fromJson(json);
}

/// @nodoc
mixin _$SingPassRedirectDetails {
  String? get RedirectURL => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SingPassRedirectDetailsCopyWith<SingPassRedirectDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SingPassRedirectDetailsCopyWith<$Res> {
  factory $SingPassRedirectDetailsCopyWith(SingPassRedirectDetails value,
          $Res Function(SingPassRedirectDetails) then) =
      _$SingPassRedirectDetailsCopyWithImpl<$Res, SingPassRedirectDetails>;
  @useResult
  $Res call({String? RedirectURL});
}

/// @nodoc
class _$SingPassRedirectDetailsCopyWithImpl<$Res,
        $Val extends SingPassRedirectDetails>
    implements $SingPassRedirectDetailsCopyWith<$Res> {
  _$SingPassRedirectDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? RedirectURL = freezed,
  }) {
    return _then(_value.copyWith(
      RedirectURL: freezed == RedirectURL
          ? _value.RedirectURL
          : RedirectURL // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SingPassRedirectDetailsImplCopyWith<$Res>
    implements $SingPassRedirectDetailsCopyWith<$Res> {
  factory _$$SingPassRedirectDetailsImplCopyWith(
          _$SingPassRedirectDetailsImpl value,
          $Res Function(_$SingPassRedirectDetailsImpl) then) =
      __$$SingPassRedirectDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? RedirectURL});
}

/// @nodoc
class __$$SingPassRedirectDetailsImplCopyWithImpl<$Res>
    extends _$SingPassRedirectDetailsCopyWithImpl<$Res,
        _$SingPassRedirectDetailsImpl>
    implements _$$SingPassRedirectDetailsImplCopyWith<$Res> {
  __$$SingPassRedirectDetailsImplCopyWithImpl(
      _$SingPassRedirectDetailsImpl _value,
      $Res Function(_$SingPassRedirectDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? RedirectURL = freezed,
  }) {
    return _then(_$SingPassRedirectDetailsImpl(
      RedirectURL: freezed == RedirectURL
          ? _value.RedirectURL
          : RedirectURL // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SingPassRedirectDetailsImpl implements _SingPassRedirectDetails {
  const _$SingPassRedirectDetailsImpl({this.RedirectURL});

  factory _$SingPassRedirectDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SingPassRedirectDetailsImplFromJson(json);

  @override
  final String? RedirectURL;

  @override
  String toString() {
    return 'SingPassRedirectDetails(RedirectURL: $RedirectURL)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SingPassRedirectDetailsImpl &&
            (identical(other.RedirectURL, RedirectURL) ||
                other.RedirectURL == RedirectURL));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, RedirectURL);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SingPassRedirectDetailsImplCopyWith<_$SingPassRedirectDetailsImpl>
      get copyWith => __$$SingPassRedirectDetailsImplCopyWithImpl<
          _$SingPassRedirectDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SingPassRedirectDetailsImplToJson(
      this,
    );
  }
}

abstract class _SingPassRedirectDetails implements SingPassRedirectDetails {
  const factory _SingPassRedirectDetails({final String? RedirectURL}) =
      _$SingPassRedirectDetailsImpl;

  factory _SingPassRedirectDetails.fromJson(Map<String, dynamic> json) =
      _$SingPassRedirectDetailsImpl.fromJson;

  @override
  String? get RedirectURL;
  @override
  @JsonKey(ignore: true)
  _$$SingPassRedirectDetailsImplCopyWith<_$SingPassRedirectDetailsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
