import 'package:ahziyah_flutter/core/helpers/route_helper.dart';
import 'package:ahziyah_flutter/features/discover/widgets/discover_content.dart';
import 'package:ahziyah_flutter/layout/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/discover_controller.dart';
import '../controllers/filter_panel_controller.dart';
import '../widgets/category_strip.dart';
import '../widgets/filter_bottom_sheet.dart';
import '../widgets/filter_chips_row.dart';

class DiscoverPage extends GetView<DiscoverController> {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: XAppBar(
        showSearch: true,
        onSearchTap: () => Get.toNamed(RouteHelper.getSearchRoute()),
      ),
      body: Obx(() => controller.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                CategoryStrip(
                  categories: controller.filterOptions?.categories ?? [],
                  selectedCategories: controller.selectedCategories,
                  onCategoryTap: controller.toggleCategory,
                ),
                FilterChipsRow(
                  selectedBrands: controller.selectedBrands,
                  selectedSizes: controller.selectedSizes,
                  priceRange: controller.priceRange.value,
                  onFilterTap: () => _showFilterBottomSheet(context),
                ),
                Expanded(
                  child: DiscoverContent(controller: controller),
                ),
                SizedBox(
                  height: 120,
                )
              ],
            )),
    );
  }

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.9,
        maxChildSize: 0.9,
        minChildSize: 0.5,
        builder: (context, scrollController) => FilterBottomSheet(
          controller: Get.find<FilterPanelController>(),
          scrollController: scrollController,
        ),
      ),
    );
  }
}
