import 'package:flutter/material.dart';
import 'package:pokemon_api/models/pokedex_response.dart';
import 'package:pokemon_api/providers/pokedex_provider.dart';
import 'package:provider/provider.dart';

class PokemonDetails extends StatefulWidget {
  const PokemonDetails({super.key});

  @override
  State<PokemonDetails> createState() => _PokemonDetailsState();
}

class _PokemonDetailsState extends State<PokemonDetails> {
  @override
  Widget build(BuildContext context) {
    
    PokedexList arg = ModalRoute.of(context)!.settings.arguments as PokedexList;

    final pokedexProvider = Provider.of<PokedexProvider>(context);

    pokedexProvider.getPokemon(arg.name);

    if(pokedexProvider.pokemonDetails.name == arg.name){
        return Scaffold(
        appBar: AppBar(
          title: Text(arg.name),
        ),
        body: Center(
          child: Image.network(
            pokedexProvider.pokemonDetails.sprites!.backDefault ?? 'https://www.pokemon.com/static-assets/app/static3/img/og-default-image.jpeg', height: 300,
            loadingBuilder: (context, child, loadingProgress) {
              if(loadingProgress == null){
                return child;
              }else{
                return const CircularProgressIndicator();
              }
            },
            ),
        ),
      );
    }else{
      return Scaffold(
        appBar: AppBar(
          title: Text(arg.name),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    
  }
}