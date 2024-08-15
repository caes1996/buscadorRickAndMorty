import 'package:buscador_rick_and_morty/domain/bloc/character_detail_cubit.dart';
import 'package:buscador_rick_and_morty/domain/models/character_model.dart';
import 'package:buscador_rick_and_morty/domain/models/location_model.dart';
import 'package:buscador_rick_and_morty/domain/services/character_services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCharacterService extends Mock implements CharacterService {}

void main() {
  late MockCharacterService mockCharacterService;

  setUp(() {
    mockCharacterService = MockCharacterService();
  });

  group('CharacterDetailCubit', () {
    blocTest<CharacterDetailCubit, CharacterDetailCubitState>(
      'emits [CharacterDetailLoading, CharacterDetailLoaded] when loadCharacterDetail succeeds',
      build: () {
        when(() => mockCharacterService.fetchCharactersByID(id: 6))
            .thenAnswer((_) async => CharacterModel(
              id: 6,
                name: 'Abadango Cluster Princess', 
                status: 'Alive', 
                species: 'Alien', 
                type: '', 
                gender: 'Female', 
                origin: Location(name: 'Abadango', url: 'https://rickandmortyapi.com/api/location/2'),
                location: Location(name: 'Abadango', url: 'https://rickandmortyapi.com/api/location/2'),
                image: 'https://rickandmortyapi.com/api/character/avatar/6.jpeg', 
                episode: ['https://rickandmortyapi.com/api/episode/27'], 
                url: 'https://rickandmortyapi.com/api/character/6',
                created: DateTime.parse('2017-11-04T19:50:28.250Z')
            ));
        return CharacterDetailCubit(mockCharacterService);
      },
      act: (cubit) => cubit.fetchCharactersByID(id: 6),
      expect: () => [
        isA<CharacterDetailCubitLoading>(),
        isA<CharacterDetailCubitLoaded>()
          .having((state) => state.character.name, 'name', equals('Abadango Cluster Princess')),
      ],
    );

  });
}
