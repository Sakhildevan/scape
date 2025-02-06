// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_name_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EditName _$EditNameFromJson(Map<String, dynamic> json) {
  return _EditName.fromJson(json);
}

/// @nodoc
mixin _$EditName {
  @JsonKey(name: "IsSuccess")
  String? get isSuccess => throw _privateConstructorUsedError;
  @JsonKey(name: "ErrorOnFailure")
  String? get errorOnFailure => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EditNameCopyWith<EditName> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditNameCopyWith<$Res> {
  factory $EditNameCopyWith(EditName value, $Res Function(EditName) then) =
      _$EditNameCopyWithImpl<$Res, EditName>;
  @useResult
  $Res call(
      {@JsonKey(name: "IsSuccess") String? isSuccess,
      @JsonKey(name: "ErrorOnFailure") String? errorOnFailure});
}

/// @nodoc
class _$EditNameCopyWithImpl<$Res, $Val extends EditName>
    implements $EditNameCopyWith<$Res> {
  _$EditNameCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSuccess = freezed,
    Object? errorOnFailure = freezed,
  }) {
    return _then(_value.copyWith(
      isSuccess: freezed == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as String?,
      errorOnFailure: freezed == errorOnFailure
          ? _value.errorOnFailure
          : errorOnFailure // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EditNameImplCopyWith<$Res>
    implements $EditNameCopyWith<$Res> {
  factory _$$EditNameImplCopyWith(
          _$EditNameImpl value, $Res Function(_$EditNameImpl) then) =
      __$$EditNameImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "IsSuccess") String? isSuccess,
      @JsonKey(name: "ErrorOnFailure") String? errorOnFailure});
}

/// @nodoc
class __$$EditNameImplCopyWithImpl<$Res>
    extends _$EditNameCopyWithImpl<$Res, _$EditNameImpl>
    implements _$$EditNameImplCopyWith<$Res> {
  __$$EditNameImplCopyWithImpl(
      _$EditNameImpl _value, $Res Function(_$EditNameImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSuccess = freezed,
    Object? errorOnFailure = freezed,
  }) {
    return _then(_$EditNameImpl(
      isSuccess: freezed == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as String?,
      errorOnFailure: freezed == errorOnFailure
          ? _value.errorOnFailure
          : errorOnFailure // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EditNameImpl implements _EditName {
  const _$EditNameImpl(
      {@JsonKey(name: "IsSuccess") this.isSuccess,
      @JsonKey(name: "ErrorOnFailure") this.errorOnFailure});

  factory _$EditNameImpl.fromJson(Map<String, dynamic> json) =>
      _$$EditNameImplFromJson(json);

  @override
  @JsonKey(name: "IsSuccess")
  final String? isSuccess;
  @override
  @JsonKey(name: "ErrorOnFailure")
  final String? errorOnFailure;

  @override
  String toString() {
    return 'EditName(isSuccess: $isSuccess, errorOnFailure: $errorOnFailure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditNameImpl &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.errorOnFailure, errorOnFailure) ||
                other.errorOnFailure == errorOnFailure));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isSuccess, errorOnFailure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditNameImplCopyWith<_$EditNameImpl> get copyWith =>
      __$$EditNameImplCopyWithImpl<_$EditNameImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EditNameImplToJson(
      this,
    );
  }
}

abstract class _EditName implements EditName {
  const factory _EditName(
          {@JsonKey(name: "IsSuccess") final String? isSuccess,
          @JsonKey(name: "ErrorOnFailure") final String? errorOnFailure}) =
      _$EditNameImpl;

  factory _EditName.fromJson(Map<String, dynamic> json) =
      _$EditNameImpl.fromJson;

  @override
  @JsonKey(name: "IsSuccess")
  String? get isSuccess;
  @override
  @JsonKey(name: "ErrorOnFailure")
  String? get errorOnFailure;
  @override
  @JsonKey(ignore: true)
  _$$EditNameImplCopyWith<_$EditNameImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
