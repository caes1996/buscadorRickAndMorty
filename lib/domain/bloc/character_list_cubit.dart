// lib/cubits/character_list_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:buscador_rick_and_morty/domain/models/response_model.dart';
import 'package:buscador_rick_and_morty/domain/services/character_services.dart';
import 'package:meta/meta.dart';

class CharacterListCubit extends Cubit<CharacterListState> {
  final CharacterService _characterService;

  CharacterListCubit(this._characterService) : super(CharacterListInitial());

  Future<void> fetchCharacters({int page = 1, String name = ''}) async {
    try {
      emit(CharacterListLoading());
      final characters = await _characterService.fetchCharacters(page: page, name: name);
      if (characters != null) {
        emit(CharacterListLoaded(characters));
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
  final ResponseModel characters;
  CharacterListLoaded(this.characters);
}

class CharacterListError extends CharacterListState {
  final String message;

  CharacterListError(this.message);
}
