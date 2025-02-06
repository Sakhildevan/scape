// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_tickets_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MyTicketsModel _$MyTicketsModelFromJson(Map<String, dynamic> json) {
  return _MyTicketsModel.fromJson(json);
}

/// @nodoc
mixin _$MyTicketsModel {
  @JsonKey(name: "Tickets")
  List<Ticket>? get tickets => throw _privateConstructorUsedError;
  @JsonKey(name: "IsSuccess")
  String? get isSuccess => throw _privateConstructorUsedError;
  @JsonKey(name: "ErrorOnFailure")
  String? get errorOnFailure => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyTicketsModelCopyWith<MyTicketsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyTicketsModelCopyWith<$Res> {
  factory $MyTicketsModelCopyWith(
          MyTicketsModel value, $Res Function(MyTicketsModel) then) =
      _$MyTicketsModelCopyWithImpl<$Res, MyTicketsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "Tickets") List<Ticket>? tickets,
      @JsonKey(name: "IsSuccess") String? isSuccess,
      @JsonKey(name: "ErrorOnFailure") String? errorOnFailure});
}

/// @nodoc
class _$MyTicketsModelCopyWithImpl<$Res, $Val extends MyTicketsModel>
    implements $MyTicketsModelCopyWith<$Res> {
  _$MyTicketsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tickets = freezed,
    Object? isSuccess = freezed,
    Object? errorOnFailure = freezed,
  }) {
    return _then(_value.copyWith(
      tickets: freezed == tickets
          ? _value.tickets
          : tickets // ignore: cast_nullable_to_non_nullable
              as List<Ticket>?,
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
abstract class _$$MyTicketsModelImplCopyWith<$Res>
    implements $MyTicketsModelCopyWith<$Res> {
  factory _$$MyTicketsModelImplCopyWith(_$MyTicketsModelImpl value,
          $Res Function(_$MyTicketsModelImpl) then) =
      __$$MyTicketsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "Tickets") List<Ticket>? tickets,
      @JsonKey(name: "IsSuccess") String? isSuccess,
      @JsonKey(name: "ErrorOnFailure") String? errorOnFailure});
}

/// @nodoc
class __$$MyTicketsModelImplCopyWithImpl<$Res>
    extends _$MyTicketsModelCopyWithImpl<$Res, _$MyTicketsModelImpl>
    implements _$$MyTicketsModelImplCopyWith<$Res> {
  __$$MyTicketsModelImplCopyWithImpl(
      _$MyTicketsModelImpl _value, $Res Function(_$MyTicketsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tickets = freezed,
    Object? isSuccess = freezed,
    Object? errorOnFailure = freezed,
  }) {
    return _then(_$MyTicketsModelImpl(
      tickets: freezed == tickets
          ? _value._tickets
          : tickets // ignore: cast_nullable_to_non_nullable
              as List<Ticket>?,
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
class _$MyTicketsModelImpl implements _MyTicketsModel {
  const _$MyTicketsModelImpl(
      {@JsonKey(name: "Tickets") final List<Ticket>? tickets,
      @JsonKey(name: "IsSuccess") this.isSuccess,
      @JsonKey(name: "ErrorOnFailure") this.errorOnFailure})
      : _tickets = tickets;

  factory _$MyTicketsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyTicketsModelImplFromJson(json);

  final List<Ticket>? _tickets;
  @override
  @JsonKey(name: "Tickets")
  List<Ticket>? get tickets {
    final value = _tickets;
    if (value == null) return null;
    if (_tickets is EqualUnmodifiableListView) return _tickets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "IsSuccess")
  final String? isSuccess;
  @override
  @JsonKey(name: "ErrorOnFailure")
  final String? errorOnFailure;

  @override
  String toString() {
    return 'MyTicketsModel(tickets: $tickets, isSuccess: $isSuccess, errorOnFailure: $errorOnFailure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyTicketsModelImpl &&
            const DeepCollectionEquality().equals(other._tickets, _tickets) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.errorOnFailure, errorOnFailure) ||
                other.errorOnFailure == errorOnFailure));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_tickets), isSuccess, errorOnFailure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyTicketsModelImplCopyWith<_$MyTicketsModelImpl> get copyWith =>
      __$$MyTicketsModelImplCopyWithImpl<_$MyTicketsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MyTicketsModelImplToJson(
      this,
    );
  }
}

abstract class _MyTicketsModel implements MyTicketsModel {
  const factory _MyTicketsModel(
          {@JsonKey(name: "Tickets") final List<Ticket>? tickets,
          @JsonKey(name: "IsSuccess") final String? isSuccess,
          @JsonKey(name: "ErrorOnFailure") final String? errorOnFailure}) =
      _$MyTicketsModelImpl;

