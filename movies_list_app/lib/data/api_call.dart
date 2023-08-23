import 'dart:convert';
import 'package:movies_list_app/data/movies_model.dart';
import 'package:http/http.dart' as http;

class MovieApiCall {
  Future<Movie> movieApiCall() async {
    final request = await http.get(
        Uri.parse('https://jellyseerr.alsahli.cloud/api/v1/discover/movies'),
        headers: {'accept': 'application/json', 'X-Api-Key': ''});
    final decodeJson = json.decode(request.body);
    final result = Movie.fromJson(decodeJson);
    return result;
  }
}
