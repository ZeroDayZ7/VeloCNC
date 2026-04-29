import 'dart:convert';

import 'package:cnc_toolbox/features/threading/data/models/material_iso.dart';
import 'package:flutter/services.dart';

class ThreadRepository {
  Future<List<IsoMaterialGroup>> loadMaterials() async {
    final String response = await rootBundle.loadString(
      'assets/data/materials.json',
    );

    final data = json.decode(response) as Map<String, dynamic>; 
    final groupsJson = data['iso_main_groups'] as List<dynamic>;

    return groupsJson.map((group) {
      final groupMap = group as Map<String, dynamic>;

      final mapped = {
        'group_id': groupMap['id'],
        'name': groupMap['name_pl'] ?? groupMap['name'],
        'color': groupMap['color_hex'],
        'factors': groupMap['threading_factors'] ?? {},
        'subgroups': (groupMap['application_groups'] as List<dynamic>).map((
          sub,
        ) {
          final subMap = sub as Map<String, dynamic>;
          return {
            'id': subMap['code'] ?? subMap['id'],
            'type': subMap['characteristics'] ?? '',
            'hardness_range': subMap['hardness_range'],
            'v_c_hss': 0.0,
            'v_c_vhm': 0.0,
          };
        }).toList(),
      };

      return IsoMaterialGroup.fromJson(mapped);
    }).toList();
  }
}
