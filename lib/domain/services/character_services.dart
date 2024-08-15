// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:buscador_rick_and_morty/domain/models/character_model.dart';
import 'package:buscador_rick_and_morty/domain/models/response_model.dart';
import 'package:buscador_rick_and_morty/infraestruture/constants.dart';
import 'package:dio/dio.dart';

class CharacterService {
  final dio = Dio();

  final String URL = '${Constants.URL_SERVICES}/character';

  Future<ResponseModel?> fetchCharacters({int page = 1, String name =''}) async {
    try {
      final response = await dio.get(URL, queryParameters: { 'page': page , 'name': name });
      return ResponseModel.fromJson(response.data);
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  Future<CharacterModel?> fetchCharactersByID({required int id}) async {
    try {
      final response = await dio.get('$URL/$id');
      return CharacterModel.fromJson(response.data);
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}