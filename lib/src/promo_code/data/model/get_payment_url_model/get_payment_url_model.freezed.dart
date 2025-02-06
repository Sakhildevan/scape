// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_payment_url_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetPaymentUrlModel _$GetPaymentUrlModelFromJson(Map<String, dynamic> json) {
  return _GetPaymentUrlModel.fromJson(json);
}

/// @nodoc
mixin _$GetPaymentUrlModel {
  String? get PaymentRedirectURL => throw _privateConstructorUsedError;
  String? get IsSuccess => throw _privateConstructorUsedError;
  String? get ErrorOnFailure => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetPaymentUrlModelCopyWith<GetPaymentUrlModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetPaymentUrlModelCopyWith<$Res> {
  factory $GetPaymentUrlModelCopyWith(
          GetPaymentUrlModel value, $Res Function(GetPaymentUrlModel) then) =
      _$GetPaymentUrlModelCopyWithImpl<$Res, GetPaymentUrlModel>;
  @useResult
  $Res call(
      {String? PaymentRedirectURL, String? IsSuccess, String? ErrorOnFailure});
}

/// @nodoc
class _$GetPaymentUrlModelCopyWithImpl<$Res, $Val extends GetPaymentUrlModel>
    implements $GetPaymentUrlModelCopyWith<$Res> {
  _$GetPaymentUrlModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? PaymentRedirectURL = freezed,
    Object? IsSuccess = freezed,
    Object? ErrorOnFailure = freezed,
  }) {
    return _then(_value.copyWith(
      PaymentRedirectURL: freezed == PaymentRedirectURL
          ? _value.PaymentRedirectURL
          : PaymentRedirectURL // ignore: cast_nullable_to_non_nullable
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
abstract class _$$GetPaymentUrlModelImplCopyWith<$Res>
    implements $GetPaymentUrlModelCopyWith<$Res> {
  factory _$$GetPaymentUrlModelImplCopyWith(_$GetPaymentUrlModelImpl value,
          $Res Function(_$GetPaymentUrlModelImpl) then) =
      __$$GetPaymentUrlModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? PaymentRedirectURL, String? IsSuccess, String? ErrorOnFailure});
}

/// @nodoc
class __$$GetPaymentUrlModelImplCopyWithImpl<$Res>
    extends _$GetPaymentUrlModelCopyWithImpl<$Res, _$GetPaymentUrlModelImpl>
    implements _$$GetPaymentUrlModelImplCopyWith<$Res> {
  __$$GetPaymentUrlModelImplCopyWithImpl(_$GetPaymentUrlModelImpl _value,
      $Res Function(_$GetPaymentUrlModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? PaymentRedirectURL = freezed,
    Object? IsSuccess = freezed,
    Object? ErrorOnFailure = freezed,
  }) {
    return _then(_$GetPaymentUrlModelImpl(
      PaymentRedirectURL: freezed == PaymentRedirectURL
          ? _value.PaymentRedirectURL
          : PaymentRedirectURL // ignore: cast_nullable_to_non_nullable
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
class _$GetPaymentUrlModelImpl implements _GetPaymentUrlModel {
  const _$GetPaymentUrlModelImpl(
      {this.PaymentRedirectURL, this.IsSuccess, this.ErrorOnFailure});

  factory _$GetPaymentUrlModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetPaymentUrlModelImplFromJson(json);

  @override
  final String? PaymentRedirectURL;
  @override
  final String? IsSuccess;
  @override
  final String? ErrorOnFailure;

  @override
  String toString() {
    return 'GetPaymentUrlModel(PaymentRedirectURL: $PaymentRedirectURL, IsSuccess: $IsSuccess, ErrorOnFailure: $ErrorOnFailure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetPaymentUrlModelImpl &&
            (identical(other.PaymentRedirectURL, PaymentRedirectURL) ||
                other.PaymentRedirectURL == PaymentRedirectURL) &&
            (identical(other.IsSuccess, IsSuccess) ||
                other.IsSuccess == IsSuccess) &&
            (identical(other.ErrorOnFailure, ErrorOnFailure) ||
                other.ErrorOnFailure == ErrorOnFailure));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, PaymentRedirectURL, IsSuccess, ErrorOnFailure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetPaymentUrlModelImplCopyWith<_$GetPaymentUrlModelImpl> get copyWith =>
      __$$GetPaymentUrlModelImplCopyWithImpl<_$GetPaymentUrlModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetPaymentUrlModelImplToJson(
      this,
    );
  }
}

abstract class _GetPaymentUrlModel implements GetPaymentUrlModel {
  const factory _GetPaymentUrlModel(
      {final String? PaymentRedirectURL,
      final String? IsSuccess,
      final String? ErrorOnFailure}) = _$GetPaymentUrlModelImpl;

  factory _GetPaymentUrlModel.fromJson(Map<String, dynamic> json) =
      _$GetPaymentUrlModelImpl.fromJson;

  @override
  String? get PaymentRedirectURL;
  @override
  String? get IsSuccess;
  @override
  String? get ErrorOnFailure;
  @override
  @JsonKey(ignore: true)
  _$$GetPaymentUrlModelImplCopyWith<_$GetPaymentUrlModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
