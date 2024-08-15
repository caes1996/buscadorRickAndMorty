import 'package:buscador_rick_and_morty/domain/bloc/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:buscador_rick_and_morty/config/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RickAndMortyApp extends StatefulWidget {
  const RickAndMortyApp({super.key});

  @override
  State<RickAndMortyApp> createState() => _RickAndMortyAppState();
}

class _RickAndMortyAppState extends State<RickAndMortyApp> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (context, theme) {
        return MaterialApp.router(
          theme: theme,
          darkTheme: ThemeData.dark(),
          themeMode: Theme.of(context).brightness == Brightness.dark
            ? ThemeMode.dark
            : ThemeMode.light,
          debugShowCheckedModeBanner: false,
          title: 'Buscador Rick and Morty',
          routerConfig: appRouter,
        );
      }
    );
  }
}