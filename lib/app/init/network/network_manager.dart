import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:intesasoft_demo/views/home/home_model.dart';

class NetworkManager {
  static final NetworkManager _instance = NetworkManager._init();

  late Dio _service;
  static NetworkManager get instance => _instance;

  NetworkManager._init() {
    _service = Dio();
  }

  Future<List<HomeModel>> getCities({required String url}) async {
    try {
      final res = await _service.get(
        url,
      );
      return (res.data as List).map((x) => HomeModel.fromJson(x)).toList();
    } on DioError {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getCity({required String url}) async {
    log(url);
    try {
      final res = await _service.get(
        url,
      );
      log(res.data.toString());
      return jsonDecode(res.toString());
    } on DioError {
      rethrow;
    }
  }
}
