import 'package:cnc_toolbox/core/router/app_router.dart';
import 'package:flutter/material.dart';

class CuttingSpeedPage extends StatelessWidget {
  const CuttingSpeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tap Drill'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => const HomeRoute().go(context),
        ),
      ),
      body: const Center(child: Text('Tap Drill Page Placeholder')),
    );
  }
}
