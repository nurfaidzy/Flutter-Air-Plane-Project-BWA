import 'dart:convert';

import 'package:air_plane/models/places_model.dart';
import 'package:http/http.dart' as http;

const String host = "http://localhost:3000";

class PlacesService {
  Future<List<PlacesModel>> getPlaces() async {
    try {
      var response = await http.get(Uri.parse("$host/list"));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> data = json['data'];
        return data.map((e) => PlacesModel.fromJson(e)).toList();
      } else {
        throw Exception("Failed to load places");
      }
    } catch (e) {
      throw e;
    }
  }

  Future<PlacesModel> getPlaceById(int id) async {
    try {
      var response = await http.get(Uri.parse("$host/$id"));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        return PlacesModel.fromJsonDetail(json['data']);
      } else {
        throw Exception("Failed to load place");
      }
    } catch (e) {
      throw e;
    }
  }
}
