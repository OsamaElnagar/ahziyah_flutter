import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

IconData getCategoryIcon(String slug) {
  switch (slug.toLowerCase()) {
    case 'men':
      return IconlyLight.user;
    case 'women':
      return IconlyLight.user_1;
    case 'kids':
      return Icons.u_turn_left;
    case 'sports':
      return IconlyLight.activity;
    case 'casual':
      return IconlyLight.star;
    default:
      return IconlyLight.category;
  }
}
