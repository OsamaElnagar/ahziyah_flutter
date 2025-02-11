import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_ce/hive.dart';

import '../../features/authentication/model/user_response.dart';
import '../../features/authentication/service/user_hive_service.dart';
import '../../models/language_model.dart';
import '../../services/dio_client.dart';
import '../../services/notification_service.dart';
import '../../services/payments/payment_service_interface.dart';
import '../../services/payments/paymob_service.dart';
import '../../utils/app_constants.dart';
import '../../features/checkout/service/cart_service.dart';

class DependencyInjection {
  ///The following methods will be called before GetMaterialApp.
  ///IT is responsible for loading some dependencies before the app starts.
  static Future<void> initialize() async {
    final userBox = await Hive.openBox<UserResponse>('userBox');

    Get.put(UserHiveService(userBox), permanent: true);

    Get.put(
      DioClient(
        appBaseUrl: GetPlatform.isAndroid || GetPlatform.isMobile
            ? AppConstants.realApiUrl
            : AppConstants.apiUrl,
      ),
    );

    Get.put<PaymentServiceInterface>(
      PaymobService()..initialize(),
      //permanent: true,
    );

    Get.put(
      NotificationService(
        handlers: [],
      ),
      permanent: true,
    );

    final cartBox = await Hive.openBox('cartBox');

    Get.put(
      CartService(cartBox),
    );
  }

  static Future<Map<String, Map<String, String>>> initializeLanguages() async {
    Map<String, Map<String, String>> languages = {};
    for (LanguageModel languageModel in AppConstants.languages) {
      String jsonStringValues = await rootBundle
          .loadString('assets/language/${languageModel.languageCode}.json');
      Map<String, dynamic> mappedJson = json.decode(jsonStringValues);
      Map<String, String> jsonValue = {};
      mappedJson.forEach((key, value) {
        jsonValue[key] = value.toString();
      });
      languages['${languageModel.languageCode}_${languageModel.countryCode}'] =
          jsonValue;
    }
    return languages;
  }
}
