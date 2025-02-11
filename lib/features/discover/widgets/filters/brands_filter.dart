import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/filter_options.dart';
import 'filter_container.dart';

class BrandsFilter extends StatelessWidget {
  final List<Brand> brands;
  final List<int> selectedBrands;
  final Function(int) onToggle;

  const BrandsFilter({
    super.key,
    required this.brands,
    required this.selectedBrands,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => FilterContainer(
        title: 'Brands',
        child: Column(
          children: brands
              .map(
                (brand) => CheckboxListTile(
                  title: Text(brand.name),
                  value: selectedBrands.contains(brand.id),
                  onChanged: (_) => onToggle(brand.id),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
