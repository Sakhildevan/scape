// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'static_page_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StaticPageModel _$StaticPageModelFromJson(Map<String, dynamic> json) {
  return _StaticPageModel.fromJson(json);
}

/// @nodoc
mixin _$StaticPageModel {
  @JsonKey(name: "StaticPage")
  String? get staticPage => throw _privateConstructorUsedError;
  @JsonKey(name: "IsSuccess")
  String? get isSuccess => throw _privateConstructorUsedError;
  @JsonKey(name: "ErrorOnFailure")
  String? get errorOnFailure => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StaticPageModelCopyWith<StaticPageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StaticPageModelCopyWith<$Res> {
  factory $StaticPageModelCopyWith(
          StaticPageModel value, $Res Function(StaticPageModel) then) =
      _$StaticPageModelCopyWithImpl<$Res, StaticPageModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "StaticPage") String? staticPage,
      @JsonKey(name: "IsSuccess") String? isSuccess,
      @JsonKey(name: "ErrorOnFailure") String? errorOnFailure});
}

/// @nodoc
class _$StaticPageModelCopyWithImpl<$Res, $Val extends StaticPageModel>
    implements $StaticPageModelCopyWith<$Res> {
  _$StaticPageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? staticPage = freezed,
    Object? isSuccess = freezed,
    Object? errorOnFailure = freezed,
  }) {
    return _then(_value.copyWith(
      staticPage: freezed == staticPage
          ? _value.staticPage
          : staticPage // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$StaticPageModelImplCopyWith<$Res>
    implements $StaticPageModelCopyWith<$Res> {
  factory _$$StaticPageModelImplCopyWith(_$StaticPageModelImpl value,
          $Res Function(_$StaticPageModelImpl) then) =
      __$$StaticPageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "StaticPage") String? staticPage,
      @JsonKey(name: "IsSuccess") String? isSuccess,
      @JsonKey(name: "ErrorOnFailure") String? errorOnFailure});
}

/// @nodoc
class __$$StaticPageModelImplCopyWithImpl<$Res>
    extends _$StaticPageModelCopyWithImpl<$Res, _$StaticPageModelImpl>
    implements _$$StaticPageModelImplCopyWith<$Res> {
  __$$StaticPageModelImplCopyWithImpl(
      _$StaticPageModelImpl _value, $Res Function(_$StaticPageModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? staticPage = freezed,
    Object? isSuccess = freezed,
    Object? errorOnFailure = freezed,
  }) {
    return _then(_$StaticPageModelImpl(
      staticPage: freezed == staticPage
          ? _value.staticPage
          : staticPage // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$StaticPageModelImpl implements _StaticPageModel {
  const _$StaticPageModelImpl(
      {@JsonKey(name: "StaticPage") this.staticPage,
      @JsonKey(name: "IsSuccess") this.isSuccess,
      @JsonKey(name: "ErrorOnFailure") this.errorOnFailure});

  factory _$StaticPageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StaticPageModelImplFromJson(json);

  @override
  @JsonKey(name: "StaticPage")
  final String? staticPage;
  @override
  @JsonKey(name: "IsSuccess")
  final String? isSuccess;
  @override
  @JsonKey(name: "ErrorOnFailure")
  final String? errorOnFailure;

  @override
  String toString() {
    return 'StaticPageModel(staticPage: $staticPage, isSuccess: $isSuccess, errorOnFailure: $errorOnFailure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StaticPageModelImpl &&
            (identical(other.staticPage, staticPage) ||
                other.staticPage == staticPage) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.errorOnFailure, errorOnFailure) ||
                other.errorOnFailure == errorOnFailure));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, staticPage, isSuccess, errorOnFailure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StaticPageModelImplCopyWith<_$StaticPageModelImpl> get copyWith =>
      __$$StaticPageModelImplCopyWithImpl<_$StaticPageModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StaticPageModelImplToJson(
      this,
    );
  }
}

abstract class _StaticPageModel implements StaticPageModel {
  const factory _StaticPageModel(
          {@JsonKey(name: "StaticPage") final String? staticPage,
          @JsonKey(name: "IsSuccess") final String? isSuccess,
          @JsonKey(name: "ErrorOnFailure") final String? errorOnFailure}) =
      _$StaticPageModelImpl;

  factory _StaticPageModel.fromJson(Map<String, dynamic> json) =
      _$StaticPageModelImpl.fromJson;

  @override
  @JsonKey(name: "StaticPage")
  String? get staticPage;
  @override
  @JsonKey(name: "IsSuccess")
  String? get isSuccess;
  @override
  @JsonKey(name: "ErrorOnFailure")
  String? get errorOnFailure;
  @override
  @JsonKey(ignore: true)
  _$$StaticPageModelImplCopyWith<_$StaticPageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
