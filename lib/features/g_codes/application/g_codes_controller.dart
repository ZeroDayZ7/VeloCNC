import 'package:cnc_toolbox/core/localization/translator.dart';
import 'package:cnc_toolbox/core/models/result.dart';
import 'package:cnc_toolbox/core/utils/logger/logger_provider.dart';
import 'package:cnc_toolbox/features/g_codes/data/g_codes_repository.dart';
import 'package:cnc_toolbox/features/g_codes/domain/g_code_model.dart';
import 'package:cnc_toolbox/features/g_codes/domain/g_code_view_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'g_codes_controller.g.dart';

@Riverpod(keepAlive: true)
class GCodeController extends _$GCodeController {
  @override
  Future<GCodeState> build() async {
    final repo = ref.read(gCodesRepositoryProvider);
    final result = await repo.loadGCodes();

    return switch (result) {
      Success(data: final codes) => GCodeState(
        allCodes: codes,
        isLoading: false,
      ),
      Failure(error: final e) => _handleFailure(e),
    };
  }

  GCodeState _handleFailure(Object e) {
    ref.read(appLoggerProvider).e('Failed to load G-Codes', error: e);
    return const GCodeState(isLoading: false);
  }

  void updateSearch(String query) {
    update((state) => state.copyWith(searchQuery: query));
  }
}

@riverpod
List<GCodeViewModel> filteredGCodes(Ref ref) {
  final asyncState = ref.watch(gCodeControllerProvider);
  final t = ref.watch(translatorProvider);

  return asyncState.maybeWhen(
    data: (state) {
      final query = state.searchQuery.toLowerCase();
      return state.allCodes
          .where((code) {
            if (query.isEmpty) return true;

            return code.code.toLowerCase().contains(query) ||
                code.titleKey.toLowerCase().contains(query);
          })
          .map(
            (code) => GCodeViewModel(
              code: code.code,
              title: t.tr(code.titleKey),
              description: t.tr(code.descriptionKey),
              example: code.example,
            ),
          )
          .toList();
    },
    orElse: () => [],
  );
}
