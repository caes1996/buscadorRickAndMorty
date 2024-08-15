import 'package:flutter/material.dart';

class CharacterListPage extends StatefulWidget {
  const CharacterListPage({super.key});

  static String name = 'character_list_page';

  @override
  State<CharacterListPage> createState() => _CharacterListPageState();
}

class _CharacterListPageState extends State<CharacterListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscador Rick and Morty'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [],
      ),
    );
  }
}