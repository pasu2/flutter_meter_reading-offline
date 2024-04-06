// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_picker_config_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ImagePickerConfigRequestImpl _$$ImagePickerConfigRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$ImagePickerConfigRequestImpl(
      type: $enumDecodeNullable(_$ImagePickerTypeEnumMap, json['type']) ??
          ImagePickerType.signle,
      source: $enumDecodeNullable(_$ImageSourceEnumMap, json['source']) ??
          ImageSource.gallery,
      maxWidth: (json['maxWidth'] as num?)?.toDouble(),
      maxHeight: (json['maxHeight'] as num?)?.toDouble(),
      imageQuality: json['imageQuality'] as int?,
      isMaximum2MB: json['isMaximum2MB'] as bool? ?? false,
    );

Map<String, dynamic> _$$ImagePickerConfigRequestImplToJson(
        _$ImagePickerConfigRequestImpl instance) =>
    <String, dynamic>{
      'type': _$ImagePickerTypeEnumMap[instance.type]!,
      'source': _$ImageSourceEnumMap[instance.source]!,
      'maxWidth': instance.maxWidth,
      'maxHeight': instance.maxHeight,
      'imageQuality': instance.imageQuality,
      'isMaximum2MB': instance.isMaximum2MB,
    };

const _$ImagePickerTypeEnumMap = {
  ImagePickerType.signle: 'signle',
  ImagePickerType.multi: 'multi',
};

const _$ImageSourceEnumMap = {
  ImageSource.camera: 'camera',
  ImageSource.gallery: 'gallery',
};
