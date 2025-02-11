import 'package:ahziyah_flutter/features/home/model/home_response.dart';

class Order {
  final int id;
  final String totalAmount;
  final String status;
  final String shippingAddress;
  final String paymentMethod;
  final String createdAt;
  final String updatedAt;
  final List<OrderItem> items;
  final Payment payment;

  Order({
    required this.id,
    required this.totalAmount,
    required this.status,
    required this.shippingAddress,
    required this.paymentMethod,
    required this.createdAt,
    required this.updatedAt,
    required this.items,
    required this.payment,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      totalAmount: json['total_amount'],
      status: json['status'],
      shippingAddress: json['shipping_address'],
      paymentMethod: json['payment_method'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      items: (json['items'] as List)
          .map((item) => OrderItem.fromJson(item))
          .toList(),
      payment: Payment.fromJson(json['payment']),
    );
  }
}

class OrderItem {
  final int id;
  final int productId;
  final int quantity;
  final String price;
  final Product product;

  OrderItem({
    required this.id,
    required this.productId,
    required this.quantity,
    required this.price,
    required this.product,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      id: json['id'],
      productId: json['product_id'],
      quantity: json['quantity'],
      price: json['price'],
      product: Product.fromJson(json['product']),
    );
  }
}

class Payment {
  final int id;
  final int orderId;
  final String paymentMethod;
  final String amount;
  final String paymentStatus;
  final String transactionReference;

  Payment({
    required this.id,
    required this.orderId,
    required this.paymentMethod,
    required this.amount,
    required this.paymentStatus,
    required this.transactionReference,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      id: json['id'],
      orderId: json['order_id'],
      paymentMethod: json['payment_method'],
      amount: json['amount'],
      paymentStatus: json['payment_status'],
      transactionReference: json['transaction_reference'],
    );
  }
}
