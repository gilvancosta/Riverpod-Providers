// ignore_for_file: avoid_print

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'providers/hello_world_provider.dart';

class ProviderScreen extends ConsumerWidget {
  const ProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('ProviderScreen build!!! ${Random().nextInt(100)}');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider'),
      ),
      body: Center(
        child: Column(
          children: [
            Consumer(builder: (context, refLocal, _) {
              final String helloWorld = refLocal.watch(helloWorldProvider);
              return Text('Mensagem: $helloWorld',
                  style: const TextStyle(fontSize: 25));
            }),
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
