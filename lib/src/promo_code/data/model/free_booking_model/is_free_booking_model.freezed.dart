// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'is_free_booking_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

IsBookingFreeModel _$IsBookingFreeModelFromJson(Map<String, dynamic> json) {
  return _IsBookingFreeModel.fromJson(json);
}

/// @nodoc
mixin _$IsBookingFreeModel {
  String? get IsFree => throw _privateConstructorUsedError;
  String? get IsSuccess => throw _privateConstructorUsedError;
  String? get ErrorOnFailure => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IsBookingFreeModelCopyWith<IsBookingFreeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IsBookingFreeModelCopyWith<$Res> {
  factory $IsBookingFreeModelCopyWith(
          IsBookingFreeModel value, $Res Function(IsBookingFreeModel) then) =
      _$IsBookingFreeModelCopyWithImpl<$Res, IsBookingFreeModel>;
  @useResult
  $Res call({String? IsFree, String? IsSuccess, String? ErrorOnFailure});
}

/// @nodoc
class _$IsBookingFreeModelCopyWithImpl<$Res, $Val extends IsBookingFreeModel>
    implements $IsBookingFreeModelCopyWith<$Res> {
  _$IsBookingFreeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? IsFree = freezed,
    Object? IsSuccess = freezed,
    Object? ErrorOnFailure = freezed,
  }) {
    return _then(_value.copyWith(
      IsFree: freezed == IsFree
          ? _value.IsFree
          : IsFree // ignore: cast_nullable_to_non_nullable
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
abstract class _$$IsBookingFreeModelImplCopyWith<$Res>
    implements $IsBookingFreeModelCopyWith<$Res> {
  factory _$$IsBookingFreeModelImplCopyWith(_$IsBookingFreeModelImpl value,
          $Res Function(_$IsBookingFreeModelImpl) then) =
      __$$IsBookingFreeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? IsFree, String? IsSuccess, String? ErrorOnFailure});
}

/// @nodoc
class __$$IsBookingFreeModelImplCopyWithImpl<$Res>
    extends _$IsBookingFreeModelCopyWithImpl<$Res, _$IsBookingFreeModelImpl>
    implements _$$IsBookingFreeModelImplCopyWith<$Res> {
  __$$IsBookingFreeModelImplCopyWithImpl(_$IsBookingFreeModelImpl _value,
      $Res Function(_$IsBookingFreeModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? IsFree = freezed,
    Object? IsSuccess = freezed,
    Object? ErrorOnFailure = freezed,
  }) {
    return _then(_$IsBookingFreeModelImpl(
      IsFree: freezed == IsFree
          ? _value.IsFree
          : IsFree // ignore: cast_nullable_to_non_nullable
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
class _$IsBookingFreeModelImpl implements _IsBookingFreeModel {
  const _$IsBookingFreeModelImpl(
      {this.IsFree, this.IsSuccess, this.ErrorOnFailure});

  factory _$IsBookingFreeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$IsBookingFreeModelImplFromJson(json);

  @override
  final String? IsFree;
  @override
  final String? IsSuccess;
  @override
  final String? ErrorOnFailure;

  @override
  String toString() {
    return 'IsBookingFreeModel(IsFree: $IsFree, IsSuccess: $IsSuccess, ErrorOnFailure: $ErrorOnFailure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IsBookingFreeModelImpl &&
            (identical(other.IsFree, IsFree) || other.IsFree == IsFree) &&
            (identical(other.IsSuccess, IsSuccess) ||
                other.IsSuccess == IsSuccess) &&
            (identical(other.ErrorOnFailure, ErrorOnFailure) ||
                other.ErrorOnFailure == ErrorOnFailure));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, IsFree, IsSuccess, ErrorOnFailure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IsBookingFreeModelImplCopyWith<_$IsBookingFreeModelImpl> get copyWith =>
      __$$IsBookingFreeModelImplCopyWithImpl<_$IsBookingFreeModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IsBookingFreeModelImplToJson(
      this,
    );
  }
}

abstract class _IsBookingFreeModel implements IsBookingFreeModel {
  const factory _IsBookingFreeModel(
      {final String? IsFree,
      final String? IsSuccess,
      final String? ErrorOnFailure}) = _$IsBookingFreeModelImpl;

  factory _IsBookingFreeModel.fromJson(Map<String, dynamic> json) =
      _$IsBookingFreeModelImpl.fromJson;

  @override
  String? get IsFree;
  @override
  String? get IsSuccess;
  @override
  String? get ErrorOnFailure;
  @override
  @JsonKey(ignore: true)
  _$$IsBookingFreeModelImplCopyWith<_$IsBookingFreeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
