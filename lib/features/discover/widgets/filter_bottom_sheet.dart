import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/filter_panel_controller.dart';
import 'filters/brands_filter.dart';
import 'filters/price_range_filter.dart';
import 'filters/sizes_filter.dart';
import 'filters/sort_options_filter.dart';

class FilterBottomSheet extends StatelessWidget {
  final FilterPanelController controller;
  final ScrollController scrollController;

  const FilterBottomSheet({
    super.key,
    required this.controller,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          _buildHandle(),
          _buildHeader(),
          Expanded(
            child: ListView(
              controller: scrollController,
              padding: const EdgeInsets.all(16),
              children: [
                SortOptionsFilter(
                  sortOptions: controller.sortOptions,
                  selectedSort: controller.selectedSort,
                  onChanged: controller.updateSort,
                ),
                const Divider(height: 32),
                PriceRangeFilter(
                  minPrice: controller.minPrice,
                  maxPrice: controller.maxPrice,
                  onChanged: controller.updatePriceRange,
                ),
                const Divider(height: 32),
                BrandsFilter(
                  brands: controller.brands,
                  selectedBrands: controller.selectedBrands,
                  onToggle: controller.toggleBrand,
                ),
                const Divider(height: 32),
                SizesFilter(
                  sizes: controller.sizes,
                  selectedSizes: controller.selectedSizes,
                  onToggle: controller.toggleSize,
                ),
              ],
            ),
          ),
          _buildFooter(context),
        ],
      ),
    );
  }

  Widget _buildHandle() => Container(
        height: 4,
        width: 40,
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(2),
        ),
      );

  Widget _buildHeader() => Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const BackButton(),
            Text(
              'Filters',
              style: Theme.of(Get.context!).textTheme.titleMedium,
            ),
            TextButton(
              onPressed: () {
                controller.clearAll();
                Get.back();
              },
              child: const Text('Reset'),
            ),
          ],
        ),
      );

  Widget _buildFooter(BuildContext context) => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          border: Border(
            top: BorderSide(color: Theme.of(context).dividerColor),
          ),
        ),
        child: ElevatedButton(
          onPressed: () {
            controller.applyFilters();
            Get.back();
          },
          child: const Text('Show Results'),
        ),
      );
}