  factory _MyTicketsModel.fromJson(Map<String, dynamic> json) =
      _$MyTicketsModelImpl.fromJson;

  @override
  @JsonKey(name: "Tickets")
  List<Ticket>? get tickets;
  @override
  @JsonKey(name: "IsSuccess")
  String? get isSuccess;
  @override
  @JsonKey(name: "ErrorOnFailure")
  String? get errorOnFailure;
  @override
  @JsonKey(ignore: true)
  _$$MyTicketsModelImplCopyWith<_$MyTicketsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Ticket _$TicketFromJson(Map<String, dynamic> json) {
  return _Ticket.fromJson(json);
}

/// @nodoc
mixin _$Ticket {
  @JsonKey(name: "TicketCode")
  String? get ticketCode => throw _privateConstructorUsedError;
  @JsonKey(name: "BookedOn")
  String? get bookedOn => throw _privateConstructorUsedError;
  @JsonKey(name: "EventName")
  String? get eventName => throw _privateConstructorUsedError;
  @JsonKey(name: "EventDescription")
  String? get eventDescription => throw _privateConstructorUsedError;
  @JsonKey(name: "BannerURL")
  String? get bannerUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "TicketPrice")
  int? get ticketPrice => throw _privateConstructorUsedError;
  @JsonKey(name: "PromocodeDiscount")
  int? get promocodeDiscount => throw _privateConstructorUsedError;
  @JsonKey(name: "MembershipDiscount")
  int? get membershipDiscount => throw _privateConstructorUsedError;
  @JsonKey(name: "FinalPrice")
  int? get finalPrice => throw _privateConstructorUsedError;
  @JsonKey(name: "IsTicketCancelled")
  String? get isTicketCancelled => throw _privateConstructorUsedError;
  @JsonKey(name: "NextEventDate")
  String? get nextEventDate => throw _privateConstructorUsedError;
  @JsonKey(name: "NextEventTime")
  String? get nextEventTime => throw _privateConstructorUsedError;
  @JsonKey(name: "NextEventVenue")
  String? get nextEventVenue => throw _privateConstructorUsedError;
  @JsonKey(name: "NumberOfPax")
  int? get numberOfPax => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TicketCopyWith<Ticket> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketCopyWith<$Res> {
  factory $TicketCopyWith(Ticket value, $Res Function(Ticket) then) =
      _$TicketCopyWithImpl<$Res, Ticket>;
  @useResult
  $Res call(
      {@JsonKey(name: "TicketCode") String? ticketCode,
      @JsonKey(name: "BookedOn") String? bookedOn,
      @JsonKey(name: "EventName") String? eventName,
      @JsonKey(name: "EventDescription") String? eventDescription,
      @JsonKey(name: "BannerURL") String? bannerUrl,
      @JsonKey(name: "TicketPrice") int? ticketPrice,
      @JsonKey(name: "PromocodeDiscount") int? promocodeDiscount,
      @JsonKey(name: "MembershipDiscount") int? membershipDiscount,
      @JsonKey(name: "FinalPrice") int? finalPrice,
      @JsonKey(name: "IsTicketCancelled") String? isTicketCancelled,
      @JsonKey(name: "NextEventDate") String? nextEventDate,
      @JsonKey(name: "NextEventTime") String? nextEventTime,
      @JsonKey(name: "NextEventVenue") String? nextEventVenue,
      @JsonKey(name: "NumberOfPax") int? numberOfPax});
}

/// @nodoc
class _$TicketCopyWithImpl<$Res, $Val extends Ticket>
    implements $TicketCopyWith<$Res> {
  _$TicketCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ticketCode = freezed,
    Object? bookedOn = freezed,
    Object? eventName = freezed,
    Object? eventDescription = freezed,
    Object? bannerUrl = freezed,
    Object? ticketPrice = freezed,
    Object? promocodeDiscount = freezed,
    Object? membershipDiscount = freezed,
    Object? finalPrice = freezed,
    Object? isTicketCancelled = freezed,
    Object? nextEventDate = freezed,
    Object? nextEventTime = freezed,
    Object? nextEventVenue = freezed,
    Object? numberOfPax = freezed,
  }) {
    return _then(_value.copyWith(
      ticketCode: freezed == ticketCode
          ? _value.ticketCode
          : ticketCode // ignore: cast_nullable_to_non_nullable
              as String?,
      bookedOn: freezed == bookedOn
          ? _value.bookedOn
          : bookedOn // ignore: cast_nullable_to_non_nullable
              as String?,
      eventName: freezed == eventName
          ? _value.eventName
          : eventName // ignore: cast_nullable_to_non_nullable
              as String?,
      eventDescription: freezed == eventDescription
          ? _value.eventDescription
          : eventDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      bannerUrl: freezed == bannerUrl
          ? _value.bannerUrl
          : bannerUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      ticketPrice: freezed == ticketPrice
          ? _value.ticketPrice
          : ticketPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      promocodeDiscount: freezed == promocodeDiscount
          ? _value.promocodeDiscount
          : promocodeDiscount // ignore: cast_nullable_to_non_nullable
              as int?,
      membershipDiscount: freezed == membershipDiscount
          ? _value.membershipDiscount
          : membershipDiscount // ignore: cast_nullable_to_non_nullable
              as int?,
      finalPrice: freezed == finalPrice
          ? _value.finalPrice
          : finalPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      isTicketCancelled: freezed == isTicketCancelled
          ? _value.isTicketCancelled
          : isTicketCancelled // ignore: cast_nullable_to_non_nullable
              as String?,
      nextEventDate: freezed == nextEventDate
          ? _value.nextEventDate
          : nextEventDate // ignore: cast_nullable_to_non_nullable
              as String?,
      nextEventTime: freezed == nextEventTime
          ? _value.nextEventTime
          : nextEventTime // ignore: cast_nullable_to_non_nullable
              as String?,
      nextEventVenue: freezed == nextEventVenue
          ? _value.nextEventVenue
          : nextEventVenue // ignore: cast_nullable_to_non_nullable
              as String?,
      numberOfPax: freezed == numberOfPax
          ? _value.numberOfPax
          : numberOfPax // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TicketImplCopyWith<$Res> implements $TicketCopyWith<$Res> {
  factory _$$TicketImplCopyWith(
          _$TicketImpl value, $Res Function(_$TicketImpl) then) =
      __$$TicketImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "TicketCode") String? ticketCode,
      @JsonKey(name: "BookedOn") String? bookedOn,
      @JsonKey(name: "EventName") String? eventName,
      @JsonKey(name: "EventDescription") String? eventDescription,
      @JsonKey(name: "BannerURL") String? bannerUrl,
      @JsonKey(name: "TicketPrice") int? ticketPrice,
      @JsonKey(name: "PromocodeDiscount") int? promocodeDiscount,
      @JsonKey(name: "MembershipDiscount") int? membershipDiscount,
      @JsonKey(name: "FinalPrice") int? finalPrice,
      @JsonKey(name: "IsTicketCancelled") String? isTicketCancelled,
      @JsonKey(name: "NextEventDate") String? nextEventDate,
      @JsonKey(name: "NextEventTime") String? nextEventTime,
      @JsonKey(name: "NextEventVenue") String? nextEventVenue,
      @JsonKey(name: "NumberOfPax") int? numberOfPax});
}

