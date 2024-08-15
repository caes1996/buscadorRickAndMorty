import 'package:buscador_rick_and_morty/domain/bloc/character_detail_cubit.dart';
import 'package:buscador_rick_and_morty/domain/bloc/theme_cubit.dart';
import 'package:buscador_rick_and_morty/ui/widget/message_component.dart';
import 'package:buscador_rick_and_morty/ui/widget/spinner_conponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class CharacterDetailPage extends StatefulWidget {
  const CharacterDetailPage({super.key, required this.id});

  static String name = 'character_detail_page';

  final int id;

  @override
  State<CharacterDetailPage> createState() => _CharacterDetailPageState();
}

class _CharacterDetailPageState extends State<CharacterDetailPage> {


  late ThemeCubit themeCubit;

  @override
  void initState() {
    themeCubit = context.read<ThemeCubit>();
    context.read<CharacterDetailCubit>().fetchCharactersByID(id: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles de persionaje'),
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
      body: _body(),
    );
  }

  Widget _body() {
    return BlocBuilder<CharacterDetailCubit, CharacterDetailCubitState>(
      builder: (context, state) {
        if ( state is CharacterDetailCubitLoading ) {
          return const SpinnerComponent();
        } else if ( state is CharacterDetailCubitLoaded) {
          return _details(state);
        }  else if ( state is CharacterDetailCubitError) {
          return Center(child: MessageComponent(
            title: '¡Oh, Algo salió mal!',
            message: state.message,
            onRetry: () => context.read<CharacterDetailCubit>().fetchCharactersByID(id: widget.id)
          ));
        } else {
          return Center(child: MessageComponent(
            title: '¡Oh, Algo salió mal!',
            message: 'La data no se encuentra disponible',
            onRetry: () => context.read<CharacterDetailCubit>().fetchCharactersByID(id: widget.id)
          ));
        }
      },
    );
  }

  Widget _details(CharacterDetailCubitLoaded state) {
    return Expanded(
      child: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.4,
            child: Hero(
              tag: '${widget.id}',
              child: Image.network(
                state.character.image,
                fit: BoxFit.cover,
              )
            ),
          ),
          _dataItem('Nombre:', state.character.name),
          _dataItem('Estado:', state.character.status),
          _dataItem('Especie:', state.character.species),
          _dataItem('Género:', state.character.gender),
          _dataItem('Origen:', state.character.origin.name),
          _dataItem('Ubicación Actual:', state.character.location.name),
        ],
      ),
    );
  }

  Padding _dataItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            child: Text(label, style: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.w600
          ))),
          Text(value, style: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.w400
          )),
        ],
      ),
    );
  }
}