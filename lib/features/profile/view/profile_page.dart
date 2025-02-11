import 'package:ahziyah_flutter/components/custom_dialog.dart';
import 'package:ahziyah_flutter/controllers/global_controller.dart';
import 'package:ahziyah_flutter/layout/controller/layout_controller.dart';
import 'package:ahziyah_flutter/layout/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import '../controller/profile_controller.dart';
import '../widgets/profile_header.dart';
import '../widgets/subscription_card.dart';
import '../widgets/profile_menu_item.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: XAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProfileHeader(),
            const SizedBox(height: 24),
            const SubscriptionCard(),
            const SizedBox(height: 24),

            // Account Section
            Text(
              'Account',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            ProfileMenuItem(
              icon: IconlyLight.document,
              title: 'Orders',
              onTap: () => Get.toNamed('/orders'),
            ),
            ProfileMenuItem(
              icon: IconlyLight.swap,
              title: 'Returns',
              onTap: () => Get.toNamed('/returns'),
            ),
            ProfileMenuItem(
              icon: IconlyLight.heart,
              title: 'Wishlist',
              onTap: () => Get.find<LayoutController>().handleIndexChanged(1),
            ),

            ProfileMenuItem(
              icon: IconlyLight.wallet,
              title: 'Payment',
              onTap: () => Get.toNamed('/payment'),
            ),
            ProfileMenuItem(
              icon: IconlyLight.ticket,
              title: 'Wallet',
              onTap: () => Get.toNamed('/wallet'),
            ),
            const SizedBox(height: 24),

            // Personalization Section
            Text(
              'Personalization',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            ProfileMenuItem(
              icon: IconlyLight.setting,
              title: 'Preferences',
              onTap: () => Get.toNamed('/preferences'),
            ),

            const SizedBox(height: 24),

            // Support Section
            Text(
              'Support',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            ProfileMenuItem(
              icon: IconlyLight.chat,
              title: 'Help Center',
              onTap: () => Get.toNamed('/help-center'),
            ),
            ProfileMenuItem(
              icon: IconlyLight.info_circle,
              title: 'About Us',
              onTap: () => Get.toNamed('/about-us'),
            ),
            ProfileMenuItem(
              icon: IconlyLight.paper,
              title: 'Terms & Conditions',
              onTap: () => Get.toNamed('/terms-conditions'),
            ),
            const SizedBox(height: 24),

            // Actions Section
            Text(
              'Actions',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            ProfileMenuItem(
              icon: IconlyLight.logout,
              title: 'Logout',
              onTap: () {
                Get.dialog(
                  CustomDialog(
                    title: 'Logout',
                    message: 'You are about to logout!',
                    onConfirm: glAuthController.logout,
                  ),
                );
              },
            ),
            ProfileMenuItem(
              icon: IconlyLight.delete,
              title: 'Delete Account',
              onTap: () => Get.dialog(
                AlertDialog(
                  title: const Text('Delete Account'),
                  content: const Text(
                      'Are you sure you want to delete your account? This action cannot be undone.'),
                  actions: [
                    TextButton(
                      onPressed: () => Get.back(),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        controller.deleteAccount();
                        Get.back();
                      },
                      child: const Text('Delete',
                          style: TextStyle(color: Colors.red)),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 154),
          ],
        ),
      ),
    );
  }
}
