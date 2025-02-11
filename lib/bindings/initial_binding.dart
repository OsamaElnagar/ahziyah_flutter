import 'package:ahziyah_flutter/features/authentication/controller/auth_controller.dart';
import 'package:ahziyah_flutter/features/authentication/repo/auth_repo.dart';
import 'package:ahziyah_flutter/features/checkout/controller/cart_controller.dart';
import 'package:ahziyah_flutter/features/checkout/repo/checkout_repo.dart';
import 'package:ahziyah_flutter/features/discover/controllers/filter_panel_controller.dart';
import 'package:ahziyah_flutter/features/discover/repo/dicover_repo.dart';
import 'package:ahziyah_flutter/features/home/controller/home_controller.dart';
import 'package:ahziyah_flutter/features/home/repo/home_repo.dart';
import 'package:ahziyah_flutter/features/profile/controller/profile_controller.dart';
import 'package:ahziyah_flutter/features/profile/repo/profile_repo.dart';
import 'package:get/get.dart';

import '../controllers/upload_controller.dart';
import '../features/discover/controllers/discover_controller.dart';
import '../features/wishlist/controller/wishlist_controller.dart';
import '../layout/controller/layout_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(
      () => AuthController(
        authRepo: AuthRepo(
          dioClient: Get.find(),
          userHiveService: Get.find(),
        ),
      ),
    );

    Get.lazyPut(
      () => LayoutController(),
    );
    Get.lazyPut(
      () => HomeController(
        repo: HomeRepo(
          dioClient: Get.find(),
        ),
      ),
    );

    Get.lazyPut(
      () => ProfileController(
        repository: ProfileRepo(
          dioClient: Get.find(),
        ),
      ),
    );

    Get.lazyPut(() => UploadController());
    Get.lazyPut(() => CartController(
          repository: CheckoutRepository(
            dioClient: Get.find(),
            cartService: Get.find(),
            userService: Get.find(),
          ),
        ));
    Get.lazyPut(
      () => DiscoverController(
        repo: DicoverRepo(
          dioClient: Get.find(),
        ),
      ),
    );
    Get.lazyPut(
      () => FilterPanelController(
        discoverController: Get.find(),
      ),
    );

    Get.put(
      WishlistController(),
    );
  }
}
