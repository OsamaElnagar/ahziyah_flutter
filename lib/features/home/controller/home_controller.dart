import 'package:ahziyah_flutter/features/home/model/home_response.dart';
import 'package:ahziyah_flutter/features/home/repo/home_repo.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:pretty_logger/pretty_logger.dart';

class HomeController extends GetxController {
  final HomeRepo repo;

  HomeController({required this.repo});

  final Rx<HomeData?> homeData = Rx<HomeData?>(null);
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    loadHome();
    super.onInit();
  }

  Future<void> loadHome() async {
    try {
      isLoading.value = true;
      Response response = await repo.home();

      if (response.statusCode == 200) {
        final homeResponse = HomeResponse.fromJson(response.data);
        homeData.value = homeResponse.data;
      } else {
        PLog.error('Something went wrong!');
      }
    } catch (e) {
      PLog.error('Error loading home data: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
