// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EventInfoModel _$EventInfoModelFromJson(Map<String, dynamic> json) {
  return _EventInfoModel.fromJson(json);
}

/// @nodoc
mixin _$EventInfoModel {
  EventSettings? get eventSettings => throw _privateConstructorUsedError;
  String? get IsSuccess => throw _privateConstructorUsedError;
  String? get ErrorOnFailure => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventInfoModelCopyWith<EventInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventInfoModelCopyWith<$Res> {
  factory $EventInfoModelCopyWith(
          EventInfoModel value, $Res Function(EventInfoModel) then) =
      _$EventInfoModelCopyWithImpl<$Res, EventInfoModel>;
  @useResult
  $Res call(
      {EventSettings? eventSettings,
      String? IsSuccess,
      String? ErrorOnFailure});

  $EventSettingsCopyWith<$Res>? get eventSettings;
}

/// @nodoc
class _$EventInfoModelCopyWithImpl<$Res, $Val extends EventInfoModel>
    implements $EventInfoModelCopyWith<$Res> {
  _$EventInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventSettings = freezed,
    Object? IsSuccess = freezed,
    Object? ErrorOnFailure = freezed,
  }) {
    return _then(_value.copyWith(
      eventSettings: freezed == eventSettings
          ? _value.eventSettings
          : eventSettings // ignore: cast_nullable_to_non_nullable
              as EventSettings?,
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
  $EventSettingsCopyWith<$Res>? get eventSettings {
    if (_value.eventSettings == null) {
      return null;
    }

    return $EventSettingsCopyWith<$Res>(_value.eventSettings!, (value) {
      return _then(_value.copyWith(eventSettings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EventInfoModelImplCopyWith<$Res>
    implements $EventInfoModelCopyWith<$Res> {
  factory _$$EventInfoModelImplCopyWith(_$EventInfoModelImpl value,
          $Res Function(_$EventInfoModelImpl) then) =
      __$$EventInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {EventSettings? eventSettings,
      String? IsSuccess,
      String? ErrorOnFailure});

  @override
  $EventSettingsCopyWith<$Res>? get eventSettings;
}

/// @nodoc
class __$$EventInfoModelImplCopyWithImpl<$Res>
    extends _$EventInfoModelCopyWithImpl<$Res, _$EventInfoModelImpl>
    implements _$$EventInfoModelImplCopyWith<$Res> {
  __$$EventInfoModelImplCopyWithImpl(
      _$EventInfoModelImpl _value, $Res Function(_$EventInfoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventSettings = freezed,
    Object? IsSuccess = freezed,
    Object? ErrorOnFailure = freezed,
  }) {
    return _then(_$EventInfoModelImpl(
      eventSettings: freezed == eventSettings
          ? _value.eventSettings
          : eventSettings // ignore: cast_nullable_to_non_nullable
              as EventSettings?,
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
class _$EventInfoModelImpl implements _EventInfoModel {
  const _$EventInfoModelImpl(
      {this.eventSettings, this.IsSuccess, this.ErrorOnFailure});

  factory _$EventInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventInfoModelImplFromJson(json);

  @override
  final EventSettings? eventSettings;
  @override
  final String? IsSuccess;
  @override
  final String? ErrorOnFailure;

  @override
  String toString() {
    return 'EventInfoModel(eventSettings: $eventSettings, IsSuccess: $IsSuccess, ErrorOnFailure: $ErrorOnFailure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventInfoModelImpl &&
            (identical(other.eventSettings, eventSettings) ||
                other.eventSettings == eventSettings) &&
            (identical(other.IsSuccess, IsSuccess) ||
                other.IsSuccess == IsSuccess) &&
            (identical(other.ErrorOnFailure, ErrorOnFailure) ||
                other.ErrorOnFailure == ErrorOnFailure));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, eventSettings, IsSuccess, ErrorOnFailure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EventInfoModelImplCopyWith<_$EventInfoModelImpl> get copyWith =>
      __$$EventInfoModelImplCopyWithImpl<_$EventInfoModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventInfoModelImplToJson(
      this,
    );
  }
}

abstract class _EventInfoModel implements EventInfoModel {
  const factory _EventInfoModel(
      {final EventSettings? eventSettings,
      final String? IsSuccess,
      final String? ErrorOnFailure}) = _$EventInfoModelImpl;

  factory _EventInfoModel.fromJson(Map<String, dynamic> json) =
      _$EventInfoModelImpl.fromJson;

  @override
  EventSettings? get eventSettings;
  @override
  String? get IsSuccess;
  @override
  String? get ErrorOnFailure;
  @override
  @JsonKey(ignore: true)
  _$$EventInfoModelImplCopyWith<_$EventInfoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EventSettings _$EventSettingsFromJson(Map<String, dynamic> json) {
  return _EventSettings.fromJson(json);
}

/// @nodoc
mixin _$EventSettings {
  String? get EventCode => throw _privateConstructorUsedError;
  String? get EventName => throw _privateConstructorUsedError;
  String? get EventDescription => throw _privateConstructorUsedError;
  String? get BannerURL => throw _privateConstructorUsedError;
  String? get MustUseMyInfo => throw _privateConstructorUsedError;
  String? get MustUseMyInfoMessage => throw _privateConstructorUsedError;
  String? get BookingChannel => throw _privateConstructorUsedError;
  List<EventPackage>? get EventPackages => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventSettingsCopyWith<EventSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventSettingsCopyWith<$Res> {
  factory $EventSettingsCopyWith(
          EventSettings value, $Res Function(EventSettings) then) =
      _$EventSettingsCopyWithImpl<$Res, EventSettings>;
  @useResult
  $Res call(
      {String? EventCode,
      String? EventName,
      String? EventDescription,
      String? BannerURL,
      String? MustUseMyInfo,
      String? MustUseMyInfoMessage,
      String? BookingChannel,
      List<EventPackage>? EventPackages});
}

/// @nodoc
class _$EventSettingsCopyWithImpl<$Res, $Val extends EventSettings>
    implements $EventSettingsCopyWith<$Res> {
  _$EventSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? EventCode = freezed,
    Object? EventName = freezed,
    Object? EventDescription = freezed,
    Object? BannerURL = freezed,
    Object? MustUseMyInfo = freezed,
    Object? MustUseMyInfoMessage = freezed,
    Object? BookingChannel = freezed,
    Object? EventPackages = freezed,
  }) {
    return _then(_value.copyWith(
      EventCode: freezed == EventCode
          ? _value.EventCode
          : EventCode // ignore: cast_nullable_to_non_nullable
              as String?,
      EventName: freezed == EventName
          ? _value.EventName
          : EventName // ignore: cast_nullable_to_non_nullable
              as String?,
      EventDescription: freezed == EventDescription
          ? _value.EventDescription
          : EventDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      BannerURL: freezed == BannerURL
          ? _value.BannerURL
          : BannerURL // ignore: cast_nullable_to_non_nullable
              as String?,
      MustUseMyInfo: freezed == MustUseMyInfo
          ? _value.MustUseMyInfo
          : MustUseMyInfo // ignore: cast_nullable_to_non_nullable
              as String?,
      MustUseMyInfoMessage: freezed == MustUseMyInfoMessage
          ? _value.MustUseMyInfoMessage
          : MustUseMyInfoMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      BookingChannel: freezed == BookingChannel
          ? _value.BookingChannel
          : BookingChannel // ignore: cast_nullable_to_non_nullable
              as String?,
      EventPackages: freezed == EventPackages
          ? _value.EventPackages
          : EventPackages // ignore: cast_nullable_to_non_nullable
              as List<EventPackage>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventSettingsImplCopyWith<$Res>
    implements $EventSettingsCopyWith<$Res> {
  factory _$$EventSettingsImplCopyWith(
          _$EventSettingsImpl value, $Res Function(_$EventSettingsImpl) then) =
      __$$EventSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? EventCode,
      String? EventName,
      String? EventDescription,
      String? BannerURL,
      String? MustUseMyInfo,
      String? MustUseMyInfoMessage,
      String? BookingChannel,
      List<EventPackage>? EventPackages});
}

/// @nodoc
class __$$EventSettingsImplCopyWithImpl<$Res>
    extends _$EventSettingsCopyWithImpl<$Res, _$EventSettingsImpl>
    implements _$$EventSettingsImplCopyWith<$Res> {
  __$$EventSettingsImplCopyWithImpl(
      _$EventSettingsImpl _value, $Res Function(_$EventSettingsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? EventCode = freezed,
    Object? EventName = freezed,
    Object? EventDescription = freezed,
    Object? BannerURL = freezed,
    Object? MustUseMyInfo = freezed,
    Object? MustUseMyInfoMessage = freezed,
    Object? BookingChannel = freezed,
    Object? EventPackages = freezed,
  }) {
    return _then(_$EventSettingsImpl(
      EventCode: freezed == EventCode
          ? _value.EventCode
          : EventCode // ignore: cast_nullable_to_non_nullable
              as String?,
      EventName: freezed == EventName
          ? _value.EventName
          : EventName // ignore: cast_nullable_to_non_nullable
              as String?,
      EventDescription: freezed == EventDescription
          ? _value.EventDescription
          : EventDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      BannerURL: freezed == BannerURL
          ? _value.BannerURL
          : BannerURL // ignore: cast_nullable_to_non_nullable
              as String?,
      MustUseMyInfo: freezed == MustUseMyInfo
          ? _value.MustUseMyInfo
          : MustUseMyInfo // ignore: cast_nullable_to_non_nullable
              as String?,
      MustUseMyInfoMessage: freezed == MustUseMyInfoMessage
          ? _value.MustUseMyInfoMessage
          : MustUseMyInfoMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      BookingChannel: freezed == BookingChannel
          ? _value.BookingChannel
          : BookingChannel // ignore: cast_nullable_to_non_nullable
              as String?,
      EventPackages: freezed == EventPackages
          ? _value._EventPackages
          : EventPackages // ignore: cast_nullable_to_non_nullable
              as List<EventPackage>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventSettingsImpl implements _EventSettings {
  const _$EventSettingsImpl(
      {this.EventCode,
      this.EventName,
      this.EventDescription,
      this.BannerURL,
      this.MustUseMyInfo,
      this.MustUseMyInfoMessage,
      this.BookingChannel,
      final List<EventPackage>? EventPackages})
      : _EventPackages = EventPackages;

  factory _$EventSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventSettingsImplFromJson(json);

  @override
  final String? EventCode;
  @override
  final String? EventName;
  @override
  final String? EventDescription;
  @override
  final String? BannerURL;
  @override
  final String? MustUseMyInfo;
  @override
  final String? MustUseMyInfoMessage;
  @override
  final String? BookingChannel;
  final List<EventPackage>? _EventPackages;
  @override
  List<EventPackage>? get EventPackages {
    final value = _EventPackages;
    if (value == null) return null;
    if (_EventPackages is EqualUnmodifiableListView) return _EventPackages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'EventSettings(EventCode: $EventCode, EventName: $EventName, EventDescription: $EventDescription, BannerURL: $BannerURL, MustUseMyInfo: $MustUseMyInfo, MustUseMyInfoMessage: $MustUseMyInfoMessage, BookingChannel: $BookingChannel, EventPackages: $EventPackages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventSettingsImpl &&
            (identical(other.EventCode, EventCode) ||
                other.EventCode == EventCode) &&
            (identical(other.EventName, EventName) ||
                other.EventName == EventName) &&
            (identical(other.EventDescription, EventDescription) ||
                other.EventDescription == EventDescription) &&
            (identical(other.BannerURL, BannerURL) ||
                other.BannerURL == BannerURL) &&
            (identical(other.MustUseMyInfo, MustUseMyInfo) ||
                other.MustUseMyInfo == MustUseMyInfo) &&
            (identical(other.MustUseMyInfoMessage, MustUseMyInfoMessage) ||
                other.MustUseMyInfoMessage == MustUseMyInfoMessage) &&
            (identical(other.BookingChannel, BookingChannel) ||
                other.BookingChannel == BookingChannel) &&
            const DeepCollectionEquality()
                .equals(other._EventPackages, _EventPackages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      EventCode,
      EventName,
      EventDescription,
      BannerURL,
      MustUseMyInfo,
      MustUseMyInfoMessage,
      BookingChannel,
      const DeepCollectionEquality().hash(_EventPackages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EventSettingsImplCopyWith<_$EventSettingsImpl> get copyWith =>
      __$$EventSettingsImplCopyWithImpl<_$EventSettingsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventSettingsImplToJson(
      this,
    );
  }
}

abstract class _EventSettings implements EventSettings {
  const factory _EventSettings(
      {final String? EventCode,
      final String? EventName,
      final String? EventDescription,
      final String? BannerURL,
      final String? MustUseMyInfo,
      final String? MustUseMyInfoMessage,
      final String? BookingChannel,
      final List<EventPackage>? EventPackages}) = _$EventSettingsImpl;

  factory _EventSettings.fromJson(Map<String, dynamic> json) =
      _$EventSettingsImpl.fromJson;

  @override
  String? get EventCode;
  @override
  String? get EventName;
  @override
  String? get EventDescription;
  @override
  String? get BannerURL;
  @override
  String? get MustUseMyInfo;
  @override
  String? get MustUseMyInfoMessage;
  @override
  String? get BookingChannel;
  @override
  List<EventPackage>? get EventPackages;
  @override
  @JsonKey(ignore: true)
  _$$EventSettingsImplCopyWith<_$EventSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EventPackage _$EventPackageFromJson(Map<String, dynamic> json) {
  return _EventPackage.fromJson(json);
}

/// @nodoc
mixin _$EventPackage {
  String? get EventPackageCode => throw _privateConstructorUsedError;
  String? get PackageName => throw _privateConstructorUsedError;
  String? get PackageDescription => throw _privateConstructorUsedError;
  String? get Price => throw _privateConstructorUsedError;
  String? get PackageStatus => throw _privateConstructorUsedError;
  String? get PackageStatusMessage => throw _privateConstructorUsedError;
  List<String>? get Venues => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventPackageCopyWith<EventPackage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventPackageCopyWith<$Res> {
  factory $EventPackageCopyWith(
          EventPackage value, $Res Function(EventPackage) then) =
      _$EventPackageCopyWithImpl<$Res, EventPackage>;
  @useResult
  $Res call(
      {String? EventPackageCode,
      String? PackageName,
      String? PackageDescription,
      String? Price,
      String? PackageStatus,
      String? PackageStatusMessage,
      List<String>? Venues});
}

/// @nodoc
class _$EventPackageCopyWithImpl<$Res, $Val extends EventPackage>
    implements $EventPackageCopyWith<$Res> {
  _$EventPackageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? EventPackageCode = freezed,
    Object? PackageName = freezed,
    Object? PackageDescription = freezed,
    Object? Price = freezed,
    Object? PackageStatus = freezed,
    Object? PackageStatusMessage = freezed,
    Object? Venues = freezed,
  }) {
    return _then(_value.copyWith(
      EventPackageCode: freezed == EventPackageCode
          ? _value.EventPackageCode
          : EventPackageCode // ignore: cast_nullable_to_non_nullable
              as String?,
      PackageName: freezed == PackageName
          ? _value.PackageName
          : PackageName // ignore: cast_nullable_to_non_nullable
              as String?,
      PackageDescription: freezed == PackageDescription
          ? _value.PackageDescription
          : PackageDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      Price: freezed == Price
          ? _value.Price
          : Price // ignore: cast_nullable_to_non_nullable
              as String?,
      PackageStatus: freezed == PackageStatus
          ? _value.PackageStatus
          : PackageStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      PackageStatusMessage: freezed == PackageStatusMessage
          ? _value.PackageStatusMessage
          : PackageStatusMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      Venues: freezed == Venues
          ? _value.Venues
          : Venues // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventPackageImplCopyWith<$Res>
    implements $EventPackageCopyWith<$Res> {
  factory _$$EventPackageImplCopyWith(
          _$EventPackageImpl value, $Res Function(_$EventPackageImpl) then) =
      __$$EventPackageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? EventPackageCode,
      String? PackageName,
      String? PackageDescription,
      String? Price,
      String? PackageStatus,
      String? PackageStatusMessage,
      List<String>? Venues});
}

/// @nodoc
class __$$EventPackageImplCopyWithImpl<$Res>
    extends _$EventPackageCopyWithImpl<$Res, _$EventPackageImpl>
    implements _$$EventPackageImplCopyWith<$Res> {
  __$$EventPackageImplCopyWithImpl(
      _$EventPackageImpl _value, $Res Function(_$EventPackageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? EventPackageCode = freezed,
    Object? PackageName = freezed,
    Object? PackageDescription = freezed,
    Object? Price = freezed,
    Object? PackageStatus = freezed,
    Object? PackageStatusMessage = freezed,
    Object? Venues = freezed,
  }) {
    return _then(_$EventPackageImpl(
      EventPackageCode: freezed == EventPackageCode
          ? _value.EventPackageCode
          : EventPackageCode // ignore: cast_nullable_to_non_nullable
              as String?,
      PackageName: freezed == PackageName
          ? _value.PackageName
          : PackageName // ignore: cast_nullable_to_non_nullable
              as String?,
      PackageDescription: freezed == PackageDescription
          ? _value.PackageDescription
          : PackageDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      Price: freezed == Price
          ? _value.Price
          : Price // ignore: cast_nullable_to_non_nullable
              as String?,
      PackageStatus: freezed == PackageStatus
          ? _value.PackageStatus
          : PackageStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      PackageStatusMessage: freezed == PackageStatusMessage
          ? _value.PackageStatusMessage
          : PackageStatusMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      Venues: freezed == Venues
          ? _value._Venues
          : Venues // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventPackageImpl implements _EventPackage {
  const _$EventPackageImpl(
      {this.EventPackageCode,
      this.PackageName,
      this.PackageDescription,
      this.Price,
      this.PackageStatus,
      this.PackageStatusMessage,
      final List<String>? Venues})
      : _Venues = Venues;

  factory _$EventPackageImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventPackageImplFromJson(json);

  @override
  final String? EventPackageCode;
  @override
  final String? PackageName;
  @override
  final String? PackageDescription;
  @override
  final String? Price;
  @override
  final String? PackageStatus;
  @override
  final String? PackageStatusMessage;
  final List<String>? _Venues;
  @override
  List<String>? get Venues {
    final value = _Venues;
    if (value == null) return null;
    if (_Venues is EqualUnmodifiableListView) return _Venues;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'EventPackage(EventPackageCode: $EventPackageCode, PackageName: $PackageName, PackageDescription: $PackageDescription, Price: $Price, PackageStatus: $PackageStatus, PackageStatusMessage: $PackageStatusMessage, Venues: $Venues)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventPackageImpl &&
            (identical(other.EventPackageCode, EventPackageCode) ||
                other.EventPackageCode == EventPackageCode) &&
            (identical(other.PackageName, PackageName) ||
                other.PackageName == PackageName) &&
            (identical(other.PackageDescription, PackageDescription) ||
                other.PackageDescription == PackageDescription) &&
            (identical(other.Price, Price) || other.Price == Price) &&
            (identical(other.PackageStatus, PackageStatus) ||
                other.PackageStatus == PackageStatus) &&
            (identical(other.PackageStatusMessage, PackageStatusMessage) ||
                other.PackageStatusMessage == PackageStatusMessage) &&
            const DeepCollectionEquality().equals(other._Venues, _Venues));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      EventPackageCode,
      PackageName,
      PackageDescription,
      Price,
      PackageStatus,
      PackageStatusMessage,
      const DeepCollectionEquality().hash(_Venues));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EventPackageImplCopyWith<_$EventPackageImpl> get copyWith =>
      __$$EventPackageImplCopyWithImpl<_$EventPackageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventPackageImplToJson(
      this,
    );
  }
}

abstract class _EventPackage implements EventPackage {
  const factory _EventPackage(
      {final String? EventPackageCode,
      final String? PackageName,
      final String? PackageDescription,
      final String? Price,
      final String? PackageStatus,
      final String? PackageStatusMessage,
      final List<String>? Venues}) = _$EventPackageImpl;

  factory _EventPackage.fromJson(Map<String, dynamic> json) =
      _$EventPackageImpl.fromJson;

  @override
  String? get EventPackageCode;
  @override
  String? get PackageName;
  @override
  String? get PackageDescription;
  @override
  String? get Price;
  @override
  String? get PackageStatus;
  @override
  String? get PackageStatusMessage;
  @override
  List<String>? get Venues;
  @override
  @JsonKey(ignore: true)
  _$$EventPackageImplCopyWith<_$EventPackageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
