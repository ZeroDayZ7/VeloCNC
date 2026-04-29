import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_iso.freezed.dart';
part 'material_iso.g.dart';

@freezed
sealed class IsoMaterialGroup with _$IsoMaterialGroup {
  const IsoMaterialGroup._();

  const factory IsoMaterialGroup({
    @JsonKey(name: 'group_id') required String groupId,
    required String name,
    @JsonKey(name: 'color') required String colorHex,
    @Default([]) List<IsoSubgroup> subgroups,
    @Default({}) Map<String, dynamic> factors,
  }) = _IsoMaterialGroup;

  // Usuwamy ręczne wywołania _$IsoMaterialGroupFromJson w środku fabryki.
  // Używamy prostej fabryki, a normalizację zrobimy w Repozytorium.
  factory IsoMaterialGroup.fromJson(Map<String, dynamic> json) =>
      _$IsoMaterialGroupFromJson(json);

  Color get color {
    final hex = colorHex.replaceFirst('#', '0xFF');
    return Color(int.parse(hex));
  }
}

@freezed
sealed class IsoSubgroup with _$IsoSubgroup {
  const factory IsoSubgroup({
    required String id,
    @Default('') String type,
    @JsonKey(name: 'v_c_hss') @Default(0.0) double vcHss,
    @JsonKey(name: 'v_c_vhm') @Default(0.0) double vcVhm,
    @JsonKey(name: 'hardness_range') String? hardnessRange,
  }) = _IsoSubgroup;

  factory IsoSubgroup.fromJson(Map<String, dynamic> json) =>
      _$IsoSubgroupFromJson(json);
}
