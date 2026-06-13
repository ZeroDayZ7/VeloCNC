// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thread_standard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ThreadStandard _$ThreadStandardFromJson(Map<String, dynamic> json) =>
    _ThreadStandard(
      name: json['name'] as String,
      description: json['description'] as String,
      sizes: (json['sizes'] as List<dynamic>)
          .map((e) => ThreadSize.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ThreadStandardToJson(_ThreadStandard instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'sizes': instance.sizes,
    };

_ThreadSize _$ThreadSizeFromJson(Map<String, dynamic> json) => _ThreadSize(
  label: json['label'] as String,
  diameter: (json['diameter'] as num).toDouble(),
  pitch: (json['pitch'] as num).toDouble(),
  isMetric: json['isMetric'] as bool? ?? true,
);

Map<String, dynamic> _$ThreadSizeToJson(_ThreadSize instance) =>
    <String, dynamic>{
      'label': instance.label,
      'diameter': instance.diameter,
      'pitch': instance.pitch,
      'isMetric': instance.isMetric,
    };
