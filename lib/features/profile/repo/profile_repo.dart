import 'package:ahziyah_flutter/services/dio_client.dart';
import 'package:dio/dio.dart';

class ProfileRepo {
  final DioClient dioClient;

  ProfileRepo({required this.dioClient});

  Future<Response> getUserProfile() async {
    return dioClient.getData('/user');
  }
}
