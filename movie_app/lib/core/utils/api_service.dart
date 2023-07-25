import 'package:dio/dio.dart';

class ApiService {
  static const baseImageW200 = "https://image.tmdb.org/t/p/w200";
  static const baseImageW92 = "https://image.tmdb.org/t/p/w92";
  final _baseUrl = "https://api.themoviedb.org/3/";
  final accessToken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3M2ZlMmI4YjMxMDdjZjJmNGYyOTk2MmI5MTYzYmI0NyIsInN1YiI6IjY0YmQ4YzhiZWI3OWMyMDExYzI1YTU0MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.S0X1FjtcUvufqkEukOaD-rERp8XsAlNrTLlhvrFiFbE";
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endpoint}) async {
    var response = await _dio.get('$_baseUrl$endpoint',
        options: Options(headers: {
          "Authorization": "Bearer $accessToken",
          "accept": "application/json",
        }));

    return response.data;
  }
}
