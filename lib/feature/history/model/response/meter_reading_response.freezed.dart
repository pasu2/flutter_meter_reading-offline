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
  String get id => throw _privateConstructorUsedError;
  String get meterReading => throw _privateConstructorUsedError;
  String get meterId => throw _privateConstructorUsedError;
  String get imgPath => throw _privateConstructorUsedError;
  DateTime get createAt => throw _privateConstructorUsedError;
  DateTime get updateAt => throw _privateConstructorUsedError;

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
  $Res call(
      {String id,
      String meterReading,
      String meterId,
      String imgPath,
      DateTime createAt,
      DateTime updateAt});
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
    Object? id = null,
    Object? meterReading = null,
    Object? meterId = null,
    Object? imgPath = null,
    Object? createAt = null,
    Object? updateAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      meterReading: null == meterReading
          ? _value.meterReading
          : meterReading // ignore: cast_nullable_to_non_nullable
              as String,
      meterId: null == meterId
          ? _value.meterId
          : meterId // ignore: cast_nullable_to_non_nullable
              as String,
      imgPath: null == imgPath
          ? _value.imgPath
          : imgPath // ignore: cast_nullable_to_non_nullable
              as String,
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updateAt: null == updateAt
          ? _value.updateAt
          : updateAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
  $Res call(
      {String id,
      String meterReading,
      String meterId,
      String imgPath,
      DateTime createAt,
      DateTime updateAt});
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
    Object? id = null,
    Object? meterReading = null,
    Object? meterId = null,
    Object? imgPath = null,
    Object? createAt = null,
    Object? updateAt = null,
  }) {
    return _then(_$MeterReadingResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      meterReading: null == meterReading
          ? _value.meterReading
          : meterReading // ignore: cast_nullable_to_non_nullable
              as String,
      meterId: null == meterId
          ? _value.meterId
          : meterId // ignore: cast_nullable_to_non_nullable
              as String,
      imgPath: null == imgPath
          ? _value.imgPath
          : imgPath // ignore: cast_nullable_to_non_nullable
              as String,
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updateAt: null == updateAt
          ? _value.updateAt
          : updateAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MeterReadingResponseImpl implements _MeterReadingResponse {
  const _$MeterReadingResponseImpl(
      {required this.id,
      required this.meterReading,
      required this.meterId,
      required this.imgPath,
      required this.createAt,
      required this.updateAt});

  factory _$MeterReadingResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MeterReadingResponseImplFromJson(json);

  @override
  final String id;
  @override
  final String meterReading;
  @override
  final String meterId;
  @override
  final String imgPath;
  @override
  final DateTime createAt;
  @override
  final DateTime updateAt;

  @override
  String toString() {
    return 'MeterReadingResponse(id: $id, meterReading: $meterReading, meterId: $meterId, imgPath: $imgPath, createAt: $createAt, updateAt: $updateAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MeterReadingResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.meterReading, meterReading) ||
                other.meterReading == meterReading) &&
            (identical(other.meterId, meterId) || other.meterId == meterId) &&
            (identical(other.imgPath, imgPath) || other.imgPath == imgPath) &&
            (identical(other.createAt, createAt) ||
                other.createAt == createAt) &&
            (identical(other.updateAt, updateAt) ||
                other.updateAt == updateAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, meterReading, meterId, imgPath, createAt, updateAt);

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
      {required final String id,
      required final String meterReading,
      required final String meterId,
      required final String imgPath,
      required final DateTime createAt,
      required final DateTime updateAt}) = _$MeterReadingResponseImpl;

  factory _MeterReadingResponse.fromJson(Map<String, dynamic> json) =
      _$MeterReadingResponseImpl.fromJson;

  @override
  String get id;
  @override
  String get meterReading;
  @override
  String get meterId;
  @override
  String get imgPath;
  @override
  DateTime get createAt;
  @override
  DateTime get updateAt;
  @override
  @JsonKey(ignore: true)
  _$$MeterReadingResponseImplCopyWith<_$MeterReadingResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
