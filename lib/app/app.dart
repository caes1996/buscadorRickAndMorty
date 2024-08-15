import 'package:flutter/material.dart';
import 'package:buscador_rick_and_morty/config/routes.dart';

class RickAndMortyApp extends StatelessWidget {
  const RickAndMortyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Buscador Rick and Morty',
      routerConfig: appRouter,
    );
  }
}