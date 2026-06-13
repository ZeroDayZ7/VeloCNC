import 'dart:convert';

import 'package:cnc_toolbox/features/threading/data/models/material_iso.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final threadRepositoryProvider = Provider((ref) => ThreadRepository());

class ThreadRepository {
  Future<List<IsoMaterialGroup>> loadMaterials() async {
    final String response = await rootBundle.loadString(
      'assets/data/iso-513-material-engine.json',
    );

    final data = json.decode(response) as Map<String, dynamic>;
    final groupsJson = data['materials_db'] as List<dynamic>;

    return groupsJson.map((group) {
      final groupMap = group as Map<String, dynamic>;

      return IsoMaterialGroup(
        groupId: groupMap['group_id'] as String,
        name: groupMap['name'] as String,
        colorHex: groupMap['color'] as String,
        factors: Map<String, dynamic>.from(groupMap['factors'] as Map? ?? {}),
        subgroups: (groupMap['subgroups'] as List<dynamic>).map((sub) {
          final subMap = sub as Map<String, dynamic>;
          return IsoSubgroup(
            id: subMap['id'] as String,
            type: (subMap['type'] as String?) ?? '',
            vcHss: (subMap['v_c_hss'] as num?)?.toDouble() ?? 0.0,
            vcVhm: (subMap['v_c_vhm'] as num?)?.toDouble() ?? 0.0,
            hardnessRange: subMap['hardness_max_hb']?.toString(),
          );
        }).toList(),
      );
    }).toList();
  }
}
