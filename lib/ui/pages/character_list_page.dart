import 'package:buscador_rick_and_morty/domain/bloc/character_list_cubit.dart';
import 'package:buscador_rick_and_morty/domain/bloc/theme_cubit.dart';
import 'package:buscador_rick_and_morty/ui/pages/character_detail_page.dart';
import 'package:buscador_rick_and_morty/ui/widget/message_component.dart';
import 'package:buscador_rick_and_morty/ui/widget/search_component.dart';
import 'package:buscador_rick_and_morty/ui/widget/spinner_conponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';

class CharacterListPage extends StatefulWidget {
  const CharacterListPage({super.key});

  static String name = 'character_list_page';

  @override
  State<CharacterListPage> createState() => _CharacterListPageState();
}

class _CharacterListPageState extends State<CharacterListPage> {

  final TextEditingController _controller = TextEditingController();
  late ThemeCubit themeCubit;
  int page = 1;

  @override
  void initState() {
    themeCubit = context.read<ThemeCubit>();
    context.read<CharacterListCubit>().fetchCharacters();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
      body: _body(context)
    );
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          SearchComponent(
            hint: 'Buscar personaje',
            controller: _controller,
            onChanged: (value) async {
              await context.read<CharacterListCubit>().fetchCharacters(
                page: 1,
                name: _controller.text
              );
            }
          ),
          const SizedBox(height: 24),
          BlocBuilder<CharacterListCubit, CharacterListState>(
            builder: (context, state) {
              if ( state is CharacterListLoading ) {
                return const SpinnerComponent();
              } else if ( state is CharacterListLoaded) {
                return _gridCards(state);
              }  else if ( state is CharacterListError) {
                return Center(child: MessageComponent(
                  title: '¡Oh, Algo salió mal!',
                  message: state.message,
                  onRetry: () => context.read<CharacterListCubit>().fetchCharacters(
                    page: page,
                    name: _controller.text
                  )
                ));
              } else {
                return Center(child: MessageComponent(
                  title: '¡Oh, Algo salió mal!',
                  message: 'La data no se encuentra disponible',
                  onRetry: () => context.read<CharacterListCubit>().fetchCharacters(
                    page: page,
                    name: _controller.text
                  )
                ));
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _button(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        setState(() {
          page++;
        });
        await context.read<CharacterListCubit>().fetchCharacters(
          page: page,
          name: _controller.text
        );
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(24),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Theme.of(context).highlightColor)
        ),
        child: const Text('LOAD MORE', style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600
        )),
      ),
    );
  }

  Widget _gridCards(CharacterListLoaded state) {
    return Expanded(
      child: ListView(
        children: [
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 30,
              mainAxisSpacing: 30,
              childAspectRatio: 5/6
            ),
            itemCount: state.characters.results.length,
            itemBuilder: (BuildContext context, int index) {
              return _card(context, state, index);
            },
          ),
          state.characters.info.next != null
            ? _button(context)
            : const SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget _card(BuildContext context, CharacterListLoaded state, int index) {
    return GestureDetector(
      onTap: () => context.pushNamed(
        CharacterDetailPage.name,
        extra: state.characters.results[index].id
      ),
      child: Container(
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
                child: Hero(
                  tag: '${state.characters.results[index].id}',
                  child: Image.network(
                    state.characters.results[index].image,
                    fit: BoxFit.fill,
                    width: 300,
                  ),
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
                    state.characters.results[index].name,
                    style: const TextStyle(fontWeight: FontWeight.w600)
                  ),
                  Text(
                    '${state.characters.results[index].species} - ${state.characters.results[index].status}',
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}