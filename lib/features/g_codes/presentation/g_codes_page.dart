import 'package:cnc_toolbox/core/localization/locale_keys.g.dart';
import 'package:cnc_toolbox/features/g_codes/application/g_codes_provider.dart';
import 'package:cnc_toolbox/features/g_codes/presentation/widgets/g_code_tile.dart';
import 'package:cnc_toolbox/features/g_codes/presentation/widgets/g_codes_info_modal.dart';
import 'package:cnc_toolbox/features/g_codes/presentation/widgets/g_codes_search_bar.dart'; // Import nowej klasy
import 'package:cnc_toolbox/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GCodesPage extends ConsumerWidget {
  const GCodesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final codes = ref.watch(filteredGCodesProvider);

    return Scaffold(
      appBar: CncAppBar(
        titleKey: LocaleKeys.tools_g_codes,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () => GCodesInfoModal.show(context),
          ),
        ],
      ),
      body: Column(
        children: [
          const GCodeSearchBar(), // Używamy jako const class
          Expanded(
            child: ListView.builder(
              itemCount: codes.length,
              itemBuilder: (context, index) {
                return GCodeTile(code: codes[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
