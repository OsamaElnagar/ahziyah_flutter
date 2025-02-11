import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/order_controller.dart';
import '../widgets/order_timeline.dart';
import 'package:cached_network_image/cached_network_image.dart';

class OrderDetailsPage extends StatelessWidget {
  final int orderId;

  const OrderDetailsPage({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    final OrderController orderController = Get.find();

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text("Order #$orderId"),
      ),
      body: Obx(() {
        final order = orderController.getOrderById(orderId);
        if (order == null) {
          return Center(child: Text("Order not found."));
        }

        return DefaultTabController(
          length: 2,
          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: TabBar(
                  tabs: [
                    Tab(text: "Track Order"),
                    Tab(text: "Details"),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    // Track Order Tab
                    SingleChildScrollView(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: OrderTimeline(status: order.status),
                          ),
                        ],
                      ),
                    ),
                    // Details Tab
                    SingleChildScrollView(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          // Products
                          _buildSection(
                            "Products",
                            Column(
                              children: order.items
                                  .map((item) => _buildProductItem(item))
                                  .toList(),
                            ),
                          ),
                          SizedBox(height: 16),
                          // Shipping Address
                          _buildSection(
                            "Shipping Address",
                            Text(order.shippingAddress),
                          ),
                          SizedBox(height: 16),
                          // Payment Info
                          _buildSection(
                            "Payment Information",
                            Column(
                              children: [
                                _buildPaymentRow("Method",
                                    order.paymentMethod.toUpperCase()),
                                _buildPaymentRow(
                                    "Status",
                                    order.payment.paymentStatus
                                        .capitalizeFirst!),
                                _buildPaymentRow(
                                    "Total Amount", "\$${order.totalAmount}"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildSection(String title, Widget content) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          content,
        ],
      ),
    );
  }

  Widget _buildProductItem(dynamic item) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: item.product.images.primary,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.product.name,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Quantity: ${item.quantity}",
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 4),
                Text(
                  "\$${item.price}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Colors.grey)),
          Text(value, style: TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
