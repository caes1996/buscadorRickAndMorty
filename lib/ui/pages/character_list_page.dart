import 'package:buscador_rick_and_morty/domain/bloc/character_list_cubit.dart';
import 'package:buscador_rick_and_morty/domain/bloc/theme_cubit.dart';
import 'package:buscador_rick_and_morty/ui/widget/search_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';

class CharacterListPage extends StatefulWidget {
  const CharacterListPage({super.key});

  static String name = 'character_list_page';

  @override
  State<CharacterListPage> createState() => _CharacterListPageState();
}

class _CharacterListPageState extends State<CharacterListPage> {

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.read<ThemeCubit>();
    context.read<CharacterListCubit>().fetchCharactersByPage();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscador Rick and Morty'),
        actions: [
          IconButton(
            onPressed: () => themeCubit.toggleTheme(),
            icon: Icon( Theme.of(context).brightness == Brightness.dark
              ? Symbols.light_mode_rounded
              : Symbols.dark_mode_rounded
            )
          ),
          const SizedBox(width: 16)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            SearchComponent(
              hint: 'Buscar personaje',
              controller: _controller,
              onChanged: (value) {
                context.read<CharacterListCubit>().fetchCharactersByName(name: _controller.text);
              }
            ),
            const SizedBox(height: 24),
            BlocBuilder<CharacterListCubit, CharacterListState>(
              builder: (context, state) {
                if ( state is CharacterListLoading ) {
                  return const Center(child: CircularProgressIndicator());
                } else if ( state is CharacterListLoaded) {
                  return _body(state);
                }  else if ( state is CharacterListError) {
                  return Center(child: Text('Error: ${state.message}'));
                } else {
                  return const Center(child: Text('No data available'));
                }
              },
            ),
          ],
        ),
      )
    );
  }

  Widget _body(CharacterListLoaded state) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 30,
          mainAxisSpacing: 30,
          childAspectRatio: 5/6
        ),
        itemCount: state.characters.length,
        itemBuilder: (BuildContext context, int index) {
          return _card(context, state, index);
        },
      ),
    );
  }

  Widget _card(BuildContext context, CharacterListLoaded state, int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey),
        color: Theme.of(context).highlightColor
      ),
      child: Column(
        children: [
          Flexible(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.network(
                state.characters[index].image,
                fit: BoxFit.fill,
                width: 300,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.characters[index].name,
                  style: const TextStyle(fontWeight: FontWeight.w600)
                ),
                Text(
                  '${state.characters[index].species} - ${state.characters[index].status}',
                  style: TextStyle(color: Colors.grey.shade500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}