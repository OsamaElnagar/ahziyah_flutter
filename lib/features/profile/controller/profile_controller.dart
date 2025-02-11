import 'package:get/get.dart';
import '../../authentication/model/user_response.dart';
import '../repo/profile_repo.dart';

class ProfileController extends GetxController {
  final ProfileRepo repository;

  ProfileController({required this.repository});

  final Rxn<User> user = Rxn<User>();
  final RxBool isLoading = false.obs;

  Future<void> fetchUserProfile() async {
    try {
      isLoading.value = true;
      final response = await repository.getUserProfile();
      user.value = User.fromJson(response.data['data']);
    } catch (e) {
      Get.snackbar('Error', 'Failed to load profile');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    try {
      // await repository.logout();
      Get.offAllNamed('/login');
    } catch (e) {
      Get.snackbar('Error', 'Failed to logout');
    }
  }

  Future<void> deleteAccount() async {
    try {
      // await repository.deleteAccount();
      Get.offAllNamed('/login');
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete account');
    }
  }
}
