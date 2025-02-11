import 'package:ahziyah_flutter/features/discover/view/discover_page.dart';
import 'package:ahziyah_flutter/features/home/view/home_page.dart';
import 'package:ahziyah_flutter/features/profile/view/profile_page.dart';
import 'package:ahziyah_flutter/features/wishlist/view/wishlist_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LayoutController extends GetxController {
  static LayoutController instance({String? tag}) =>
      Get.find<LayoutController>(tag: tag);

  final _currentIndex = 0.obs;
  int get currentIndex => _currentIndex.value;

  final _routes = <Widget>[
    const HomePage(),
    WishlistPage(),
    DiscoverPage(),
    ProfilePage(),
  ].obs;
  Widget get routes => _routes[_currentIndex.value];

  void handleIndexChanged(int i) {
    _currentIndex.value = i;
  }
}
