import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/category_icons.dart';
import '../models/filter_options.dart';

class CategoryStrip extends StatelessWidget {
  final List<Category> categories;
  final List<int> selectedCategories;
  final Function(int) onCategoryTap;

  const CategoryStrip({
    super.key,
    required this.categories,
    required this.selectedCategories,
    required this.onCategoryTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          final category = categories[index];
          return Obx(() {
            final isSelected = selectedCategories.contains(category.id);
            return Padding(
              padding: const EdgeInsets.only(right: 16),
              child: GestureDetector(
                onTap: () => onCategoryTap(category.id),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isSelected
                            ? Theme.of(context).primaryColor
                            : Colors.grey[200],
                      ),
                      child: Icon(
                        getCategoryIcon(category.slug),
                        color: isSelected ? Colors.white : Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      category.name,
                      style: TextStyle(
                        color:
                            isSelected ? Theme.of(context).primaryColor : null,
                        fontWeight: isSelected ? FontWeight.bold : null,
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
