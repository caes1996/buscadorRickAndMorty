import 'package:buscador_rick_and_morty/domain/models/info_response_model.dart';
import 'package:buscador_rick_and_morty/domain/models/character_model.dart';

class ResponseModel {
    InfoResponseModel info;
    List<CharacterModel> results;

    ResponseModel({
        required this.info,
        required this.results,
    });

    factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        info: InfoResponseModel.fromJson(json["info"]),
        results: List<CharacterModel>.from(json["results"].map((x) => CharacterModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "info": info.toJson(),
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}









