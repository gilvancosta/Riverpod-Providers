import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/hello_world_provider.dart';

class ProviderScreen extends ConsumerWidget {
  const ProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String helloWorld = ref.watch(helloWorldProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(helloWorld),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ref.refresh(helloWorldProvider);
              },
              child: const Text('Refresh'),
            ),
          ],
        ),
      ),
      
    );
  }
}
