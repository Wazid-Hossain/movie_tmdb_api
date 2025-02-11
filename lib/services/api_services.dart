import 'dart:convert';

import 'package:http/http.dart';
import 'package:movie_tmdb_api/constant/constants.dart';
import 'package:movie_tmdb_api/model/movie_model.dart';

enum MovieType { popular, nowPlaying, topRated, latest, upcoming }

class ApiServices {
  Future<List<MovieModel>> getMovieData(MovieType type) async {
    String url = "";

    if (type == MovieType.popular) {
      url = kmovieURL + kpopural;
    } else if (type == MovieType.popular) {
      url = kmovieURL + kpopural;
    } else if (type == MovieType.nowPlaying) {
      url = kmovieURL + know_playing;
    } else if (type == MovieType.topRated) {
      url = kmovieURL + ktop_rated;
    } else if (type == MovieType.latest) {
      url = kmovieURL + klatest;
    } else if (type == MovieType.upcoming) {
      url = kmovieURL + kupcoming;
    }

    try {
      Response response = await get(
          // to get orther part of api link
          Uri.parse(url + "?api_key=0f413ac709b58218bbffe640cc324dd0"));

      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json['results'];
        List<MovieModel> movielist =
            body.map((item) => MovieModel.fromJson(item)).toList();

        return movielist;
      } else {
        throw ("Movie Not Found");
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
