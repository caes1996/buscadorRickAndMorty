import 'package:buscador_rick_and_morty/domain/bloc/character_list_cubit.dart';
import 'package:buscador_rick_and_morty/domain/models/character_model.dart';
import 'package:buscador_rick_and_morty/domain/models/info_response_model.dart';
import 'package:buscador_rick_and_morty/domain/models/location_model.dart';
import 'package:buscador_rick_and_morty/domain/models/response_model.dart';
import 'package:buscador_rick_and_morty/domain/services/character_services.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';

class MockCharacterService extends Mock implements CharacterService {}

void main() {
  late MockCharacterService mockCharacterService;

  setUp(() {
    mockCharacterService = MockCharacterService();
  });

  group('CharacterListCubit', () {
    blocTest<CharacterListCubit, CharacterListState>(
      'emits [CharacterListLoading, CharacterListLoaded] when loadCharacters succeeds',
      build: () {
        when(() => mockCharacterService.fetchCharacters(name: 'Abadango'))
            .thenAnswer((_) async => ResponseModel(info: InfoResponseModel(
              count: 1, pages: 1
            ), results: [
              CharacterModel(
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
              )
            ]));
        return CharacterListCubit(mockCharacterService);
      },
      act: (cubit) => cubit.fetchCharacters(name: 'Abadango'),
      expect: () => [
        isA<CharacterListLoading>(),
        isA<CharacterListLoaded>()
          .having((state) => state.characters.info.count, 'count', equals(1)),
      ],
    );

  });
}
