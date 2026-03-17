import 'package:cnc_toolbox/core/constants/constants.dart';
import 'package:cnc_toolbox/core/database/database.dart';
import 'package:cnc_toolbox/features/feed_rate/feed_rate_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'feed_rate_provider.dart';

class FeedRatePage extends ConsumerWidget {
  const FeedRatePage({super.key});

  // Metoda otwierająca historię z bazy danych
  void _showHistory(BuildContext context, WidgetRef ref) async {
    // POBIERAMY DANE Z KONTEKSTU PRZED OTWARCIEM MODALA
    // To zadziała tylko jeśli context pochodzi z Buildera wewnątrz TabController
    final tabController = DefaultTabController.of(context);
    final currentTabIndex = tabController.index;
    final targetType = currentTabIndex == 0 ? "basic" : "arc";

    final db = ref.read(databaseProvider);
    final history = await db.getFeedHistory(limit: 10);

    if (!context.mounted) return;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (modalContext) => DraggableScrollableSheet(
        initialChildSize: 0.6,
        maxChildSize: 0.9,
        expand: false,
        builder: (context, scrollController) {
          return Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Ostatnie obliczenia",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: history.isEmpty
                    ? const Center(child: Text("Brak zapisanych danych"))
                    : ListView.builder(
                        controller: scrollController,
                        itemCount: history.length,
                        itemBuilder: (context, index) {
                          final item = history[index];
                          return ListTile(
                            leading: const Icon(Icons.history),
                            title: Text(
                              "${item.resultVf.toStringAsFixed(1)} mm/min",
                            ),
                            subtitle: Text(
                              "n: ${item.spindleSpeed}, fz: ${item.feedPerTooth}, z: ${item.teeth}",
                            ),
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 14,
                            ),
                            onTap: () {
                              // Wczytujemy do odpowiedniej instancji (basic lub arc)
                              ref
                                  .read(feedRateProvider(targetType).notifier)
                                  .loadFromHistory(item);

                              Navigator.pop(modalContext);
                            },
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Kalkulator Posuwu'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.go(Routes.home),
          ),
          actions: [
            // POPRAWKA: Przycisk historii opakowany w Builder
            Builder(
              builder: (innerContext) => IconButton(
                icon: const Icon(Icons.history),
                onPressed: () => _showHistory(innerContext, ref),
              ),
            ),
            // Przycisk zapisu opakowany w Builder
            Builder(
              builder: (innerContext) {
                return IconButton(
                  icon: const Icon(Icons.save),
                  onPressed: () async {
                    final tabIndex = DefaultTabController.of(
                      innerContext,
                    ).index;
                    final type = tabIndex == 0 ? "basic" : "arc";

                    await ref
                        .read(feedRateProvider(type).notifier)
                        .saveCurrentToDb();

                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Zapisano historię ($type)')),
                      );
                    }
                  },
                );
              },
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: "Podstawowy", icon: Icon(Icons.calculate)),
              Tab(text: "Łuk / Otwór", icon: Icon(Icons.refresh)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildTabContent(context, ref, "basic"),
            _buildTabContent(context, ref, "arc"),
          ],
        ),
      ),
    );
  }

  Widget _buildTabContent(BuildContext context, WidgetRef ref, String type) {
    final state = ref.watch(feedRateProvider(type));
    final notifier = ref.read(feedRateProvider(type).notifier);

    if (type == "basic") {
      return _buildBasicTab(context, state, notifier);
    } else {
      return _buildArcTab(context, state, notifier);
    }
  }

  Widget _buildBasicTab(
    BuildContext context,
    FeedRateState state,
    FeedRateNotifier notifier,
  ) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildResultCard(context, state.resultVf, state.resultF),
          const SizedBox(height: 20),
          _buildInputFields(notifier, state),
        ],
      ),
    );
  }

  Widget _buildArcTab(
    BuildContext context,
    FeedRateState state,
    FeedRateNotifier notifier,
  ) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildResultCard(
            context,
            state.resultVfArc,
            state.resultF,
            isArc: true,
          ),
          const SizedBox(height: 20),
          _buildInputFields(notifier, state),
          const Divider(height: 40),
          const Text(
            "Parametry łuku",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          TextField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: "Średnica narzędzia (D)",
              border: OutlineInputBorder(),
            ),
            onChanged: notifier.updateToolDia,
          ),
          const SizedBox(height: 10),
          TextField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: "Średnica otworu/czopu",
              border: OutlineInputBorder(),
            ),
            onChanged: notifier.updateFeatureDia,
          ),
          SwitchListTile(
            title: Text(
              state.isInternal ? "Otwór (Wewnętrzny)" : "Czop (Zewnętrzny)",
            ),
            value: state.isInternal,
            onChanged: notifier.toggleWorkType,
          ),
        ],
      ),
    );
  }

  Widget _buildInputFields(FeedRateNotifier notifier, FeedRateState state) {
    return Column(
      children: [
        TextField(
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: "Obroty (n)",
            suffixText: "obr/min",
            border: OutlineInputBorder(),
          ),
          onChanged: notifier.updateSpindleSpeed,
        ),
        const SizedBox(height: 10),
        // DODANE POLE: Liczba ostrzy (z)
        TextField(
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: "Liczba ostrzy (z)",
            suffixText: "szt.",
            border: OutlineInputBorder(),
          ),
          onChanged: (v) => notifier.updateTeeth(int.tryParse(v) ?? 1),
        ),
        const SizedBox(height: 10),
        TextField(
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: "Posuw na ostrze (fz)",
            suffixText: "mm",
            border: OutlineInputBorder(),
          ),
          onChanged: notifier.updateFeedPerTooth,
        ),
      ],
    );
  }

  Widget _buildResultCard(
    BuildContext context,
    double vf,
    double f, {
    bool isArc = false,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isArc
            ? const Color.fromARGB(255, 0, 92, 95)
            : Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(isArc ? "Skompensowany posuw (Vf)" : "Posuw liniowy (Vf)"),
          Text(
            "${vf.toStringAsFixed(1)} mm/min",
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          Text("Na obrót: ${f.toStringAsFixed(3)} mm/obr"),
        ],
      ),
    );
  }
}
