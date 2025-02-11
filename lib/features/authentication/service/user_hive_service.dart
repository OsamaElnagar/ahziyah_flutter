import 'package:get/get.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import '../model/user_response.dart';

class UserHiveService {
  final Box<UserResponse> userBox;

  UserHiveService(this.userBox);

  static UserHiveService instance() => Get.find<UserHiveService>();

  Future<UserResponse> saveUser(UserResponse userResponse) async {
    await userBox.put('user', userResponse);
    return userResponse;
  }

  Future<UserResponse> updateUser(User user) async {
    final existingResponse = getUser();
    if (existingResponse == null) {
      throw Exception('No user data found');
    }

    final updatedResponse = existingResponse.copyWith(user: user);
    await userBox.put('user', updatedResponse);
    return updatedResponse;
  }

  UserResponse? getUser() {
    return userBox.get('user');
  }

  Future<void> clearUser() async {
    await userBox.delete('user');
  }

  bool hasUser() {
    return userBox.get('user') != null;
  }

  bool hasAvatar() {
    final String avatar = getUser()?.user.avatar ?? '';
    return avatar.isNotEmpty;
  }
}
