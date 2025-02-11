import 'package:ahziyah_flutter/services/dio_client.dart';
import 'package:dio/dio.dart';
import '../service/cart_service.dart';
import '../../authentication/service/user_hive_service.dart';

class CheckoutRepository {
  final DioClient dioClient;
  final CartService cartService;
  final UserHiveService userService;

  CheckoutRepository({
    required this.dioClient,
    required this.cartService,
    required this.userService,
  });

  Map<String, dynamic> _addSessionId(Map<String, dynamic>? params) {
    if (userService.hasUser()) return params ?? {};

    final Map<String, dynamic> newParams = Map.from(params ?? {});
    newParams['session_id'] = cartService.sessionId;
    return newParams;
  }

  Future<Response> getCart() async {
    return dioClient.getData(
      '/cart',
      queryParameters: _addSessionId(null),
    );
  }

  Future<Response> addToCart(Map<String, dynamic> data) async {
    return dioClient.postData(
      '/cart/add?session_id=${cartService.sessionId}',
      _addSessionId(data),
    );
  }

  Future<Response> updateQuantity(int cartItemId, int quantity) async {
    return dioClient.putData(
      '/cart/items/$cartItemId?session_id=${cartService.sessionId}',
      _addSessionId({'quantity': quantity}),
    );
  }

  Future<Response> removeItem(int cartItemId) async {
    return dioClient.deleteData(
      '/cart/items/$cartItemId?session_id=${cartService.sessionId}',
    );
  }
}
