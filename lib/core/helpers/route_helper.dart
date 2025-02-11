import 'dart:convert';

import 'package:ahziyah_flutter/bindings/initial_binding.dart';
import 'package:ahziyah_flutter/core/middleware/auth_middleware.dart';
import 'package:ahziyah_flutter/features/authentication/view/register_page.dart';
import 'package:ahziyah_flutter/features/authentication/view/setup_profile_page.dart';
import 'package:ahziyah_flutter/features/authentication/view/sign_in_page.dart';
import 'package:ahziyah_flutter/features/checkout/repo/checkout_repo.dart';
import 'package:ahziyah_flutter/features/checkout/view/cart_page.dart';
import 'package:ahziyah_flutter/features/home/view/home_page.dart';
import 'package:ahziyah_flutter/features/notifications/view/notifications_page.dart';
import 'package:ahziyah_flutter/features/product/repo/product_repo.dart';
import 'package:ahziyah_flutter/features/product/view/product_page.dart';
import 'package:ahziyah_flutter/features/search/view/search_page.dart';
import 'package:ahziyah_flutter/features/support/view/about_us_page.dart';
import 'package:ahziyah_flutter/features/support/view/help_center_page.dart';
import 'package:ahziyah_flutter/features/support/view/terms_page.dart';
import 'package:ahziyah_flutter/layout/view/layout_page.dart';
import 'package:get/get.dart';

import '../../features/order/controller/order_controller.dart';
import '../../features/order/repo/order_repo.dart';
import '../../features/order/view/order_details_page.dart';
import '../../features/order/view/order_list_page.dart';
import '../../features/product/controller/shoes_controller.dart';

class RouteHelper {
  static const String initial = '/';
  static const String home = '/home';
  static const String product = '/product';
  static const String search = '/search';
  static const String cart = '/cart';

  static const String register = '/register';
  static const String setupProfile = '/setup_profile';
  static const String signIn = '/sign-in';
  static const String sendOtpScreen = '/send-otp';
  static const String verification = '/verification';
  static const String changePassword = '/change-password';
  static const String profile = '/profile';

  static const String html = '/html';
  static const String paymentTest = '/payment-test';
  static const String notifications = '/notifications';

  static String getInitialRoute() => initial;
  static String getHomeRoute() => home;
  static String getProductRoute({required String slug}) => "$product/$slug";

  static String getSignInRoute() => signIn;

  static String getSignUpRoute() => register;
  static String getSetupProfileRoute() => setupProfile;

  static String getProfileRoute() => profile;
  static String getNotificationsRoute() => notifications;
  static String getSearchRoute() => search;
  static String getCartRoute() => cart;

  static String getSendOtpScreen(String fromScreen) {
    return '$sendOtpScreen?fromPage=$fromScreen';
  }

  static String getVerificationRoute(
      String identity, String identityType, String fromPage) {
    String data = Uri.encodeComponent(jsonEncode(identity));
    return '$verification?identity=$data&identity_type=$identityType&fromPage=$fromPage';
  }

  static String getChangePasswordRoute(
      String identity, String identityType, String otp) {
    String identity0 = Uri.encodeComponent(jsonEncode(identity));
    String otp0 = Uri.encodeComponent(jsonEncode(otp));
    return '/$changePassword?identity=$identity0&identity_type=$identityType&otp=$otp0';
  }

  static List<GetPage> pages = [
    GetPage(
      name: initial,
      page: () => LayoutPage(),
      binding: InitialBinding(),
      middlewares: [
        AuthMiddleware(),
      ],
    ),
    GetPage(
      name: initial,
      page: () => HomePage(),
      binding: InitialBinding(),
      middlewares: [
        AuthMiddleware(),
      ],
    ),
    GetPage(
      name: search,
      page: () => SearchPage(),
      binding: InitialBinding(),
      middlewares: [
        // AuthMiddleware(),
      ],
    ),
    GetPage(
      name: cart,
      page: () => CartPage(),
      binding: InitialBinding(),
      middlewares: [
        // AuthMiddleware(),
      ],
    ),
    GetPage(
      name: '/product/:slug',
      page: () => const ProductPage(),
      binding: BindingsBuilder(() {
        Get.put(
          ShoesController(
            repo: ProductRepo(dioClient: Get.find()),
            checkoutRepo: CheckoutRepository(
              dioClient: Get.find(),
              cartService: Get.find(),
              userService: Get.find(),
            ),
          ),
          permanent: false,
        );
      }),
    ),
    GetPage(
      name: signIn,
      page: () => const SignInPage(),
    ),
    GetPage(
      name: register,
      page: () => const RegisterPage(),
    ),
    GetPage(
      name: setupProfile,
      page: () => const SetupProfilePage(),
    ),
    GetPage(
      name: notifications,
      page: () => const NotificationsPage(),
    ),
    GetPage(
      name: '/orders',
      page: () => const OrderListPage(),
      binding: BindingsBuilder(() {
        Get.put(OrderController(orderRepo: OrderRepo(dio: Get.find())));
      }),
    ),
    GetPage(
      name: '/order/:id',
      page: () {
        final id = int.parse(Get.parameters['id']!);
        return OrderDetailsPage(orderId: id);
      },
    ),
    GetPage(
      name: '/help-center',
      page: () => HelpCenterPage(),
    ),
    GetPage(
      name: '/about-us',
      page: () => AboutUsPage(),
    ),
    GetPage(
      name: '/terms-conditions',
      page: () => TermsPage(),
    ),
  ];
}
