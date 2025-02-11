import 'package:ahziyah_flutter/services/dio_client.dart';
import 'package:dio/dio.dart';

class HomeRepo {
  final DioClient dioClient;

  HomeRepo({required this.dioClient});

  Future<Response> home() async {
    return dioClient.getData(
      '/home',
    );
  }
}
