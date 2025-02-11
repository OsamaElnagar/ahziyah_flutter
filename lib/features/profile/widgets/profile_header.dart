import 'package:ahziyah_flutter/components/custom_image.dart';
import 'package:ahziyah_flutter/controllers/global_controller.dart';
import 'package:ahziyah_flutter/core/helpers/conditional_widget.dart';
import 'package:ahziyah_flutter/core/helpers/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import '../controller/profile_controller.dart';

class ProfileHeader extends GetView<ProfileController> {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ConditionalWidget(
          condition: glAuthController.isLoggedIn(),
          builder: (context) => ConditionalWidget(
            condition: glUserHiveService.hasAvatar(),
            builder: (context) =>
                CustomAvatar(path: glUserHiveService.getUser()!.user.avatar),
            fallback: (context) => CircleAvatar(
              child: Icon(IconlyBold.user_2),
            ),
          ),
          fallback: (context) => CircleAvatar(
            radius: 30,
            backgroundImage: controller.user.value?.avatar != null
                ? NetworkImage(controller.user.value?.avatar ?? '')
                : null,
            child: controller.user.value?.avatar == null
                ? const Icon(Icons.person, size: 30)
                : null,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi, ${glUserHiveService.getUser()?.user.name ?? 'Guest'}',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              ConditionalWidget(
                condition: glAuthController.isLoggedIn(),
                builder: (context) => Text(
                  glUserHiveService.getUser()!.user.email!,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[600],
                      ),
                ),
                fallback: (context) => TextButton(
                  onPressed: () => Get.toNamed(
                    RouteHelper.getSignInRoute(),
                  ),
                  child: Text('login'.tr),
                ),
              ),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.chevron_right),
          onPressed: () => Get.toNamed('/profile/edit'),
        ),
      ],
    );
  }
}
