import 'package:cnc_toolbox/features/g_codes/data/g_codes_data.dart';
import 'package:cnc_toolbox/features/g_codes/domain/g_code_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'g_codes_provider.g.dart';

@riverpod
class GCodeSearch extends _$GCodeSearch {
  @override
  String build() => "";

  void update(String query) => state = query;
}

@riverpod
List<GCode> filteredGCodes(Ref ref) {
  final query = ref.watch(gCodeSearchProvider).toLowerCase();

  if (query.isEmpty) return cncCodes;

  return cncCodes.where((code) {
    return code.code.toLowerCase().contains(query) ||
        code.titleKey.tr().toLowerCase().contains(query) ||
        code.descriptionKey.tr().toLowerCase().contains(query);
  }).toList();
}
