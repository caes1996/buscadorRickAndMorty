// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:buscador_rick_and_morty/domain/models/response_model.dart';
import 'package:buscador_rick_and_morty/infraestruture/constants.dart';
import 'package:dio/dio.dart';

class CharacterService {
  final dio = Dio();

  final String URL = '${Constants.URL_SERVICES}/character';

  Future<ResponseModel?> getCharactersByPage({int page = 1}) async {
    try {
      final response = await dio.get(URL, queryParameters: { 'page': page });
      return ResponseModel.fromJson(response.data);
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  Future<ResponseModel?> getCharactersByName({required String name}) async {
    try {
      final response = await dio.get(URL, queryParameters: { 'name': name });
      return ResponseModel.fromJson(response.data);
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}