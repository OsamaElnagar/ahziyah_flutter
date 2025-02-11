import 'package:ahziyah_flutter/features/discover/controllers/filter_panel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'filters/brands_filter.dart';
import 'filters/price_range_filter.dart';
import 'filters/categories_filter.dart';
import 'filters/sizes_filter.dart';
import 'filters/sort_options_filter.dart';

class FilterPanel extends StatelessWidget {
  final FilterPanelController controller;

  const FilterPanel({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 280,
      decoration: BoxDecoration(
        color: Get.theme.cardColor,
        border: Border(
          right: BorderSide(
            color: Colors.grey.withOpacity(0.2),
          ),
        ),
      ),
      child: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    SortOptionsFilter(
                      sortOptions: controller.sortOptions,
                      selectedSort: controller.selectedSort,
                      onChanged: controller.updateSort,
                    ),
                    const SizedBox(height: 24),
                    PriceRangeFilter(
                      minPrice: controller.minPrice,
                      maxPrice: controller.maxPrice,
                      onChanged: controller.updatePriceRange,
                    ),
                    const SizedBox(height: 24),
                    BrandsFilter(
                      brands: controller.brands,
                      selectedBrands: controller.selectedBrands,
                      onToggle: controller.toggleBrand,
                    ),
                    const SizedBox(height: 24),
                    CategoriesFilter(
                      categories: controller.categories,
                      selectedCategories: controller.selectedCategories,
                      onToggle: controller.toggleCategory,
                    ),
                    const SizedBox(height: 24),
                    SizesFilter(
                      sizes: controller.sizes,
                      selectedSizes: controller.selectedSizes,
                      onToggle: controller.toggleSize,
                    ),
                  ],
                ),
              ),
            ),
          ),
          _buildFooter(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.withOpacity(0.2),
          ),
        ),
      ),
      child: Row(
        children: [
          Text(
            'Filters',
            style: Get.textTheme.titleLarge,
          ),
          const Spacer(),
          TextButton(
            onPressed: controller.clearAll,
            child: const Text('Clear All'),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey.withOpacity(0.2),
          ),
        ),
      ),
      child: ElevatedButton(
        onPressed: controller.applyFilters,
        child: const Text('Apply Filters'),
      ),
    );
  }
}
