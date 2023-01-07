import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:youtap/model/movie_model.dart';
import 'package:youtap/services/apireturnvalue.dart';

class MovieService {
  Future<ApiReturnValue> getUpcomingMovie() async {
    try {
      final _response = await http.get(
        Uri.parse('https://api.themoviedb.org/3/movie/upcoming?api_key=3272b06225d9ae1cad71e8de9c2e1682'),
      );

      return ApiReturnValue(
          status: 1,
          value: Movie.fromJson(jsonDecode(_response.body)),
          message: "Successfully retrieved data");
    } catch (e) {
      return ApiReturnValue(
          status: 0,
          value: e.toString(),
          message: "Error : Failed to retrieved data");
    }
  }

  Future<ApiReturnValue> getNowPlayingMovie() async {
    try {
      final _response = await http.get(
        Uri.parse('https://api.themoviedb.org/3/movie/now_playing?api_key=3272b06225d9ae1cad71e8de9c2e1682'),
      );

      return ApiReturnValue(
          status: 1,
          value: Movie.fromJson(jsonDecode(_response.body)),
          message: "Successfully retrieved data");
    } catch (e) {
      return ApiReturnValue(
          status: 0,
          value: e.toString(),
          message: "Error : Failed to retrieved data");
    }
  }

  Future<ApiReturnValue> getPopularMovie() async {
    try {
      final _response = await http.get(
        Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=3272b06225d9ae1cad71e8de9c2e1682'),
      );

      return ApiReturnValue(
          status: 1,
          value: Movie.fromJson(jsonDecode(_response.body)),
          message: "Successfully retrieved data");
    } catch (e) {
      return ApiReturnValue(
          status: 0,
          value: e.toString(),
          message: "Error : Failed to retrieved data");
    }
  }

  Future<ApiReturnValue> getDetailMovie(int id) async {
    try {
      final _response = await http.get(
        Uri.parse('https://api.themoviedb.org/3/movie/${id}/reviews?api_key=3272b06225d9ae1cad71e8de9c2e1682'),
      );

      return ApiReturnValue(
          status: 1,
          value: Movie.fromJson(jsonDecode(_response.body)),
          message: "Successfully retrieved data");
    } catch (e) {
      return ApiReturnValue(
          status: 0,
          value: e.toString(),
          message: "Error : Failed to retrieved data");
    }
  }
}