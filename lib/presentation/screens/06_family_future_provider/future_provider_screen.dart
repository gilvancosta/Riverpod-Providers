import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../05_future_provider/providers/future_providers.dart';

class FamilyFutureScreen extends ConsumerStatefulWidget {
  const FamilyFutureScreen({super.key});

  @override
  FamilyFutureScreenState createState() => FamilyFutureScreenState();

  //State<FamilyFutureScreen> createState() => _FamilyFutureScreenState();
}

class FamilyFutureScreenState extends ConsumerState<FamilyFutureScreen> {
  int pokemonId = 3;

  @override
  Widget build(BuildContext context) {
    final pokemonAsync = ref.watch(pokemonProvider(pokemonId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Family Future Provider'),
      ),
      body: Center(
          child: pokemonAsync.when(
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
                child: const Icon(Icons.remove),
                onPressed: () {
                  if (pokemonId > 1) {
                    setState(() {
                      pokemonId--;
                    });
                  }
                },
              ),
              FloatingActionButton(
                heroTag: 'btn-1',
                child: const Icon(Icons.add),
                onPressed: () {
                  if (pokemonId < 10) {
                    setState(() {
                      pokemonId++;
                    });
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
