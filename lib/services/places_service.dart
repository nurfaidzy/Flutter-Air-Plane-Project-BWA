import 'dart:convert';

import 'package:air_plane/models/places_model.dart';
import 'package:http/http.dart' as http;

class PlacesService {
  final String host = "http://localhost:3000";
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
}
