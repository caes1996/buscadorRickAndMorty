// lib/cubits/character_list_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:buscador_rick_and_morty/domain/models/character_model.dart';
import 'package:buscador_rick_and_morty/domain/services/character_services.dart';
import 'package:meta/meta.dart';

class CharacterDetailCubit extends Cubit<CharacterDetailCubitState> {
  final CharacterService _characterService;

  CharacterDetailCubit(this._characterService) : super(CharacterDetailCubitInitial());

  Future<void> fetchCharactersByID({required int id}) async {
    try {
      emit(CharacterDetailCubitLoading());
      final character = await _characterService.fetchCharactersByID(id: id);
      if (character != null) {
        emit(CharacterDetailCubitLoaded(character));
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
  final CharacterModel character;
  CharacterDetailCubitLoaded(this.character);
}

class CharacterDetailCubitError extends CharacterDetailCubitState {
  final String message;

  CharacterDetailCubitError(this.message);
}
