import 'package:flutter/material.dart';
import '../../models/filter_options.dart';
import 'filter_container.dart';
import 'package:get/get.dart';

class CategoriesFilter extends StatelessWidget {
  final List<Category> categories;
  final List<int> selectedCategories;
  final Function(int) onToggle;

  const CategoriesFilter({
    super.key,
    required this.categories,
    required this.selectedCategories,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return FilterContainer(
      title: 'Categories',
      child: Obx(() => Column(
            children: categories
                .map(
                  (category) => CheckboxListTile(
                    title: Text(category.name),
                    value: selectedCategories.contains(category.id),
                    onChanged: (_) => onToggle(category.id),
                  ),
                )
                .toList(),
          )),
    );
  }
}
