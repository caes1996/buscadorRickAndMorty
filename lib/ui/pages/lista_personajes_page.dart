import 'package:flutter/material.dart';

class ListaPersonajesPage extends StatefulWidget {
  const ListaPersonajesPage({super.key});

  static String name = 'lista_personajes_page';

  @override
  State<ListaPersonajesPage> createState() => _ListaPersonajesPageState();
}

class _ListaPersonajesPageState extends State<ListaPersonajesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscador Rick and Morty'),
      ),
    );
  }
}