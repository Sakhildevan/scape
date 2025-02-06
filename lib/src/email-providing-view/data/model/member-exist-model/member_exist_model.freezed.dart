// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member_exist_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MemberExistModel _$MemberExistModelFromJson(Map<String, dynamic> json) {
  return _MemberExistModel.fromJson(json);
}

/// @nodoc
mixin _$MemberExistModel {
  String? get IsSuccess => throw _privateConstructorUsedError;
  String? get IsMemberExists => throw _privateConstructorUsedError;
  String? get ErrorOnFailure => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MemberExistModelCopyWith<MemberExistModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberExistModelCopyWith<$Res> {
  factory $MemberExistModelCopyWith(
          MemberExistModel value, $Res Function(MemberExistModel) then) =
      _$MemberExistModelCopyWithImpl<$Res, MemberExistModel>;
  @useResult
  $Res call(
      {String? IsSuccess, String? IsMemberExists, String? ErrorOnFailure});
}

/// @nodoc
class _$MemberExistModelCopyWithImpl<$Res, $Val extends MemberExistModel>
    implements $MemberExistModelCopyWith<$Res> {
  _$MemberExistModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? IsSuccess = freezed,
    Object? IsMemberExists = freezed,
    Object? ErrorOnFailure = freezed,
  }) {
    return _then(_value.copyWith(
      IsSuccess: freezed == IsSuccess
          ? _value.IsSuccess
          : IsSuccess // ignore: cast_nullable_to_non_nullable
              as String?,
      IsMemberExists: freezed == IsMemberExists
          ? _value.IsMemberExists
          : IsMemberExists // ignore: cast_nullable_to_non_nullable
              as String?,
      ErrorOnFailure: freezed == ErrorOnFailure
          ? _value.ErrorOnFailure
          : ErrorOnFailure // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MemberExistModelImplCopyWith<$Res>
    implements $MemberExistModelCopyWith<$Res> {
  factory _$$MemberExistModelImplCopyWith(_$MemberExistModelImpl value,
          $Res Function(_$MemberExistModelImpl) then) =
      __$$MemberExistModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? IsSuccess, String? IsMemberExists, String? ErrorOnFailure});
}

/// @nodoc
class __$$MemberExistModelImplCopyWithImpl<$Res>
    extends _$MemberExistModelCopyWithImpl<$Res, _$MemberExistModelImpl>
    implements _$$MemberExistModelImplCopyWith<$Res> {
  __$$MemberExistModelImplCopyWithImpl(_$MemberExistModelImpl _value,
      $Res Function(_$MemberExistModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? IsSuccess = freezed,
    Object? IsMemberExists = freezed,
    Object? ErrorOnFailure = freezed,
  }) {
    return _then(_$MemberExistModelImpl(
      IsSuccess: freezed == IsSuccess
          ? _value.IsSuccess
          : IsSuccess // ignore: cast_nullable_to_non_nullable
              as String?,
      IsMemberExists: freezed == IsMemberExists
          ? _value.IsMemberExists
          : IsMemberExists // ignore: cast_nullable_to_non_nullable
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
class _$MemberExistModelImpl implements _MemberExistModel {
  const _$MemberExistModelImpl(
      {this.IsSuccess, this.IsMemberExists, this.ErrorOnFailure});

  factory _$MemberExistModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MemberExistModelImplFromJson(json);

  @override
  final String? IsSuccess;
  @override
  final String? IsMemberExists;
  @override
  final String? ErrorOnFailure;

  @override
  String toString() {
    return 'MemberExistModel(IsSuccess: $IsSuccess, IsMemberExists: $IsMemberExists, ErrorOnFailure: $ErrorOnFailure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemberExistModelImpl &&
            (identical(other.IsSuccess, IsSuccess) ||
                other.IsSuccess == IsSuccess) &&
            (identical(other.IsMemberExists, IsMemberExists) ||
                other.IsMemberExists == IsMemberExists) &&
            (identical(other.ErrorOnFailure, ErrorOnFailure) ||
                other.ErrorOnFailure == ErrorOnFailure));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, IsSuccess, IsMemberExists, ErrorOnFailure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MemberExistModelImplCopyWith<_$MemberExistModelImpl> get copyWith =>
      __$$MemberExistModelImplCopyWithImpl<_$MemberExistModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MemberExistModelImplToJson(
      this,
    );
  }
}

abstract class _MemberExistModel implements MemberExistModel {
  const factory _MemberExistModel(
      {final String? IsSuccess,
      final String? IsMemberExists,
      final String? ErrorOnFailure}) = _$MemberExistModelImpl;

  factory _MemberExistModel.fromJson(Map<String, dynamic> json) =
      _$MemberExistModelImpl.fromJson;

  @override
  String? get IsSuccess;
  @override
  String? get IsMemberExists;
  @override
  String? get ErrorOnFailure;
  @override
  @JsonKey(ignore: true)
  _$$MemberExistModelImplCopyWith<_$MemberExistModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