/// @nodoc
class __$$TicketImplCopyWithImpl<$Res>
    extends _$TicketCopyWithImpl<$Res, _$TicketImpl>
    implements _$$TicketImplCopyWith<$Res> {
  __$$TicketImplCopyWithImpl(
      _$TicketImpl _value, $Res Function(_$TicketImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ticketCode = freezed,
    Object? bookedOn = freezed,
    Object? eventName = freezed,
    Object? eventDescription = freezed,
    Object? bannerUrl = freezed,
    Object? ticketPrice = freezed,
    Object? promocodeDiscount = freezed,
    Object? membershipDiscount = freezed,
    Object? finalPrice = freezed,
    Object? isTicketCancelled = freezed,
    Object? nextEventDate = freezed,
    Object? nextEventTime = freezed,
    Object? nextEventVenue = freezed,
    Object? numberOfPax = freezed,
  }) {
    return _then(_$TicketImpl(
      ticketCode: freezed == ticketCode
          ? _value.ticketCode
          : ticketCode // ignore: cast_nullable_to_non_nullable
              as String?,
      bookedOn: freezed == bookedOn
          ? _value.bookedOn
          : bookedOn // ignore: cast_nullable_to_non_nullable
              as String?,
      eventName: freezed == eventName
          ? _value.eventName
          : eventName // ignore: cast_nullable_to_non_nullable
              as String?,
      eventDescription: freezed == eventDescription
          ? _value.eventDescription
          : eventDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      bannerUrl: freezed == bannerUrl
          ? _value.bannerUrl
          : bannerUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      ticketPrice: freezed == ticketPrice
          ? _value.ticketPrice
          : ticketPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      promocodeDiscount: freezed == promocodeDiscount
          ? _value.promocodeDiscount
          : promocodeDiscount // ignore: cast_nullable_to_non_nullable
              as int?,
      membershipDiscount: freezed == membershipDiscount
          ? _value.membershipDiscount
          : membershipDiscount // ignore: cast_nullable_to_non_nullable
              as int?,
      finalPrice: freezed == finalPrice
          ? _value.finalPrice
          : finalPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      isTicketCancelled: freezed == isTicketCancelled
          ? _value.isTicketCancelled
          : isTicketCancelled // ignore: cast_nullable_to_non_nullable
              as String?,
      nextEventDate: freezed == nextEventDate
          ? _value.nextEventDate
          : nextEventDate // ignore: cast_nullable_to_non_nullable
              as String?,
      nextEventTime: freezed == nextEventTime
          ? _value.nextEventTime
          : nextEventTime // ignore: cast_nullable_to_non_nullable
              as String?,
      nextEventVenue: freezed == nextEventVenue
          ? _value.nextEventVenue
          : nextEventVenue // ignore: cast_nullable_to_non_nullable
              as String?,
      numberOfPax: freezed == numberOfPax
          ? _value.numberOfPax
          : numberOfPax // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TicketImpl implements _Ticket {
  const _$TicketImpl(
      {@JsonKey(name: "TicketCode") this.ticketCode,
      @JsonKey(name: "BookedOn") this.bookedOn,
      @JsonKey(name: "EventName") this.eventName,
      @JsonKey(name: "EventDescription") this.eventDescription,
      @JsonKey(name: "BannerURL") this.bannerUrl,
      @JsonKey(name: "TicketPrice") this.ticketPrice,
      @JsonKey(name: "PromocodeDiscount") this.promocodeDiscount,
      @JsonKey(name: "MembershipDiscount") this.membershipDiscount,
      @JsonKey(name: "FinalPrice") this.finalPrice,
      @JsonKey(name: "IsTicketCancelled") this.isTicketCancelled,
      @JsonKey(name: "NextEventDate") this.nextEventDate,
      @JsonKey(name: "NextEventTime") this.nextEventTime,
      @JsonKey(name: "NextEventVenue") this.nextEventVenue,
      @JsonKey(name: "NumberOfPax") this.numberOfPax});

  factory _$TicketImpl.fromJson(Map<String, dynamic> json) =>
      _$$TicketImplFromJson(json);

  @override
  @JsonKey(name: "TicketCode")
  final String? ticketCode;
  @override
  @JsonKey(name: "BookedOn")
  final String? bookedOn;
  @override
  @JsonKey(name: "EventName")
  final String? eventName;
  @override
  @JsonKey(name: "EventDescription")
  final String? eventDescription;
  @override
  @JsonKey(name: "BannerURL")
  final String? bannerUrl;
  @override
  @JsonKey(name: "TicketPrice")
  final int? ticketPrice;
  @override
  @JsonKey(name: "PromocodeDiscount")
  final int? promocodeDiscount;
  @override
  @JsonKey(name: "MembershipDiscount")
  final int? membershipDiscount;
  @override
  @JsonKey(name: "FinalPrice")
  final int? finalPrice;
  @override
  @JsonKey(name: "IsTicketCancelled")
  final String? isTicketCancelled;
  @override
  @JsonKey(name: "NextEventDate")
  final String? nextEventDate;
  @override
  @JsonKey(name: "NextEventTime")
  final String? nextEventTime;
  @override
  @JsonKey(name: "NextEventVenue")
  final String? nextEventVenue;
  @override
  @JsonKey(name: "NumberOfPax")
  final int? numberOfPax;

  @override
  String toString() {
    return 'Ticket(ticketCode: $ticketCode, bookedOn: $bookedOn, eventName: $eventName, eventDescription: $eventDescription, bannerUrl: $bannerUrl, ticketPrice: $ticketPrice, promocodeDiscount: $promocodeDiscount, membershipDiscount: $membershipDiscount, finalPrice: $finalPrice, isTicketCancelled: $isTicketCancelled, nextEventDate: $nextEventDate, nextEventTime: $nextEventTime, nextEventVenue: $nextEventVenue, numberOfPax: $numberOfPax)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketImpl &&
            (identical(other.ticketCode, ticketCode) ||
                other.ticketCode == ticketCode) &&
            (identical(other.bookedOn, bookedOn) ||
                other.bookedOn == bookedOn) &&
            (identical(other.eventName, eventName) ||
                other.eventName == eventName) &&
            (identical(other.eventDescription, eventDescription) ||
                other.eventDescription == eventDescription) &&
            (identical(other.bannerUrl, bannerUrl) ||
                other.bannerUrl == bannerUrl) &&
            (identical(other.ticketPrice, ticketPrice) ||
                other.ticketPrice == ticketPrice) &&
            (identical(other.promocodeDiscount, promocodeDiscount) ||
                other.promocodeDiscount == promocodeDiscount) &&
            (identical(other.membershipDiscount, membershipDiscount) ||
                other.membershipDiscount == membershipDiscount) &&
            (identical(other.finalPrice, finalPrice) ||
                other.finalPrice == finalPrice) &&
            (identical(other.isTicketCancelled, isTicketCancelled) ||
                other.isTicketCancelled == isTicketCancelled) &&
            (identical(other.nextEventDate, nextEventDate) ||
                other.nextEventDate == nextEventDate) &&
            (identical(other.nextEventTime, nextEventTime) ||
                other.nextEventTime == nextEventTime) &&
            (identical(other.nextEventVenue, nextEventVenue) ||
                other.nextEventVenue == nextEventVenue) &&
            (identical(other.numberOfPax, numberOfPax) ||
                other.numberOfPax == numberOfPax));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      ticketCode,
      bookedOn,
      eventName,
      eventDescription,
      bannerUrl,
      ticketPrice,
      promocodeDiscount,
      membershipDiscount,
      finalPrice,
      isTicketCancelled,
      nextEventDate,
      nextEventTime,
      nextEventVenue,
      numberOfPax);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TicketImplCopyWith<_$TicketImpl> get copyWith =>
      __$$TicketImplCopyWithImpl<_$TicketImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TicketImplToJson(
      this,
    );
  }
}

abstract class _Ticket implements Ticket {
  const factory _Ticket(
      {@JsonKey(name: "TicketCode") final String? ticketCode,
      @JsonKey(name: "BookedOn") final String? bookedOn,
      @JsonKey(name: "EventName") final String? eventName,
      @JsonKey(name: "EventDescription") final String? eventDescription,
      @JsonKey(name: "BannerURL") final String? bannerUrl,
      @JsonKey(name: "TicketPrice") final int? ticketPrice,
      @JsonKey(name: "PromocodeDiscount") final int? promocodeDiscount,
      @JsonKey(name: "MembershipDiscount") final int? membershipDiscount,
      @JsonKey(name: "FinalPrice") final int? finalPrice,
      @JsonKey(name: "IsTicketCancelled") final String? isTicketCancelled,
      @JsonKey(name: "NextEventDate") final String? nextEventDate,
      @JsonKey(name: "NextEventTime") final String? nextEventTime,
      @JsonKey(name: "NextEventVenue") final String? nextEventVenue,
      @JsonKey(name: "NumberOfPax") final int? numberOfPax}) = _$TicketImpl;

  factory _Ticket.fromJson(Map<String, dynamic> json) = _$TicketImpl.fromJson;

  @override
  @JsonKey(name: "TicketCode")
  String? get ticketCode;
  @override
  @JsonKey(name: "BookedOn")
  String? get bookedOn;
  @override
  @JsonKey(name: "EventName")
  String? get eventName;
  @override
  @JsonKey(name: "EventDescription")
  String? get eventDescription;
  @override
  @JsonKey(name: "BannerURL")
  String? get bannerUrl;
  @override
  @JsonKey(name: "TicketPrice")
  int? get ticketPrice;
  @override
  @JsonKey(name: "PromocodeDiscount")
  int? get promocodeDiscount;
  @override
  @JsonKey(name: "MembershipDiscount")
  int? get membershipDiscount;
  @override
  @JsonKey(name: "FinalPrice")
  int? get finalPrice;
  @override
  @JsonKey(name: "IsTicketCancelled")
  String? get isTicketCancelled;
  @override
  @JsonKey(name: "NextEventDate")
  String? get nextEventDate;
  @override
  @JsonKey(name: "NextEventTime")
  String? get nextEventTime;
  @override
  @JsonKey(name: "NextEventVenue")
  String? get nextEventVenue;
  @override
  @JsonKey(name: "NumberOfPax")
  int? get numberOfPax;
  @override
  @JsonKey(ignore: true)
  _$$TicketImplCopyWith<_$TicketImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
