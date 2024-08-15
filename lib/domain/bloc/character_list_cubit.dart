// lib/cubits/character_list_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:buscador_rick_and_morty/domain/models/character_model.dart';
import 'package:buscador_rick_and_morty/domain/services/character_services.dart';
import 'package:meta/meta.dart';

class CharacterListCubit extends Cubit<CharacterListState> {
  final CharacterService _characterService;

  CharacterListCubit(this._characterService) : super(CharacterListInitial());

  Future<void> fetchCharactersByPage({int page = 1}) async {
    try {
      emit(CharacterListLoading());
      final characters = await _characterService.getCharactersByPage(page: page);
      if (characters != null) {
        emit(CharacterListLoaded(characters.results));
      } else {
        emit(CharacterListError("Error fetching character list"));
      }
    } catch (e) {
      emit(CharacterListError(e.toString()));
    }
  }

  Future<void> fetchCharactersByName({required String name}) async {
    try {
      emit(CharacterListLoading());
      final characters = await _characterService.getCharactersByName(name: name);
      if (characters != null) {
        emit(CharacterListLoaded(characters.results));
      } else {
        emit(CharacterListError("Error fetching character list"));
      }
    } catch (e) {
      emit(CharacterListError(e.toString()));
    }
  }
}

@immutable
abstract class CharacterListState {}

class CharacterListInitial extends CharacterListState {}

class CharacterListLoading extends CharacterListState {}

class CharacterListLoaded extends CharacterListState {
  final List<CharacterModel> characters;
  CharacterListLoaded(this.characters);
}

class CharacterListError extends CharacterListState {
  final String message;

  CharacterListError(this.message);
}
