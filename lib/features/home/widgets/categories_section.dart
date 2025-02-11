import 'package:ahziyah_flutter/features/home/model/home_response.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:pretty_logger/pretty_logger.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key, required this.cotegories});

  final List<Category> cotegories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        // spacing: 10,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              'Categories',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: cotegories.length + 1,
              padding: EdgeInsets.symmetric(horizontal: 24),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return ActionChip(
                    elevation: 15,
                    avatar: Icon(IconlyBold.activity),
                    backgroundColor: Colors.blue,
                    onPressed: () {},
                    label: Text(
                      'All Categories',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }
                final category = cotegories[index - 1];
                return ActionChip(
                  avatar: CachedNetworkImage(imageUrl: category.logo),
                  onPressed: () {
                    PLog.black(category.name);
                  },
                  label: Text(category.name),
                );
              },
              separatorBuilder: (context, index) => SizedBox(width: 10),
            ),
          ),
        ],
      ),
    );
  }
}
