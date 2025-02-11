import 'package:ahziyah_flutter/core/helpers/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class XAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showSearch;
  final VoidCallback? onSearchTap;

  const XAppBar({
    super.key,
    this.showSearch = false,
    this.onSearchTap,
  });

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: UniqueKey(),
      child: AppBar(
        titleTextStyle: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(fontWeight: FontWeight.bold),
        title: ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: [
              Colors.blue,
              Colors.purple,
            ],
          ).createShader(bounds),
          child: Text(
            'AHZIYAH',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(RouteHelper.getCartRoute());
            },
            icon: Icon(IconlyLight.bag, color: Colors.purple[400]),
          ),
          if (showSearch)
            IconButton(
              onPressed: onSearchTap,
              icon: Icon(IconlyLight.search, color: Colors.purple[400]),
            ),
          IconButton(
            onPressed: () => Get.toNamed(RouteHelper.getNotificationsRoute()),
            icon: Icon(IconlyLight.notification, color: Colors.purple[400]),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
