import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'providers/future_providers.dart';

class FutureProviderScreen extends ConsumerWidget {
  const FutureProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonName = ref.watch(pokemonNameProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Provider'),
      ),
      body: Center(
          child: pokemonName.when(
        data: (data) => Text(data, style: const TextStyle(fontSize: 30)),
        error: (error, stackTrace) => Text('Error: $error'),
        loading: () => const CircularProgressIndicator(),
      )),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                heroTag: 'btn-2',
                child: const Icon(Icons.add),
                onPressed: () {
                  ref.read(pokemonIdProvider.notifier).nextPokemon();
                },
              ),
              const SizedBox(width: 10),
              FloatingActionButton(
                heroTag: 'btn-3',
                child: const Icon(Icons.remove),
                onPressed: () {
                  ref.read(pokemonIdProvider.notifier).prevPokemon();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
