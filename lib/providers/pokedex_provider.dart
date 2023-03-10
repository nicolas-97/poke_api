import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:pokemon_api/models/pokedex_response.dart';
import 'package:pokemon_api/models/pokemon_response.dart';
import 'package:pokemon_api/views/pokemon_details.dart';

class PokedexProvider extends ChangeNotifier{

  final String _domain = 'pokeapi.co';

  List<PokedexList> pokemonList = [];
  PokemonDetailsResponse pokemonDetails = PokemonDetailsResponse();

  PokedexProvider(){
    getAllPokemons();
  }

  getAllPokemons() async {
    
    Uri url = Uri.https(_domain, '/api/v2/pokemon/');

    final response = await http.get(url);

    PokedexResponse data = PokedexResponse.fromJson(json.decode(response.body));

    pokemonList = [...pokemonList, ...data.results];

    notifyListeners();
  }

  getPokemon(String name) async {
    Uri url = Uri.https(_domain, '/api/v2/pokemon/$name');

    final response = await http.get(url);

    PokemonDetailsResponse data = PokemonDetailsResponse.fromJson(json.decode(response.body));

    pokemonDetails = data;

    notifyListeners();
  }
  
}