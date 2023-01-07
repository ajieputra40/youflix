import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:youtap/model/tv_model.dart';
import 'package:youtap/services/apireturnvalue.dart';

class TvService {
  Future<ApiReturnValue> getOtaTv() async {
    try {
      final _response = await http.get(
        Uri.parse('https://api.themoviedb.org/3/tv/on_the_air?api_key=3272b06225d9ae1cad71e8de9c2e1682'),
      );

      return ApiReturnValue(
          status: 1,
          value: Tv.fromJson(jsonDecode(_response.body)),
          message: "Successfully retrieved data");
    } catch (e) {
      return ApiReturnValue(
          status: 0,
          value: e.toString(),
          message: "Error : Failed to retrieved data");
    }
  }

  Future<ApiReturnValue> getPopularTv() async {
    try {
      final _response = await http.get(
        Uri.parse('https://api.themoviedb.org/3/tv/popular?api_key=3272b06225d9ae1cad71e8de9c2e1682'),
      );

      return ApiReturnValue(
          status: 1,
          value: Tv.fromJson(jsonDecode(_response.body)),
          message: "Successfully retrieved data");
    } catch (e) {
      return ApiReturnValue(
          status: 0,
          value: e.toString(),
          message: "Error : Failed to retrieved data");
    }
  }

  Future<ApiReturnValue> getDetailTv(int id) async {
    try {
      final _response = await http.get(
        Uri.parse('https://api.themoviedb.org/3/tv/${id}/reviews?api_key=3272b06225d9ae1cad71e8de9c2e1682'),
      );

      return ApiReturnValue(
          status: 1,
          value: Tv.fromJson(jsonDecode(_response.body)),
          message: "Successfully retrieved data");
    } catch (e) {
      return ApiReturnValue(
          status: 0,
          value: e.toString(),
          message: "Error : Failed to retrieved data");
    }
  }
}