
import 'package:buscador_rick_and_morty/app/app.dart';
import 'package:buscador_rick_and_morty/domain/bloc/character_detail_cubit.dart';
import 'package:buscador_rick_and_morty/domain/bloc/character_list_cubit.dart';
import 'package:buscador_rick_and_morty/domain/bloc/theme_cubit.dart';
import 'package:buscador_rick_and_morty/domain/services/character_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {

  final CharacterService characterService = CharacterService();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(create: (_) => CharacterListCubit(characterService, )),
        BlocProvider(create: (_) => CharacterDetailCubit(characterService)),
      ],
      child: const RickAndMortyApp()
    )
  );
}