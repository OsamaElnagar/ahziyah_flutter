import 'package:flutter/material.dart';

import '../../models/filter_options.dart';
import 'filter_container.dart';

class SortOptionsFilter extends StatelessWidget {
  final List<SortOption> sortOptions;
  final String selectedSort;
  final Function(String) onChanged;

  const SortOptionsFilter({
    super.key,
    required this.sortOptions,
    required this.selectedSort,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return FilterContainer(
      title: 'Sort By',
      child: Column(
        children: sortOptions
            .map(
              (option) => RadioListTile<String>(
                title: Text(option.label),
                value: option.key,
                groupValue: selectedSort,
                onChanged: (value) => onChanged(value!),
              ),
            )
            .toList(),
      ),
    );
  }
}
