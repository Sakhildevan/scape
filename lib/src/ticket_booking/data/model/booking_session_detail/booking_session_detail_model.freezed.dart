// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_session_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BookingSessionDetailModel _$BookingSessionDetailModelFromJson(
    Map<String, dynamic> json) {
  return _BookingSessionDetailModel.fromJson(json);
}

/// @nodoc
mixin _$BookingSessionDetailModel {
  BookingSessionDeatils? get bookingSessionDeatils =>
      throw _privateConstructorUsedError;
  String? get IsSuccess => throw _privateConstructorUsedError;
  String? get ErrorOnFailure => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookingSessionDetailModelCopyWith<BookingSessionDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingSessionDetailModelCopyWith<$Res> {
  factory $BookingSessionDetailModelCopyWith(BookingSessionDetailModel value,
          $Res Function(BookingSessionDetailModel) then) =
      _$BookingSessionDetailModelCopyWithImpl<$Res, BookingSessionDetailModel>;
  @useResult
  $Res call(
      {BookingSessionDeatils? bookingSessionDeatils,
      String? IsSuccess,
      String? ErrorOnFailure});

  $BookingSessionDeatilsCopyWith<$Res>? get bookingSessionDeatils;
}

/// @nodoc
class _$BookingSessionDetailModelCopyWithImpl<$Res,
        $Val extends BookingSessionDetailModel>
    implements $BookingSessionDetailModelCopyWith<$Res> {
  _$BookingSessionDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingSessionDeatils = freezed,
    Object? IsSuccess = freezed,
    Object? ErrorOnFailure = freezed,
  }) {
    return _then(_value.copyWith(
      bookingSessionDeatils: freezed == bookingSessionDeatils
          ? _value.bookingSessionDeatils
          : bookingSessionDeatils // ignore: cast_nullable_to_non_nullable
              as BookingSessionDeatils?,
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
  $BookingSessionDeatilsCopyWith<$Res>? get bookingSessionDeatils {
    if (_value.bookingSessionDeatils == null) {
      return null;
    }

    return $BookingSessionDeatilsCopyWith<$Res>(_value.bookingSessionDeatils!,
        (value) {
      return _then(_value.copyWith(bookingSessionDeatils: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BookingSessionDetailModelImplCopyWith<$Res>
    implements $BookingSessionDetailModelCopyWith<$Res> {
  factory _$$BookingSessionDetailModelImplCopyWith(
          _$BookingSessionDetailModelImpl value,
          $Res Function(_$BookingSessionDetailModelImpl) then) =
      __$$BookingSessionDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BookingSessionDeatils? bookingSessionDeatils,
      String? IsSuccess,
      String? ErrorOnFailure});

  @override
  $BookingSessionDeatilsCopyWith<$Res>? get bookingSessionDeatils;
}

/// @nodoc
class __$$BookingSessionDetailModelImplCopyWithImpl<$Res>
    extends _$BookingSessionDetailModelCopyWithImpl<$Res,
        _$BookingSessionDetailModelImpl>
    implements _$$BookingSessionDetailModelImplCopyWith<$Res> {
  __$$BookingSessionDetailModelImplCopyWithImpl(
      _$BookingSessionDetailModelImpl _value,
      $Res Function(_$BookingSessionDetailModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingSessionDeatils = freezed,
    Object? IsSuccess = freezed,
    Object? ErrorOnFailure = freezed,
  }) {
    return _then(_$BookingSessionDetailModelImpl(
      bookingSessionDeatils: freezed == bookingSessionDeatils
          ? _value.bookingSessionDeatils
          : bookingSessionDeatils // ignore: cast_nullable_to_non_nullable
              as BookingSessionDeatils?,
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
class _$BookingSessionDetailModelImpl implements _BookingSessionDetailModel {
  const _$BookingSessionDetailModelImpl(
      {this.bookingSessionDeatils, this.IsSuccess, this.ErrorOnFailure});

  factory _$BookingSessionDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookingSessionDetailModelImplFromJson(json);

  @override
  final BookingSessionDeatils? bookingSessionDeatils;
  @override
  final String? IsSuccess;
  @override
  final String? ErrorOnFailure;

  @override
  String toString() {
    return 'BookingSessionDetailModel(bookingSessionDeatils: $bookingSessionDeatils, IsSuccess: $IsSuccess, ErrorOnFailure: $ErrorOnFailure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingSessionDetailModelImpl &&
            (identical(other.bookingSessionDeatils, bookingSessionDeatils) ||
                other.bookingSessionDeatils == bookingSessionDeatils) &&
            (identical(other.IsSuccess, IsSuccess) ||
                other.IsSuccess == IsSuccess) &&
            (identical(other.ErrorOnFailure, ErrorOnFailure) ||
                other.ErrorOnFailure == ErrorOnFailure));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, bookingSessionDeatils, IsSuccess, ErrorOnFailure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingSessionDetailModelImplCopyWith<_$BookingSessionDetailModelImpl>
      get copyWith => __$$BookingSessionDetailModelImplCopyWithImpl<
          _$BookingSessionDetailModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookingSessionDetailModelImplToJson(
      this,
    );
  }
}

abstract class _BookingSessionDetailModel implements BookingSessionDetailModel {
  const factory _BookingSessionDetailModel(
      {final BookingSessionDeatils? bookingSessionDeatils,
      final String? IsSuccess,
      final String? ErrorOnFailure}) = _$BookingSessionDetailModelImpl;

  factory _BookingSessionDetailModel.fromJson(Map<String, dynamic> json) =
      _$BookingSessionDetailModelImpl.fromJson;

  @override
  BookingSessionDeatils? get bookingSessionDeatils;
  @override
  String? get IsSuccess;
  @override
  String? get ErrorOnFailure;
  @override
  @JsonKey(ignore: true)
  _$$BookingSessionDetailModelImplCopyWith<_$BookingSessionDetailModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

BookingSessionDeatils _$BookingSessionDeatilsFromJson(
    Map<String, dynamic> json) {
  return _BookingSessionDeatils.fromJson(json);
}

/// @nodoc
mixin _$BookingSessionDeatils {
  String? get BookingSession => throw _privateConstructorUsedError;
  String? get BookedMemberFirstName => throw _privateConstructorUsedError;
  String? get BookedMemberLastName => throw _privateConstructorUsedError;
  String? get BookedMemberEmail => throw _privateConstructorUsedError;
  num? get SubTotal => throw _privateConstructorUsedError;
  String? get Promocode => throw _privateConstructorUsedError;
  num? get PromocodeDiscount => throw _privateConstructorUsedError;
  num? get MembershipDiscount => throw _privateConstructorUsedError;
  num? get TotalCost => throw _privateConstructorUsedError;
  String? get IsBookingCompleted => throw _privateConstructorUsedError;
  String? get CompletedOn => throw _privateConstructorUsedError;
  List<BookedPackage>? get BookedPackages => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookingSessionDeatilsCopyWith<BookingSessionDeatils> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingSessionDeatilsCopyWith<$Res> {
  factory $BookingSessionDeatilsCopyWith(BookingSessionDeatils value,
          $Res Function(BookingSessionDeatils) then) =
      _$BookingSessionDeatilsCopyWithImpl<$Res, BookingSessionDeatils>;
  @useResult
  $Res call(
      {String? BookingSession,
      String? BookedMemberFirstName,
      String? BookedMemberLastName,
      String? BookedMemberEmail,
      num? SubTotal,
      String? Promocode,
      num? PromocodeDiscount,
      num? MembershipDiscount,
      num? TotalCost,
      String? IsBookingCompleted,
      String? CompletedOn,
      List<BookedPackage>? BookedPackages});
}

/// @nodoc
class _$BookingSessionDeatilsCopyWithImpl<$Res,
        $Val extends BookingSessionDeatils>
    implements $BookingSessionDeatilsCopyWith<$Res> {
  _$BookingSessionDeatilsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? BookingSession = freezed,
    Object? BookedMemberFirstName = freezed,
    Object? BookedMemberLastName = freezed,
    Object? BookedMemberEmail = freezed,
    Object? SubTotal = freezed,
    Object? Promocode = freezed,
    Object? PromocodeDiscount = freezed,
    Object? MembershipDiscount = freezed,
    Object? TotalCost = freezed,
    Object? IsBookingCompleted = freezed,
    Object? CompletedOn = freezed,
    Object? BookedPackages = freezed,
  }) {
    return _then(_value.copyWith(
      BookingSession: freezed == BookingSession
          ? _value.BookingSession
          : BookingSession // ignore: cast_nullable_to_non_nullable
              as String?,
      BookedMemberFirstName: freezed == BookedMemberFirstName
          ? _value.BookedMemberFirstName
          : BookedMemberFirstName // ignore: cast_nullable_to_non_nullable
              as String?,
      BookedMemberLastName: freezed == BookedMemberLastName
          ? _value.BookedMemberLastName
          : BookedMemberLastName // ignore: cast_nullable_to_non_nullable
              as String?,
      BookedMemberEmail: freezed == BookedMemberEmail
          ? _value.BookedMemberEmail
          : BookedMemberEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      SubTotal: freezed == SubTotal
          ? _value.SubTotal
          : SubTotal // ignore: cast_nullable_to_non_nullable
              as num?,
      Promocode: freezed == Promocode
          ? _value.Promocode
          : Promocode // ignore: cast_nullable_to_non_nullable
              as String?,
      PromocodeDiscount: freezed == PromocodeDiscount
          ? _value.PromocodeDiscount
          : PromocodeDiscount // ignore: cast_nullable_to_non_nullable
              as num?,
      MembershipDiscount: freezed == MembershipDiscount
          ? _value.MembershipDiscount
          : MembershipDiscount // ignore: cast_nullable_to_non_nullable
              as num?,
      TotalCost: freezed == TotalCost
          ? _value.TotalCost
          : TotalCost // ignore: cast_nullable_to_non_nullable
              as num?,
      IsBookingCompleted: freezed == IsBookingCompleted
          ? _value.IsBookingCompleted
          : IsBookingCompleted // ignore: cast_nullable_to_non_nullable
              as String?,
      CompletedOn: freezed == CompletedOn
          ? _value.CompletedOn
          : CompletedOn // ignore: cast_nullable_to_non_nullable
              as String?,
      BookedPackages: freezed == BookedPackages
          ? _value.BookedPackages
          : BookedPackages // ignore: cast_nullable_to_non_nullable
              as List<BookedPackage>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookingSessionDeatilsImplCopyWith<$Res>
    implements $BookingSessionDeatilsCopyWith<$Res> {
  factory _$$BookingSessionDeatilsImplCopyWith(
          _$BookingSessionDeatilsImpl value,
          $Res Function(_$BookingSessionDeatilsImpl) then) =
      __$$BookingSessionDeatilsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? BookingSession,
      String? BookedMemberFirstName,
      String? BookedMemberLastName,
      String? BookedMemberEmail,
      num? SubTotal,
      String? Promocode,
      num? PromocodeDiscount,
      num? MembershipDiscount,
      num? TotalCost,
      String? IsBookingCompleted,
      String? CompletedOn,
      List<BookedPackage>? BookedPackages});
}

/// @nodoc
class __$$BookingSessionDeatilsImplCopyWithImpl<$Res>
    extends _$BookingSessionDeatilsCopyWithImpl<$Res,
        _$BookingSessionDeatilsImpl>
    implements _$$BookingSessionDeatilsImplCopyWith<$Res> {
  __$$BookingSessionDeatilsImplCopyWithImpl(_$BookingSessionDeatilsImpl _value,
      $Res Function(_$BookingSessionDeatilsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? BookingSession = freezed,
    Object? BookedMemberFirstName = freezed,
    Object? BookedMemberLastName = freezed,
    Object? BookedMemberEmail = freezed,
    Object? SubTotal = freezed,
    Object? Promocode = freezed,
    Object? PromocodeDiscount = freezed,
    Object? MembershipDiscount = freezed,
    Object? TotalCost = freezed,
    Object? IsBookingCompleted = freezed,
    Object? CompletedOn = freezed,
    Object? BookedPackages = freezed,
  }) {
    return _then(_$BookingSessionDeatilsImpl(
      BookingSession: freezed == BookingSession
          ? _value.BookingSession
          : BookingSession // ignore: cast_nullable_to_non_nullable
              as String?,
      BookedMemberFirstName: freezed == BookedMemberFirstName
          ? _value.BookedMemberFirstName
          : BookedMemberFirstName // ignore: cast_nullable_to_non_nullable
              as String?,
      BookedMemberLastName: freezed == BookedMemberLastName
          ? _value.BookedMemberLastName
          : BookedMemberLastName // ignore: cast_nullable_to_non_nullable
              as String?,
      BookedMemberEmail: freezed == BookedMemberEmail
          ? _value.BookedMemberEmail
          : BookedMemberEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      SubTotal: freezed == SubTotal
          ? _value.SubTotal
          : SubTotal // ignore: cast_nullable_to_non_nullable
              as num?,
      Promocode: freezed == Promocode
          ? _value.Promocode
          : Promocode // ignore: cast_nullable_to_non_nullable
              as String?,
      PromocodeDiscount: freezed == PromocodeDiscount
          ? _value.PromocodeDiscount
          : PromocodeDiscount // ignore: cast_nullable_to_non_nullable
              as num?,
      MembershipDiscount: freezed == MembershipDiscount
          ? _value.MembershipDiscount
          : MembershipDiscount // ignore: cast_nullable_to_non_nullable
              as num?,
      TotalCost: freezed == TotalCost
          ? _value.TotalCost
          : TotalCost // ignore: cast_nullable_to_non_nullable
              as num?,
      IsBookingCompleted: freezed == IsBookingCompleted
          ? _value.IsBookingCompleted
          : IsBookingCompleted // ignore: cast_nullable_to_non_nullable
              as String?,
      CompletedOn: freezed == CompletedOn
          ? _value.CompletedOn
          : CompletedOn // ignore: cast_nullable_to_non_nullable
              as String?,
      BookedPackages: freezed == BookedPackages
          ? _value._BookedPackages
          : BookedPackages // ignore: cast_nullable_to_non_nullable
              as List<BookedPackage>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookingSessionDeatilsImpl implements _BookingSessionDeatils {
  const _$BookingSessionDeatilsImpl(
      {this.BookingSession,
      this.BookedMemberFirstName,
      this.BookedMemberLastName,
      this.BookedMemberEmail,
      this.SubTotal,
      this.Promocode,
      this.PromocodeDiscount,
      this.MembershipDiscount,
      this.TotalCost,
      this.IsBookingCompleted,
      this.CompletedOn,
      final List<BookedPackage>? BookedPackages})
      : _BookedPackages = BookedPackages;

  factory _$BookingSessionDeatilsImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookingSessionDeatilsImplFromJson(json);

  @override
  final String? BookingSession;
  @override
  final String? BookedMemberFirstName;
  @override
  final String? BookedMemberLastName;
  @override
  final String? BookedMemberEmail;
  @override
  final num? SubTotal;
  @override
  final String? Promocode;
  @override
  final num? PromocodeDiscount;
  @override
  final num? MembershipDiscount;
  @override
  final num? TotalCost;
  @override
  final String? IsBookingCompleted;
  @override
  final String? CompletedOn;
  final List<BookedPackage>? _BookedPackages;
  @override
  List<BookedPackage>? get BookedPackages {
    final value = _BookedPackages;
    if (value == null) return null;
    if (_BookedPackages is EqualUnmodifiableListView) return _BookedPackages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'BookingSessionDeatils(BookingSession: $BookingSession, BookedMemberFirstName: $BookedMemberFirstName, BookedMemberLastName: $BookedMemberLastName, BookedMemberEmail: $BookedMemberEmail, SubTotal: $SubTotal, Promocode: $Promocode, PromocodeDiscount: $PromocodeDiscount, MembershipDiscount: $MembershipDiscount, TotalCost: $TotalCost, IsBookingCompleted: $IsBookingCompleted, CompletedOn: $CompletedOn, BookedPackages: $BookedPackages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingSessionDeatilsImpl &&
            (identical(other.BookingSession, BookingSession) ||
                other.BookingSession == BookingSession) &&
            (identical(other.BookedMemberFirstName, BookedMemberFirstName) ||
                other.BookedMemberFirstName == BookedMemberFirstName) &&
            (identical(other.BookedMemberLastName, BookedMemberLastName) ||
                other.BookedMemberLastName == BookedMemberLastName) &&
            (identical(other.BookedMemberEmail, BookedMemberEmail) ||
                other.BookedMemberEmail == BookedMemberEmail) &&
            (identical(other.SubTotal, SubTotal) ||
                other.SubTotal == SubTotal) &&
            (identical(other.Promocode, Promocode) ||
                other.Promocode == Promocode) &&
            (identical(other.PromocodeDiscount, PromocodeDiscount) ||
                other.PromocodeDiscount == PromocodeDiscount) &&
            (identical(other.MembershipDiscount, MembershipDiscount) ||
                other.MembershipDiscount == MembershipDiscount) &&
            (identical(other.TotalCost, TotalCost) ||
                other.TotalCost == TotalCost) &&
            (identical(other.IsBookingCompleted, IsBookingCompleted) ||
                other.IsBookingCompleted == IsBookingCompleted) &&
            (identical(other.CompletedOn, CompletedOn) ||
                other.CompletedOn == CompletedOn) &&
            const DeepCollectionEquality()
                .equals(other._BookedPackages, _BookedPackages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      BookingSession,
      BookedMemberFirstName,
      BookedMemberLastName,
      BookedMemberEmail,
      SubTotal,
      Promocode,
      PromocodeDiscount,
      MembershipDiscount,
      TotalCost,
      IsBookingCompleted,
      CompletedOn,
      const DeepCollectionEquality().hash(_BookedPackages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingSessionDeatilsImplCopyWith<_$BookingSessionDeatilsImpl>
      get copyWith => __$$BookingSessionDeatilsImplCopyWithImpl<
          _$BookingSessionDeatilsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookingSessionDeatilsImplToJson(
      this,
    );
  }
}

abstract class _BookingSessionDeatils implements BookingSessionDeatils {
  const factory _BookingSessionDeatils(
      {final String? BookingSession,
      final String? BookedMemberFirstName,
      final String? BookedMemberLastName,
      final String? BookedMemberEmail,
      final num? SubTotal,
      final String? Promocode,
      final num? PromocodeDiscount,
      final num? MembershipDiscount,
      final num? TotalCost,
      final String? IsBookingCompleted,
      final String? CompletedOn,
      final List<BookedPackage>? BookedPackages}) = _$BookingSessionDeatilsImpl;

  factory _BookingSessionDeatils.fromJson(Map<String, dynamic> json) =
      _$BookingSessionDeatilsImpl.fromJson;

  @override
  String? get BookingSession;
  @override
  String? get BookedMemberFirstName;
  @override
  String? get BookedMemberLastName;
  @override
  String? get BookedMemberEmail;
  @override
  num? get SubTotal;
  @override
  String? get Promocode;
  @override
  num? get PromocodeDiscount;
  @override
  num? get MembershipDiscount;
  @override
  num? get TotalCost;
  @override
  String? get IsBookingCompleted;
  @override
  String? get CompletedOn;
  @override
  List<BookedPackage>? get BookedPackages;
  @override
  @JsonKey(ignore: true)
  _$$BookingSessionDeatilsImplCopyWith<_$BookingSessionDeatilsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

BookedPackage _$BookedPackageFromJson(Map<String, dynamic> json) {
  return _BookedPackage.fromJson(json);
}

/// @nodoc
mixin _$BookedPackage {
  String? get EventPackageCode => throw _privateConstructorUsedError;
  int? get PackageCost => throw _privateConstructorUsedError;
  num? get Quantity => throw _privateConstructorUsedError;
  num? get TotalCost => throw _privateConstructorUsedError;
  List<Participant>? get Participants => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookedPackageCopyWith<BookedPackage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookedPackageCopyWith<$Res> {
  factory $BookedPackageCopyWith(
          BookedPackage value, $Res Function(BookedPackage) then) =
      _$BookedPackageCopyWithImpl<$Res, BookedPackage>;
  @useResult
  $Res call(
      {String? EventPackageCode,
      int? PackageCost,
      num? Quantity,
      num? TotalCost,
      List<Participant>? Participants});
}

/// @nodoc
class _$BookedPackageCopyWithImpl<$Res, $Val extends BookedPackage>
    implements $BookedPackageCopyWith<$Res> {
  _$BookedPackageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? EventPackageCode = freezed,
    Object? PackageCost = freezed,
    Object? Quantity = freezed,
    Object? TotalCost = freezed,
    Object? Participants = freezed,
  }) {
    return _then(_value.copyWith(
      EventPackageCode: freezed == EventPackageCode
          ? _value.EventPackageCode
          : EventPackageCode // ignore: cast_nullable_to_non_nullable
              as String?,
      PackageCost: freezed == PackageCost
          ? _value.PackageCost
          : PackageCost // ignore: cast_nullable_to_non_nullable
              as int?,
      Quantity: freezed == Quantity
          ? _value.Quantity
          : Quantity // ignore: cast_nullable_to_non_nullable
              as num?,
      TotalCost: freezed == TotalCost
          ? _value.TotalCost
          : TotalCost // ignore: cast_nullable_to_non_nullable
              as num?,
      Participants: freezed == Participants
          ? _value.Participants
          : Participants // ignore: cast_nullable_to_non_nullable
              as List<Participant>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookedPackageImplCopyWith<$Res>
    implements $BookedPackageCopyWith<$Res> {
  factory _$$BookedPackageImplCopyWith(
          _$BookedPackageImpl value, $Res Function(_$BookedPackageImpl) then) =
      __$$BookedPackageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? EventPackageCode,
      int? PackageCost,
      num? Quantity,
      num? TotalCost,
      List<Participant>? Participants});
}

/// @nodoc
class __$$BookedPackageImplCopyWithImpl<$Res>
    extends _$BookedPackageCopyWithImpl<$Res, _$BookedPackageImpl>
    implements _$$BookedPackageImplCopyWith<$Res> {
  __$$BookedPackageImplCopyWithImpl(
      _$BookedPackageImpl _value, $Res Function(_$BookedPackageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? EventPackageCode = freezed,
    Object? PackageCost = freezed,
    Object? Quantity = freezed,
    Object? TotalCost = freezed,
    Object? Participants = freezed,
  }) {
    return _then(_$BookedPackageImpl(
      EventPackageCode: freezed == EventPackageCode
          ? _value.EventPackageCode
          : EventPackageCode // ignore: cast_nullable_to_non_nullable
              as String?,
      PackageCost: freezed == PackageCost
          ? _value.PackageCost
          : PackageCost // ignore: cast_nullable_to_non_nullable
              as int?,
      Quantity: freezed == Quantity
          ? _value.Quantity
          : Quantity // ignore: cast_nullable_to_non_nullable
              as num?,
      TotalCost: freezed == TotalCost
          ? _value.TotalCost
          : TotalCost // ignore: cast_nullable_to_non_nullable
              as num?,
      Participants: freezed == Participants
          ? _value._Participants
          : Participants // ignore: cast_nullable_to_non_nullable
              as List<Participant>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookedPackageImpl implements _BookedPackage {
  const _$BookedPackageImpl(
      {this.EventPackageCode,
      this.PackageCost,
      this.Quantity,
      this.TotalCost,
      final List<Participant>? Participants})
      : _Participants = Participants;

  factory _$BookedPackageImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookedPackageImplFromJson(json);

  @override
  final String? EventPackageCode;
  @override
  final int? PackageCost;
  @override
  final num? Quantity;
  @override
  final num? TotalCost;
  final List<Participant>? _Participants;
  @override
  List<Participant>? get Participants {
    final value = _Participants;
    if (value == null) return null;
    if (_Participants is EqualUnmodifiableListView) return _Participants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'BookedPackage(EventPackageCode: $EventPackageCode, PackageCost: $PackageCost, Quantity: $Quantity, TotalCost: $TotalCost, Participants: $Participants)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookedPackageImpl &&
            (identical(other.EventPackageCode, EventPackageCode) ||
                other.EventPackageCode == EventPackageCode) &&
            (identical(other.PackageCost, PackageCost) ||
                other.PackageCost == PackageCost) &&
            (identical(other.Quantity, Quantity) ||
                other.Quantity == Quantity) &&
            (identical(other.TotalCost, TotalCost) ||
                other.TotalCost == TotalCost) &&
            const DeepCollectionEquality()
                .equals(other._Participants, _Participants));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, EventPackageCode, PackageCost,
      Quantity, TotalCost, const DeepCollectionEquality().hash(_Participants));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookedPackageImplCopyWith<_$BookedPackageImpl> get copyWith =>
      __$$BookedPackageImplCopyWithImpl<_$BookedPackageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookedPackageImplToJson(
      this,
    );
  }
}

abstract class _BookedPackage implements BookedPackage {
  const factory _BookedPackage(
      {final String? EventPackageCode,
      final int? PackageCost,
      final num? Quantity,
      final num? TotalCost,
      final List<Participant>? Participants}) = _$BookedPackageImpl;

  factory _BookedPackage.fromJson(Map<String, dynamic> json) =
      _$BookedPackageImpl.fromJson;

  @override
  String? get EventPackageCode;
  @override
  int? get PackageCost;
  @override
  num? get Quantity;
  @override
  num? get TotalCost;
  @override
  List<Participant>? get Participants;
  @override
  @JsonKey(ignore: true)
  _$$BookedPackageImplCopyWith<_$BookedPackageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Participant _$ParticipantFromJson(Map<String, dynamic> json) {
  return _Participant.fromJson(json);
}

/// @nodoc
mixin _$Participant {
  String? get ParticipantCode => throw _privateConstructorUsedError;
  String? get ParticipantName => throw _privateConstructorUsedError;
  String? get ParticipantEmail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ParticipantCopyWith<Participant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParticipantCopyWith<$Res> {
  factory $ParticipantCopyWith(
          Participant value, $Res Function(Participant) then) =
      _$ParticipantCopyWithImpl<$Res, Participant>;
  @useResult
  $Res call(
      {String? ParticipantCode,
      String? ParticipantName,
      String? ParticipantEmail});
}

/// @nodoc
class _$ParticipantCopyWithImpl<$Res, $Val extends Participant>
    implements $ParticipantCopyWith<$Res> {
  _$ParticipantCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ParticipantCode = freezed,
    Object? ParticipantName = freezed,
    Object? ParticipantEmail = freezed,
  }) {
    return _then(_value.copyWith(
      ParticipantCode: freezed == ParticipantCode
          ? _value.ParticipantCode
          : ParticipantCode // ignore: cast_nullable_to_non_nullable
              as String?,
      ParticipantName: freezed == ParticipantName
          ? _value.ParticipantName
          : ParticipantName // ignore: cast_nullable_to_non_nullable
              as String?,
      ParticipantEmail: freezed == ParticipantEmail
          ? _value.ParticipantEmail
          : ParticipantEmail // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ParticipantImplCopyWith<$Res>
    implements $ParticipantCopyWith<$Res> {
  factory _$$ParticipantImplCopyWith(
          _$ParticipantImpl value, $Res Function(_$ParticipantImpl) then) =
      __$$ParticipantImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? ParticipantCode,
      String? ParticipantName,
      String? ParticipantEmail});
}

/// @nodoc
class __$$ParticipantImplCopyWithImpl<$Res>
    extends _$ParticipantCopyWithImpl<$Res, _$ParticipantImpl>
    implements _$$ParticipantImplCopyWith<$Res> {
  __$$ParticipantImplCopyWithImpl(
      _$ParticipantImpl _value, $Res Function(_$ParticipantImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ParticipantCode = freezed,
    Object? ParticipantName = freezed,
    Object? ParticipantEmail = freezed,
  }) {
    return _then(_$ParticipantImpl(
      ParticipantCode: freezed == ParticipantCode
          ? _value.ParticipantCode
          : ParticipantCode // ignore: cast_nullable_to_non_nullable
              as String?,
      ParticipantName: freezed == ParticipantName
          ? _value.ParticipantName
          : ParticipantName // ignore: cast_nullable_to_non_nullable
              as String?,
      ParticipantEmail: freezed == ParticipantEmail
          ? _value.ParticipantEmail
          : ParticipantEmail // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ParticipantImpl implements _Participant {
  const _$ParticipantImpl(
      {this.ParticipantCode, this.ParticipantName, this.ParticipantEmail});

  factory _$ParticipantImpl.fromJson(Map<String, dynamic> json) =>
      _$$ParticipantImplFromJson(json);

  @override
  final String? ParticipantCode;
  @override
  final String? ParticipantName;
  @override
  final String? ParticipantEmail;

  @override
  String toString() {
    return 'Participant(ParticipantCode: $ParticipantCode, ParticipantName: $ParticipantName, ParticipantEmail: $ParticipantEmail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParticipantImpl &&
            (identical(other.ParticipantCode, ParticipantCode) ||
                other.ParticipantCode == ParticipantCode) &&
            (identical(other.ParticipantName, ParticipantName) ||
                other.ParticipantName == ParticipantName) &&
            (identical(other.ParticipantEmail, ParticipantEmail) ||
                other.ParticipantEmail == ParticipantEmail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, ParticipantCode, ParticipantName, ParticipantEmail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ParticipantImplCopyWith<_$ParticipantImpl> get copyWith =>
      __$$ParticipantImplCopyWithImpl<_$ParticipantImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ParticipantImplToJson(
      this,
    );
  }
}

abstract class _Participant implements Participant {
  const factory _Participant(
      {final String? ParticipantCode,
      final String? ParticipantName,
      final String? ParticipantEmail}) = _$ParticipantImpl;

  factory _Participant.fromJson(Map<String, dynamic> json) =
      _$ParticipantImpl.fromJson;

  @override
  String? get ParticipantCode;
  @override
  String? get ParticipantName;
  @override
  String? get ParticipantEmail;
  @override
  @JsonKey(ignore: true)
  _$$ParticipantImplCopyWith<_$ParticipantImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
