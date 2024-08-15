// lib/cubits/character_list_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:buscador_rick_and_morty/domain/services/character_services.dart';
import 'package:meta/meta.dart';

class CharacterDetailCubit extends Cubit<CharacterDetailCubitState> {
  final CharacterService _characterService;

  CharacterDetailCubit(this._characterService) : super(CharacterDetailCubitInitial());

  Future<void> fetchCharactersByPage() async {
    try {
      emit(CharacterDetailCubitLoading());
      final characters = await _characterService.getCharactersByPage();
      if (characters != null) {
        emit(CharacterDetailCubitLoaded(characters.results));
      } else {
        emit(CharacterDetailCubitError("Error fetching character list"));
      }
    } catch (e) {
      emit(CharacterDetailCubitError(e.toString()));
    }
  }

  Future<void> fetchCharactersByName({required String name}) async {
    try {
      emit(CharacterDetailCubitLoading());
      final characters = await _characterService.getCharactersByName(name: name);
      if (characters != null) {
        emit(CharacterDetailCubitLoaded(characters.results));
      } else {
        emit(CharacterDetailCubitError("Error fetching character list"));
      }
    } catch (e) {
      emit(CharacterDetailCubitError(e.toString()));
    }
  }
}

@immutable
abstract class CharacterDetailCubitState {}

class CharacterDetailCubitInitial extends CharacterDetailCubitState {}

class CharacterDetailCubitLoading extends CharacterDetailCubitState {}

class CharacterDetailCubitLoaded extends CharacterDetailCubitState {
  final List<dynamic> characters;
  CharacterDetailCubitLoaded(this.characters);
}

class CharacterDetailCubitError extends CharacterDetailCubitState {
  final String message;

  CharacterDetailCubitError(this.message);
}
