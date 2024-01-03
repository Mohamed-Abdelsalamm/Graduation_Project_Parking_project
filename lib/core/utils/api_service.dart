import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = "https://lanego-fa06e23094fa.herokuapp.com/";
  // static const apiKey = "202312345PSV";
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get(
      {required String endPoint,
      Map<String, dynamic>? queryParameters,
      Object? data}) async {
    Response response = await _dio.get(
      "$_baseUrl$endPoint",
      queryParameters: queryParameters,
      data: data,
    );
    return response.data;
  }

  Future<Map<String, dynamic>> post(
      {required String endPoint, required Map<String, dynamic> data}) async {
    var response = await _dio.post("$_baseUrl$endPoint", data: data);
    return response.data;
  }

  Future<Map<String, dynamic>> postImage(
      {required String endPoint, required Object? data}) async {
    var response = await _dio.post("$_baseUrl$endPoint", data: data);
    return response.data;
  }

  Future<Map<String, dynamic>> delete(
      {required String endPoint, required Map<String, dynamic> data}) async {
    var response = await _dio.delete(
      "$_baseUrl$endPoint",
      queryParameters: data,
      options: Options(
          // headers: {'api_key': '202312345PSV'},
          ),
    );
    return response.data;
  }
}
