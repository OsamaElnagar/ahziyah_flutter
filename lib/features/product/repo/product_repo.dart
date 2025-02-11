import 'package:ahziyah_flutter/services/dio_client.dart';
import 'package:dio/dio.dart';

class ProductRepo {
  final DioClient dioClient;

  ProductRepo({required this.dioClient});

  Future<Response> getProduct(String slug) async {
    return dioClient.getData('/products/$slug');
  }
}
