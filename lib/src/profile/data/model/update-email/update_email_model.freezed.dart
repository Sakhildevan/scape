// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_email_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UpdateEmailModel _$UpdateEmailModelFromJson(Map<String, dynamic> json) {
  return _UpdateEmailModel.fromJson(json);
}

/// @nodoc
mixin _$UpdateEmailModel {
  String? get TempToken => throw _privateConstructorUsedError;
  String? get IsSuccess => throw _privateConstructorUsedError;
  String? get ErrorOnFailure => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateEmailModelCopyWith<UpdateEmailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateEmailModelCopyWith<$Res> {
  factory $UpdateEmailModelCopyWith(
          UpdateEmailModel value, $Res Function(UpdateEmailModel) then) =
      _$UpdateEmailModelCopyWithImpl<$Res, UpdateEmailModel>;
  @useResult
  $Res call({String? TempToken, String? IsSuccess, String? ErrorOnFailure});
}

/// @nodoc
class _$UpdateEmailModelCopyWithImpl<$Res, $Val extends UpdateEmailModel>
    implements $UpdateEmailModelCopyWith<$Res> {
  _$UpdateEmailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? TempToken = freezed,
    Object? IsSuccess = freezed,
    Object? ErrorOnFailure = freezed,
  }) {
    return _then(_value.copyWith(
      TempToken: freezed == TempToken
          ? _value.TempToken
          : TempToken // ignore: cast_nullable_to_non_nullable
              as String?,
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
}

/// @nodoc
abstract class _$$UpdateEmailModelImplCopyWith<$Res>
    implements $UpdateEmailModelCopyWith<$Res> {
  factory _$$UpdateEmailModelImplCopyWith(_$UpdateEmailModelImpl value,
          $Res Function(_$UpdateEmailModelImpl) then) =
      __$$UpdateEmailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? TempToken, String? IsSuccess, String? ErrorOnFailure});
}

/// @nodoc
class __$$UpdateEmailModelImplCopyWithImpl<$Res>
    extends _$UpdateEmailModelCopyWithImpl<$Res, _$UpdateEmailModelImpl>
    implements _$$UpdateEmailModelImplCopyWith<$Res> {
  __$$UpdateEmailModelImplCopyWithImpl(_$UpdateEmailModelImpl _value,
      $Res Function(_$UpdateEmailModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? TempToken = freezed,
    Object? IsSuccess = freezed,
    Object? ErrorOnFailure = freezed,
  }) {
    return _then(_$UpdateEmailModelImpl(
      TempToken: freezed == TempToken
          ? _value.TempToken
          : TempToken // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$UpdateEmailModelImpl implements _UpdateEmailModel {
  const _$UpdateEmailModelImpl(
      {this.TempToken, this.IsSuccess, this.ErrorOnFailure});

  factory _$UpdateEmailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateEmailModelImplFromJson(json);

  @override
  final String? TempToken;
  @override
  final String? IsSuccess;
  @override
  final String? ErrorOnFailure;

  @override
  String toString() {
    return 'UpdateEmailModel(TempToken: $TempToken, IsSuccess: $IsSuccess, ErrorOnFailure: $ErrorOnFailure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateEmailModelImpl &&
            (identical(other.TempToken, TempToken) ||
                other.TempToken == TempToken) &&
            (identical(other.IsSuccess, IsSuccess) ||
                other.IsSuccess == IsSuccess) &&
            (identical(other.ErrorOnFailure, ErrorOnFailure) ||
                other.ErrorOnFailure == ErrorOnFailure));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, TempToken, IsSuccess, ErrorOnFailure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateEmailModelImplCopyWith<_$UpdateEmailModelImpl> get copyWith =>
      __$$UpdateEmailModelImplCopyWithImpl<_$UpdateEmailModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateEmailModelImplToJson(
      this,
    );
  }
}

abstract class _UpdateEmailModel implements UpdateEmailModel {
  const factory _UpdateEmailModel(
      {final String? TempToken,
      final String? IsSuccess,
      final String? ErrorOnFailure}) = _$UpdateEmailModelImpl;

  factory _UpdateEmailModel.fromJson(Map<String, dynamic> json) =
      _$UpdateEmailModelImpl.fromJson;

  @override
  String? get TempToken;
  @override
  String? get IsSuccess;
  @override
  String? get ErrorOnFailure;
  @override
  @JsonKey(ignore: true)
  _$$UpdateEmailModelImplCopyWith<_$UpdateEmailModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
