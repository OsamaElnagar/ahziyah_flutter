import 'package:ahziyah_flutter/features/authentication/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helpers/route_helper.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final authController = Get.find<AuthController>();
    // If the user is not logged in and the route is not public, redirect to login
    if (!authController.isLoggedIn() && !isPublicRoute(route)) {
      return RouteSettings(name: RouteHelper.getSignInRoute());
    }
    return null;
  }

  bool isPublicRoute(String? route) {
    List<String> publicRoutes = [
      RouteHelper.signIn,
      RouteHelper.register,
      RouteHelper.initial,
      RouteHelper.product,
    ];
    return publicRoutes.contains(route);
  }
}
