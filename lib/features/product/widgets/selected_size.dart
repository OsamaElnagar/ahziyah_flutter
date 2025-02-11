import 'package:ahziyah_flutter/theme/app_colors.dart';
import 'package:ahziyah_flutter/utils/dimensions.dart';
import 'package:flutter/material.dart';

class SelectedSize extends StatelessWidget {
  const SelectedSize({
    super.key,
    required this.sizes,
    required this.selectedIndex,
    required this.press,
  });

  final List<String> sizes;
  final int selectedIndex;
  final ValueChanged<int> press;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: Dimensions.paddingSizeDefault),
        Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
          child: Text(
            "Select Size",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        Row(
          children: List.generate(
            sizes.length,
            (index) => Padding(
              padding: EdgeInsets.only(
                  left: index == 0
                      ? Dimensions.paddingSizeDefault
                      : Dimensions.paddingSizeDefault / 2),
              child: SizeButton(
                text: sizes[index],
                isActive: selectedIndex == index,
                press: () => press(index),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class SizeButton extends StatelessWidget {
  const SizeButton({
    super.key,
    required this.text,
    required this.isActive,
    required this.press,
  });

  final String text;
  final bool isActive;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 40,
      child: OutlinedButton(
        onPressed: press,
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: const CircleBorder(),
          side: isActive ? const BorderSide(color: AppColors.primary) : null,
        ),
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
              color: isActive
                  ? AppColors.primary
                  : Theme.of(context).textTheme.bodyLarge!.color),
        ),
      ),
    );
  }
}
