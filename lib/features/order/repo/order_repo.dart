import 'package:ahziyah_flutter/services/dio_client.dart';
import 'package:dio/dio.dart';

class OrderRepo {
  final DioClient dio;

  OrderRepo({required this.dio});

  Future<Response> fetchOrders() async {
    return await dio.getData('/orders');
  }

  Future<Response> createOrder(order) async {
    return await dio.postData('/orders', order);
  }
}
