// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'common_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CommonModel _$CommonModelFromJson(Map<String, dynamic> json) {
  return _CommonModel.fromJson(json);
}

/// @nodoc
mixin _$CommonModel {
  String? get IsSuccess => throw _privateConstructorUsedError;
  String? get ErrorOnFailure => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommonModelCopyWith<CommonModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommonModelCopyWith<$Res> {
  factory $CommonModelCopyWith(
          CommonModel value, $Res Function(CommonModel) then) =
      _$CommonModelCopyWithImpl<$Res, CommonModel>;
  @useResult
  $Res call({String? IsSuccess, String? ErrorOnFailure});
}

/// @nodoc
class _$CommonModelCopyWithImpl<$Res, $Val extends CommonModel>
    implements $CommonModelCopyWith<$Res> {
  _$CommonModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? IsSuccess = freezed,
    Object? ErrorOnFailure = freezed,
  }) {
    return _then(_value.copyWith(
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
abstract class _$$CommonModelImplCopyWith<$Res>
    implements $CommonModelCopyWith<$Res> {
  factory _$$CommonModelImplCopyWith(
          _$CommonModelImpl value, $Res Function(_$CommonModelImpl) then) =
      __$$CommonModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? IsSuccess, String? ErrorOnFailure});
}

/// @nodoc
class __$$CommonModelImplCopyWithImpl<$Res>
    extends _$CommonModelCopyWithImpl<$Res, _$CommonModelImpl>
    implements _$$CommonModelImplCopyWith<$Res> {
  __$$CommonModelImplCopyWithImpl(
      _$CommonModelImpl _value, $Res Function(_$CommonModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? IsSuccess = freezed,
    Object? ErrorOnFailure = freezed,
  }) {
    return _then(_$CommonModelImpl(
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
class _$CommonModelImpl implements _CommonModel {
  const _$CommonModelImpl({this.IsSuccess, this.ErrorOnFailure});

  factory _$CommonModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommonModelImplFromJson(json);

  @override
  final String? IsSuccess;
  @override
  final String? ErrorOnFailure;

  @override
  String toString() {
    return 'CommonModel(IsSuccess: $IsSuccess, ErrorOnFailure: $ErrorOnFailure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommonModelImpl &&
            (identical(other.IsSuccess, IsSuccess) ||
                other.IsSuccess == IsSuccess) &&
            (identical(other.ErrorOnFailure, ErrorOnFailure) ||
                other.ErrorOnFailure == ErrorOnFailure));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, IsSuccess, ErrorOnFailure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommonModelImplCopyWith<_$CommonModelImpl> get copyWith =>
      __$$CommonModelImplCopyWithImpl<_$CommonModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommonModelImplToJson(
      this,
    );
  }
}

abstract class _CommonModel implements CommonModel {
  const factory _CommonModel(
      {final String? IsSuccess,
      final String? ErrorOnFailure}) = _$CommonModelImpl;

  factory _CommonModel.fromJson(Map<String, dynamic> json) =
      _$CommonModelImpl.fromJson;

  @override
  String? get IsSuccess;
  @override
  String? get ErrorOnFailure;
  @override
  @JsonKey(ignore: true)
  _$$CommonModelImplCopyWith<_$CommonModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
