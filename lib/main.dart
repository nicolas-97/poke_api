import 'package:flutter/material.dart';
import 'package:pokemon_api/providers/pokedex_provider.dart';
import 'package:pokemon_api/views/home_widget.dart';
import 'package:pokemon_api/views/pokemon_details.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PokedexProvider()),
      ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {

   @override
   Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        '/': (context) => const Home(),
        '/pokemon-details' :(context) => const PokemonDetails()
      },
    );
   }
}