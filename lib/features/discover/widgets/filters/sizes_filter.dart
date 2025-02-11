import 'package:flutter/material.dart';
import '../../models/filter_options.dart';
import 'filter_container.dart';
import 'package:get/get.dart';

class SizesFilter extends StatelessWidget {
  final Map<String, List<Size>> sizes;
  final List<int> selectedSizes;
  final Function(int) onToggle;

  const SizesFilter({
    super.key,
    required this.sizes,
    required this.selectedSizes,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return FilterContainer(
      title: 'Sizes',
      child: Obx(() => Column(
            children: sizes.entries.map((entry) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      entry.key,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  ...entry.value.map(
                    (size) => CheckboxListTile(
                      title: Text(size.name),
                      value: selectedSizes.contains(size.id),
                      onChanged: (_) => onToggle(size.id),
                    ),
                  ),
                ],
              );
            }).toList(),
          )),
    );
  }
}
