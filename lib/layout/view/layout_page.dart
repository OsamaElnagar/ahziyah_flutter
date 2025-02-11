import 'package:ahziyah_flutter/controllers/global_controller.dart';
import 'package:animations/animations.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class LayoutPage extends StatefulWidget {
  const LayoutPage({super.key});

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Obx(
        () => PageTransitionSwitcher(
          duration: Duration(milliseconds: 300),
          transitionBuilder: (child, animation, secondAnimation) {
            return FadeThroughTransition(
              animation: animation,
              secondaryAnimation: secondAnimation,
              child: child,
            );
          },
          child: glLayoutController.routes,
        ),
      ),
      bottomNavigationBar: Obx(
        () {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: CrystalNavigationBar(
              currentIndex: glLayoutController.currentIndex,
              // indicatorColor: Colors.white,
              unselectedItemColor: Colors.white70,
              backgroundColor: Colors.black.withAlpha(64),
              outlineBorderColor: Colors.white.withAlpha(26),
              selectedItemColor: Colors.blue[500],
              onTap: glLayoutController.handleIndexChanged,
              items: [
                /// Home
                CrystalNavigationBarItem(
                  icon: IconlyBold.home,
                  unselectedIcon: IconlyLight.home,
                  // selectedColor: Colors.white,
                ),

                /// Favourite
                CrystalNavigationBarItem(
                  icon: IconlyBold.heart,
                  unselectedIcon: IconlyLight.heart,
                  // selectedColor: Colors.blue[500],
                ),

                /// Add
                CrystalNavigationBarItem(
                  icon: IconlyBold.category,
                  unselectedIcon: IconlyLight.category,
                  // selectedColor: Colors.white,
                ),

                /// Profile
                CrystalNavigationBarItem(
                  icon: IconlyBold.user_2,
                  unselectedIcon: IconlyLight.user,
                  // selectedColor: Colors.white,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
