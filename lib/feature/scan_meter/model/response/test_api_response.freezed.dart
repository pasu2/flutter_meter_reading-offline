// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'test_api_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TestAPIResponse _$TestAPIResponseFromJson(Map<String, dynamic> json) {
  return _TestAPIResponse.fromJson(json);
}

/// @nodoc
mixin _$TestAPIResponse {
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TestAPIResponseCopyWith<TestAPIResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TestAPIResponseCopyWith<$Res> {
  factory $TestAPIResponseCopyWith(
          TestAPIResponse value, $Res Function(TestAPIResponse) then) =
      _$TestAPIResponseCopyWithImpl<$Res, TestAPIResponse>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$TestAPIResponseCopyWithImpl<$Res, $Val extends TestAPIResponse>
    implements $TestAPIResponseCopyWith<$Res> {
  _$TestAPIResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TestAPIResponseImplCopyWith<$Res>
    implements $TestAPIResponseCopyWith<$Res> {
  factory _$$TestAPIResponseImplCopyWith(_$TestAPIResponseImpl value,
          $Res Function(_$TestAPIResponseImpl) then) =
      __$$TestAPIResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$TestAPIResponseImplCopyWithImpl<$Res>
    extends _$TestAPIResponseCopyWithImpl<$Res, _$TestAPIResponseImpl>
    implements _$$TestAPIResponseImplCopyWith<$Res> {
  __$$TestAPIResponseImplCopyWithImpl(
      _$TestAPIResponseImpl _value, $Res Function(_$TestAPIResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$TestAPIResponseImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TestAPIResponseImpl implements _TestAPIResponse {
  const _$TestAPIResponseImpl({this.message = ''});

  factory _$TestAPIResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TestAPIResponseImplFromJson(json);

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'TestAPIResponse(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TestAPIResponseImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TestAPIResponseImplCopyWith<_$TestAPIResponseImpl> get copyWith =>
      __$$TestAPIResponseImplCopyWithImpl<_$TestAPIResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TestAPIResponseImplToJson(
      this,
    );
  }
}

abstract class _TestAPIResponse implements TestAPIResponse {
  const factory _TestAPIResponse({final String message}) =
      _$TestAPIResponseImpl;

  factory _TestAPIResponse.fromJson(Map<String, dynamic> json) =
      _$TestAPIResponseImpl.fromJson;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$TestAPIResponseImplCopyWith<_$TestAPIResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
