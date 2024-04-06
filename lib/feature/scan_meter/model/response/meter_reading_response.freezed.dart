// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meter_reading_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MeterReadingResponse _$MeterReadingResponseFromJson(Map<String, dynamic> json) {
  return _MeterReadingResponse.fromJson(json);
}

/// @nodoc
mixin _$MeterReadingResponse {
  String get meterReading => throw _privateConstructorUsedError;
  String get meterId => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MeterReadingResponseCopyWith<MeterReadingResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeterReadingResponseCopyWith<$Res> {
  factory $MeterReadingResponseCopyWith(MeterReadingResponse value,
          $Res Function(MeterReadingResponse) then) =
      _$MeterReadingResponseCopyWithImpl<$Res, MeterReadingResponse>;
  @useResult
  $Res call({String meterReading, String meterId, String error});
}

/// @nodoc
class _$MeterReadingResponseCopyWithImpl<$Res,
        $Val extends MeterReadingResponse>
    implements $MeterReadingResponseCopyWith<$Res> {
  _$MeterReadingResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meterReading = null,
    Object? meterId = null,
    Object? error = null,
  }) {
    return _then(_value.copyWith(
      meterReading: null == meterReading
          ? _value.meterReading
          : meterReading // ignore: cast_nullable_to_non_nullable
              as String,
      meterId: null == meterId
          ? _value.meterId
          : meterId // ignore: cast_nullable_to_non_nullable
              as String,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MeterReadingResponseImplCopyWith<$Res>
    implements $MeterReadingResponseCopyWith<$Res> {
  factory _$$MeterReadingResponseImplCopyWith(_$MeterReadingResponseImpl value,
          $Res Function(_$MeterReadingResponseImpl) then) =
      __$$MeterReadingResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String meterReading, String meterId, String error});
}

/// @nodoc
class __$$MeterReadingResponseImplCopyWithImpl<$Res>
    extends _$MeterReadingResponseCopyWithImpl<$Res, _$MeterReadingResponseImpl>
    implements _$$MeterReadingResponseImplCopyWith<$Res> {
  __$$MeterReadingResponseImplCopyWithImpl(_$MeterReadingResponseImpl _value,
      $Res Function(_$MeterReadingResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meterReading = null,
    Object? meterId = null,
    Object? error = null,
  }) {
    return _then(_$MeterReadingResponseImpl(
      meterReading: null == meterReading
          ? _value.meterReading
          : meterReading // ignore: cast_nullable_to_non_nullable
              as String,
      meterId: null == meterId
          ? _value.meterId
          : meterId // ignore: cast_nullable_to_non_nullable
              as String,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MeterReadingResponseImpl implements _MeterReadingResponse {
  const _$MeterReadingResponseImpl(
      {this.meterReading = '', this.meterId = '', this.error = ''});

  factory _$MeterReadingResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MeterReadingResponseImplFromJson(json);

  @override
  @JsonKey()
  final String meterReading;
  @override
  @JsonKey()
  final String meterId;
  @override
  @JsonKey()
  final String error;

  @override
  String toString() {
    return 'MeterReadingResponse(meterReading: $meterReading, meterId: $meterId, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MeterReadingResponseImpl &&
            (identical(other.meterReading, meterReading) ||
                other.meterReading == meterReading) &&
            (identical(other.meterId, meterId) || other.meterId == meterId) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, meterReading, meterId, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MeterReadingResponseImplCopyWith<_$MeterReadingResponseImpl>
      get copyWith =>
          __$$MeterReadingResponseImplCopyWithImpl<_$MeterReadingResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MeterReadingResponseImplToJson(
      this,
    );
  }
}

abstract class _MeterReadingResponse implements MeterReadingResponse {
  const factory _MeterReadingResponse(
      {final String meterReading,
      final String meterId,
      final String error}) = _$MeterReadingResponseImpl;

  factory _MeterReadingResponse.fromJson(Map<String, dynamic> json) =
      _$MeterReadingResponseImpl.fromJson;

  @override
  String get meterReading;
  @override
  String get meterId;
  @override
  String get error;
  @override
  @JsonKey(ignore: true)
  _$$MeterReadingResponseImplCopyWith<_$MeterReadingResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
