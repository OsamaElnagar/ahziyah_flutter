import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:ahziyah_flutter/components/custom_snackbar.dart';
import 'package:ahziyah_flutter/core/helpers/route_helper.dart';
import 'package:ahziyah_flutter/features/authentication/controller/auth_controller.dart';

class ApiChecker {
  static void checkApi(Response response) {
    log("CheckApi >>>> StatusCode is: ${response.statusCode}");

    if (response.statusCode == 401) {
      Get.find<AuthController>().clearUserResponse();
      if (Get.currentRoute != RouteHelper.getSignInRoute()) {
        Get.offAllNamed(RouteHelper.getSignInRoute());
        customSnackBar("${response.statusCode!}".tr);
      }
    } else if (response.statusCode == 500) {
      customSnackBar("${response.statusCode!}".tr);
    } else {
      //customSnackBar("${response.body['message']}");
    }
  }
}
