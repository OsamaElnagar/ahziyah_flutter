import 'package:ahziyah_flutter/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ResponsiveDiscoverLayout extends StatelessWidget {
  final Widget filterPanel;
  final Widget content;

  const ResponsiveDiscoverLayout({
    super.key,
    required this.filterPanel,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    final bool isWideScreen = !Responsive.isMobile(context);

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: const Text('Discover'),
        leading: isWideScreen
            ? null
            : Builder(
                builder: (context) => IconButton(
                  icon: const Icon(IconlyLight.filter),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
              ),
      ),
      drawer: isWideScreen ? null : Drawer(child: filterPanel),
      body: SafeArea(
        child: Row(
          children: [
            if (isWideScreen) filterPanel,
            Expanded(child: content),
          ],
        ),
      ),
    );
  }
}
