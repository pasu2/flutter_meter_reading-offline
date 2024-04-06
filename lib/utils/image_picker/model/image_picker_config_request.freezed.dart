// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_picker_config_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ImagePickerConfigRequest _$ImagePickerConfigRequestFromJson(
    Map<String, dynamic> json) {
  return _ImagePickerConfigRequest.fromJson(json);
}

/// @nodoc
mixin _$ImagePickerConfigRequest {
  ImagePickerType get type => throw _privateConstructorUsedError;
  ImageSource get source => throw _privateConstructorUsedError;
  double? get maxWidth => throw _privateConstructorUsedError;
  double? get maxHeight => throw _privateConstructorUsedError;
  int? get imageQuality => throw _privateConstructorUsedError;
  bool get isMaximum2MB => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImagePickerConfigRequestCopyWith<ImagePickerConfigRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImagePickerConfigRequestCopyWith<$Res> {
  factory $ImagePickerConfigRequestCopyWith(ImagePickerConfigRequest value,
          $Res Function(ImagePickerConfigRequest) then) =
      _$ImagePickerConfigRequestCopyWithImpl<$Res, ImagePickerConfigRequest>;
  @useResult
  $Res call(
      {ImagePickerType type,
      ImageSource source,
      double? maxWidth,
      double? maxHeight,
      int? imageQuality,
      bool isMaximum2MB});
}

/// @nodoc
class _$ImagePickerConfigRequestCopyWithImpl<$Res,
        $Val extends ImagePickerConfigRequest>
    implements $ImagePickerConfigRequestCopyWith<$Res> {
  _$ImagePickerConfigRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? source = null,
    Object? maxWidth = freezed,
    Object? maxHeight = freezed,
    Object? imageQuality = freezed,
    Object? isMaximum2MB = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ImagePickerType,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as ImageSource,
      maxWidth: freezed == maxWidth
          ? _value.maxWidth
          : maxWidth // ignore: cast_nullable_to_non_nullable
              as double?,
      maxHeight: freezed == maxHeight
          ? _value.maxHeight
          : maxHeight // ignore: cast_nullable_to_non_nullable
              as double?,
      imageQuality: freezed == imageQuality
          ? _value.imageQuality
          : imageQuality // ignore: cast_nullable_to_non_nullable
              as int?,
      isMaximum2MB: null == isMaximum2MB
          ? _value.isMaximum2MB
          : isMaximum2MB // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImagePickerConfigRequestImplCopyWith<$Res>
    implements $ImagePickerConfigRequestCopyWith<$Res> {
  factory _$$ImagePickerConfigRequestImplCopyWith(
          _$ImagePickerConfigRequestImpl value,
          $Res Function(_$ImagePickerConfigRequestImpl) then) =
      __$$ImagePickerConfigRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ImagePickerType type,
      ImageSource source,
      double? maxWidth,
      double? maxHeight,
      int? imageQuality,
      bool isMaximum2MB});
}

/// @nodoc
class __$$ImagePickerConfigRequestImplCopyWithImpl<$Res>
    extends _$ImagePickerConfigRequestCopyWithImpl<$Res,
        _$ImagePickerConfigRequestImpl>
    implements _$$ImagePickerConfigRequestImplCopyWith<$Res> {
  __$$ImagePickerConfigRequestImplCopyWithImpl(
      _$ImagePickerConfigRequestImpl _value,
      $Res Function(_$ImagePickerConfigRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? source = null,
    Object? maxWidth = freezed,
    Object? maxHeight = freezed,
    Object? imageQuality = freezed,
    Object? isMaximum2MB = null,
  }) {
    return _then(_$ImagePickerConfigRequestImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ImagePickerType,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as ImageSource,
      maxWidth: freezed == maxWidth
          ? _value.maxWidth
          : maxWidth // ignore: cast_nullable_to_non_nullable
              as double?,
      maxHeight: freezed == maxHeight
          ? _value.maxHeight
          : maxHeight // ignore: cast_nullable_to_non_nullable
              as double?,
      imageQuality: freezed == imageQuality
          ? _value.imageQuality
          : imageQuality // ignore: cast_nullable_to_non_nullable
              as int?,
      isMaximum2MB: null == isMaximum2MB
          ? _value.isMaximum2MB
          : isMaximum2MB // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImagePickerConfigRequestImpl implements _ImagePickerConfigRequest {
  const _$ImagePickerConfigRequestImpl(
      {this.type = ImagePickerType.signle,
      this.source = ImageSource.gallery,
      this.maxWidth,
      this.maxHeight,
      this.imageQuality,
      this.isMaximum2MB = false});

  factory _$ImagePickerConfigRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImagePickerConfigRequestImplFromJson(json);

  @override
  @JsonKey()
  final ImagePickerType type;
  @override
  @JsonKey()
  final ImageSource source;
  @override
  final double? maxWidth;
  @override
  final double? maxHeight;
  @override
  final int? imageQuality;
  @override
  @JsonKey()
  final bool isMaximum2MB;

  @override
  String toString() {
    return 'ImagePickerConfigRequest(type: $type, source: $source, maxWidth: $maxWidth, maxHeight: $maxHeight, imageQuality: $imageQuality, isMaximum2MB: $isMaximum2MB)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImagePickerConfigRequestImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.maxWidth, maxWidth) ||
                other.maxWidth == maxWidth) &&
            (identical(other.maxHeight, maxHeight) ||
                other.maxHeight == maxHeight) &&
            (identical(other.imageQuality, imageQuality) ||
                other.imageQuality == imageQuality) &&
            (identical(other.isMaximum2MB, isMaximum2MB) ||
                other.isMaximum2MB == isMaximum2MB));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, source, maxWidth,
      maxHeight, imageQuality, isMaximum2MB);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImagePickerConfigRequestImplCopyWith<_$ImagePickerConfigRequestImpl>
      get copyWith => __$$ImagePickerConfigRequestImplCopyWithImpl<
          _$ImagePickerConfigRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImagePickerConfigRequestImplToJson(
      this,
    );
  }
}

abstract class _ImagePickerConfigRequest implements ImagePickerConfigRequest {
  const factory _ImagePickerConfigRequest(
      {final ImagePickerType type,
      final ImageSource source,
      final double? maxWidth,
      final double? maxHeight,
      final int? imageQuality,
      final bool isMaximum2MB}) = _$ImagePickerConfigRequestImpl;

  factory _ImagePickerConfigRequest.fromJson(Map<String, dynamic> json) =
      _$ImagePickerConfigRequestImpl.fromJson;

  @override
  ImagePickerType get type;
  @override
  ImageSource get source;
  @override
  double? get maxWidth;
  @override
  double? get maxHeight;
  @override
  int? get imageQuality;
  @override
  bool get isMaximum2MB;
  @override
  @JsonKey(ignore: true)
  _$$ImagePickerConfigRequestImplCopyWith<_$ImagePickerConfigRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
