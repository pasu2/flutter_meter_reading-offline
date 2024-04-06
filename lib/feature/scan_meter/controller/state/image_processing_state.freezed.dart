// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_processing_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ImageProcessingState {
  Map<String, dynamic> get formData => throw _privateConstructorUsedError;
  String? get cameraImg => throw _privateConstructorUsedError;
  String? get cropImgPath => throw _privateConstructorUsedError;
  String? get meterId => throw _privateConstructorUsedError;
  String? get meterReading => throw _privateConstructorUsedError;
  String? get errorMsg => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ImageProcessingStateCopyWith<ImageProcessingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageProcessingStateCopyWith<$Res> {
  factory $ImageProcessingStateCopyWith(ImageProcessingState value,
          $Res Function(ImageProcessingState) then) =
      _$ImageProcessingStateCopyWithImpl<$Res, ImageProcessingState>;
  @useResult
  $Res call(
      {Map<String, dynamic> formData,
      String? cameraImg,
      String? cropImgPath,
      String? meterId,
      String? meterReading,
      String? errorMsg});
}

/// @nodoc
class _$ImageProcessingStateCopyWithImpl<$Res,
        $Val extends ImageProcessingState>
    implements $ImageProcessingStateCopyWith<$Res> {
  _$ImageProcessingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formData = null,
    Object? cameraImg = freezed,
    Object? cropImgPath = freezed,
    Object? meterId = freezed,
    Object? meterReading = freezed,
    Object? errorMsg = freezed,
  }) {
    return _then(_value.copyWith(
      formData: null == formData
          ? _value.formData
          : formData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      cameraImg: freezed == cameraImg
          ? _value.cameraImg
          : cameraImg // ignore: cast_nullable_to_non_nullable
              as String?,
      cropImgPath: freezed == cropImgPath
          ? _value.cropImgPath
          : cropImgPath // ignore: cast_nullable_to_non_nullable
              as String?,
      meterId: freezed == meterId
          ? _value.meterId
          : meterId // ignore: cast_nullable_to_non_nullable
              as String?,
      meterReading: freezed == meterReading
          ? _value.meterReading
          : meterReading // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMsg: freezed == errorMsg
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImageProcessingStateImplCopyWith<$Res>
    implements $ImageProcessingStateCopyWith<$Res> {
  factory _$$ImageProcessingStateImplCopyWith(_$ImageProcessingStateImpl value,
          $Res Function(_$ImageProcessingStateImpl) then) =
      __$$ImageProcessingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, dynamic> formData,
      String? cameraImg,
      String? cropImgPath,
      String? meterId,
      String? meterReading,
      String? errorMsg});
}

/// @nodoc
class __$$ImageProcessingStateImplCopyWithImpl<$Res>
    extends _$ImageProcessingStateCopyWithImpl<$Res, _$ImageProcessingStateImpl>
    implements _$$ImageProcessingStateImplCopyWith<$Res> {
  __$$ImageProcessingStateImplCopyWithImpl(_$ImageProcessingStateImpl _value,
      $Res Function(_$ImageProcessingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formData = null,
    Object? cameraImg = freezed,
    Object? cropImgPath = freezed,
    Object? meterId = freezed,
    Object? meterReading = freezed,
    Object? errorMsg = freezed,
  }) {
    return _then(_$ImageProcessingStateImpl(
      formData: null == formData
          ? _value._formData
          : formData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      cameraImg: freezed == cameraImg
          ? _value.cameraImg
          : cameraImg // ignore: cast_nullable_to_non_nullable
              as String?,
      cropImgPath: freezed == cropImgPath
          ? _value.cropImgPath
          : cropImgPath // ignore: cast_nullable_to_non_nullable
              as String?,
      meterId: freezed == meterId
          ? _value.meterId
          : meterId // ignore: cast_nullable_to_non_nullable
              as String?,
      meterReading: freezed == meterReading
          ? _value.meterReading
          : meterReading // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMsg: freezed == errorMsg
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ImageProcessingStateImpl implements _ImageProcessingState {
  const _$ImageProcessingStateImpl(
      {final Map<String, dynamic> formData = const {},
      this.cameraImg,
      this.cropImgPath,
      this.meterId,
      this.meterReading,
      this.errorMsg})
      : _formData = formData;

  final Map<String, dynamic> _formData;
  @override
  @JsonKey()
  Map<String, dynamic> get formData {
    if (_formData is EqualUnmodifiableMapView) return _formData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_formData);
  }

  @override
  final String? cameraImg;
  @override
  final String? cropImgPath;
  @override
  final String? meterId;
  @override
  final String? meterReading;
  @override
  final String? errorMsg;

  @override
  String toString() {
    return 'ImageProcessingState(formData: $formData, cameraImg: $cameraImg, cropImgPath: $cropImgPath, meterId: $meterId, meterReading: $meterReading, errorMsg: $errorMsg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageProcessingStateImpl &&
            const DeepCollectionEquality().equals(other._formData, _formData) &&
            (identical(other.cameraImg, cameraImg) ||
                other.cameraImg == cameraImg) &&
            (identical(other.cropImgPath, cropImgPath) ||
                other.cropImgPath == cropImgPath) &&
            (identical(other.meterId, meterId) || other.meterId == meterId) &&
            (identical(other.meterReading, meterReading) ||
                other.meterReading == meterReading) &&
            (identical(other.errorMsg, errorMsg) ||
                other.errorMsg == errorMsg));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_formData),
      cameraImg,
      cropImgPath,
      meterId,
      meterReading,
      errorMsg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageProcessingStateImplCopyWith<_$ImageProcessingStateImpl>
      get copyWith =>
          __$$ImageProcessingStateImplCopyWithImpl<_$ImageProcessingStateImpl>(
              this, _$identity);
}

abstract class _ImageProcessingState implements ImageProcessingState {
  const factory _ImageProcessingState(
      {final Map<String, dynamic> formData,
      final String? cameraImg,
      final String? cropImgPath,
      final String? meterId,
      final String? meterReading,
      final String? errorMsg}) = _$ImageProcessingStateImpl;

  @override
  Map<String, dynamic> get formData;
  @override
  String? get cameraImg;
  @override
  String? get cropImgPath;
  @override
  String? get meterId;
  @override
  String? get meterReading;
  @override
  String? get errorMsg;
  @override
  @JsonKey(ignore: true)
  _$$ImageProcessingStateImplCopyWith<_$ImageProcessingStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
