import 'package:ahziyah_flutter/features/order/model/order.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:pretty_logger/pretty_logger.dart';
import '../repo/order_repo.dart';

class OrderController extends GetxController {
  final OrderRepo orderRepo;

  OrderController({required this.orderRepo});

  var orders = <Order>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchOrders();
    super.onInit();
  }

  Future<void> fetchOrders() async {
    isLoading.value = true;
    try {
      final Response response = await orderRepo.fetchOrders();
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'];
        orders.value = data.map((json) => Order.fromJson(json)).toList();
      }
    } catch (e) {
      PLog.error('Error fetching orders: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Order? getOrderById(int id) {
    try {
      return orders.firstWhere((order) => order.id == id);
    } catch (e) {
      return null;
    }
  }
}
