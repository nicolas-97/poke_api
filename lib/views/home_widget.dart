import 'package:flutter/material.dart';
import 'package:pokemon_api/providers/pokedex_provider.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {

    final pokedexProvider = Provider.of<PokedexProvider>(context);

    return Scaffold(
      body: ListView(
        children: pokedexProvider.pokemonList.map((e) => Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(bottom: 3),
          child: TextButton(
            child: Text(e.name),
            onPressed: () {
              Navigator.pushNamed(context, '/pokemon-details', arguments: e);
            },
          ),
        )).toList(),
      )
    );
  }
}