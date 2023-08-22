import 'dart:convert';
import 'package:movies_list_app/data/movies_model.dart';
import 'package:http/http.dart' as http;

class MovieApiCall {
  Future<Movies> movieApiCall() async {
    final request = await http.get(
        Uri.parse('https://jellyseerr.alsahli.cloud/api/v1/discover/movies'));
    final decodeJson = json.decode(request.body);
    final result = Movies.fromJson(decodeJson);
    return result;
  }
}
