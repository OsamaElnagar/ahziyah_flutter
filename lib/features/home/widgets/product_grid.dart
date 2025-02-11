import 'package:ahziyah_flutter/features/home/model/home_response.dart';
import 'package:flutter/material.dart';

import 'product_card.dart';

class ProductGrid extends StatelessWidget {
  final String title;
  final List<Product> products;
  final String badgeText;
  final Color badgeColor;

  const ProductGrid({
    super.key,
    required this.title,
    required this.products,
    required this.badgeText,
    required this.badgeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        spacing: 24,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 220,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductCard(
                  product: products[index],
                  badgeText: badgeText,
                  badgeColor: badgeColor,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
