import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:get/get.dart';

import '../controllers/discover_controller.dart';

class FilterChipsRow extends StatelessWidget {
  final List<int> selectedBrands;
  final List<int> selectedSizes;
  final RxPair<double, double> priceRange;
  final VoidCallback onFilterTap;

  const FilterChipsRow({
    super.key,
    required this.selectedBrands,
    required this.selectedSizes,
    required this.priceRange,
    required this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Obx(() => ListView(
            scrollDirection: Axis.horizontal,
            children: [
              FilterChip(
                label: const Text('Sort'),
                onSelected: (_) => onFilterTap(),
                avatar: const Icon(IconlyLight.swap),
              ),
              const SizedBox(width: 8),
              if (selectedBrands.isNotEmpty)
                FilterChip(
                  label: Text('${selectedBrands.length} Brands'),
                  onSelected: (_) => onFilterTap(),
                  onDeleted: () {},
                ),
              if (selectedSizes.isNotEmpty) ...[
                const SizedBox(width: 8),
                FilterChip(
                  label: Text('${selectedSizes.length} Sizes'),
                  onSelected: (_) => onFilterTap(),
                  onDeleted: () {},
                ),
              ],
              if (priceRange.first != 0 || priceRange.second != 1000) ...[
                const SizedBox(width: 8),
                FilterChip(
                  label: Text(
                      '\$${priceRange.first.toInt()} - \$${priceRange.second.toInt()}'),
                  onSelected: (_) => onFilterTap(),
                  onDeleted: () {},
                ),
              ],
            ],
          )),
    );
  }
}
