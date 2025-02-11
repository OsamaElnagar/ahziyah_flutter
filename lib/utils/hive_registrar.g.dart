import 'package:hive_ce/hive.dart';
import 'package:ahziyah_flutter/features/authentication/model/user_response.dart';
import 'package:ahziyah_flutter/features/wishlist/model/wishlist_shoes.dart';

extension HiveRegistrar on HiveInterface {
  void registerAdapters() {
    registerAdapter(UserAdapter());
    registerAdapter(UserResponseAdapter());
    registerAdapter(WishlistShoesModelAdapter());
  }
}
