import 'package:ahziyah_flutter/features/discover/controllers/filter_panel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../discover/controllers/discover_controller.dart';
import '../../discover/widgets/category_strip.dart';
import '../../discover/widgets/discover_content.dart';
import '../../discover/widgets/filter_chips_row.dart';
import '../../discover/widgets/filter_bottom_sheet.dart';

class SearchPage extends GetView<DiscoverController> {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildSearchAnchor(context),
            Expanded(
              child: Obx(() => controller.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Column(
                      children: [
                        CategoryStrip(
                          categories:
                              controller.filterOptions?.categories ?? [],
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
                      ],
                    )),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchAnchor(BuildContext context) {
    return SearchAnchor(
      builder: (context, controller) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SearchBar(
            controller: controller,
            padding: const MaterialStatePropertyAll<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 16.0),
            ),
            onTap: () => controller.openView(),
            leading: const Icon(IconlyLight.search),
            trailing: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Get.back(),
              ),
            ],
            hintText: 'Search products...',
          ),
        );
      },
      suggestionsBuilder: (context, controller) async {
        if (controller.text.isEmpty) return [];

        // Update search query in discover controller
        this.controller.updateSearchQuery(controller.text);
        await this.controller.applyFilters();

        return this
            .controller
            .products
            .map((product) => ListTile(
                  title: Text(product.name),
                  subtitle: Text('\$${product.price}'),
                  onTap: () {
                    controller.closeView(controller.text);
                    // Navigate to product detail or handle selection
                  },
                ))
            .toList();
      },
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
