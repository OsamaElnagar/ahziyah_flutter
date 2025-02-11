import 'package:ahziyah_flutter/features/discover/widgets/filters/filter_container.dart';
import 'package:ahziyah_flutter/features/discover/widgets/filters/range_slider_widget.dart';
import 'package:flutter/material.dart';

class PriceRangeFilter extends StatelessWidget {
  final double minPrice;
  final double maxPrice;
  final Function(double, double) onChanged;

  const PriceRangeFilter({
    super.key,
    required this.minPrice,
    required this.maxPrice,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return FilterContainer(
      title: 'Price Range',
      child: RangeSliderWidget(
        min: minPrice,
        max: maxPrice,
        onChanged: onChanged,
      ),
    );
  }
}
