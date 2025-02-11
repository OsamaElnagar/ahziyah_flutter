import 'package:ahziyah_flutter/services/dio_client.dart';
import 'package:dio/dio.dart';

class WishlistRepository {
  final DioClient dioClient;
  WishlistRepository({required this.dioClient});

  Future<Response> fetchWishlist() async {
    final response = await dioClient.getData('/wishlist');
    return response;
  }
}
