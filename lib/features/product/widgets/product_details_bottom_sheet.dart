import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/shoes_controller.dart';
import '../model/shoes_response.dart';
import '../../../utils/dimensions.dart';

class ProductDetailsBottomSheet extends StatelessWidget {
  final Product product;

  const ProductDetailsBottomSheet({
    super.key,
    required this.product,
  });

  Map<String, List<SizeShoes>> _groupSizesByRegion() {
    final groupedSizes = <String, List<SizeShoes>>{};

    for (var size in product.sizes) {
      if (!groupedSizes.containsKey(size.region)) {
        groupedSizes[size.region] = [];
      }
      groupedSizes[size.region]!.add(size);
    }

    // Sort sizes within each region
    for (var sizes in groupedSizes.values) {
      sizes
          .sort((a, b) => double.parse(a.name).compareTo(double.parse(b.name)));
    }

    return groupedSizes;
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ShoesController>();
    final groupedSizes = _groupSizesByRegion();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const BackButton(),
              Text(
                "Select Size",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(width: 40),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...groupedSizes.entries.map((entry) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            '${entry.key} Size',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: entry.value.map((size) {
                            final index = product.sizes.indexOf(size);
                            return Obx(() {
                              final isSelected =
                                  controller.selectedSize == index;
                              final isAvailable = size.stockQuantity > 0;

                              return ChoiceChip(
                                label: Text(size.name),
                                selected: isSelected,
                                onSelected: isAvailable
                                    ? (value) =>
                                        controller.setSelectedSize(index)
                                    : null,
                                disabledColor: Colors.grey[300],
                                labelStyle: TextStyle(
                                  color: isAvailable
                                      ? isSelected
                                          ? Colors.white
                                          : Colors.black
                                      : Colors.grey,
                                ),
                                backgroundColor: Colors.white,
                                selectedColor: Theme.of(context).primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  side: BorderSide(
                                    color: isSelected
                                        ? Theme.of(context).primaryColor
                                        : Colors.grey[300]!,
                                  ),
                                ),
                              );
                            });
                          }).toList(),
                        ),
                        const SizedBox(height: 16),
                      ],
                    )),

                // Size Guide
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.straighten),
                    label: const Text('Size Guide'),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.grey[700],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
