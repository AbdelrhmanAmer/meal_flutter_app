import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/widgets/category_grid_item.dart';

import '../models/meal.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({
    super.key,
    required this.onToggleFavorite
  });

  final void Function(Meal meal) onToggleFavorite;
  @override
  Widget build(BuildContext context) {
    return GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 3/2, // width : height

          ),
        children: [
          for(final category in availableCategories)
            CategoryGridItem(
              category: category,
              onToggleFavorite: onToggleFavorite,
            ),
        ],
      );
  }
}
