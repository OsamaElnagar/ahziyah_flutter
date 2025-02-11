import 'package:flutter/material.dart';

class RangeSliderWidget extends StatelessWidget {
  final double min;
  final double max;
  final Function(double, double) onChanged;

  const RangeSliderWidget({
    super.key,
    required this.min,
    required this.max,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      values: RangeValues(min, max),
      min: min,
      max: max,
      onChanged: (RangeValues values) => onChanged(values.start, values.end),
    );
  }
}
