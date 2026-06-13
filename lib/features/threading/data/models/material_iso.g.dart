// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_iso.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IsoMaterialGroup _$IsoMaterialGroupFromJson(Map<String, dynamic> json) =>
    _IsoMaterialGroup(
      groupId: json['group_id'] as String,
      name: json['name'] as String,
      colorHex: json['color'] as String,
      subgroups:
          (json['subgroups'] as List<dynamic>?)
              ?.map((e) => IsoSubgroup.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      factors: json['factors'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$IsoMaterialGroupToJson(_IsoMaterialGroup instance) =>
    <String, dynamic>{
      'group_id': instance.groupId,
      'name': instance.name,
      'color': instance.colorHex,
      'subgroups': instance.subgroups,
      'factors': instance.factors,
    };

_IsoSubgroup _$IsoSubgroupFromJson(Map<String, dynamic> json) => _IsoSubgroup(
  id: json['id'] as String,
  type: json['type'] as String? ?? '',
  vcHss: (json['v_c_hss'] as num?)?.toDouble() ?? 0.0,
  vcVhm: (json['v_c_vhm'] as num?)?.toDouble() ?? 0.0,
  hardnessRange: json['hardness_range'] as String?,
);

Map<String, dynamic> _$IsoSubgroupToJson(_IsoSubgroup instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'v_c_hss': instance.vcHss,
      'v_c_vhm': instance.vcVhm,
      'hardness_range': instance.hardnessRange,
    };
