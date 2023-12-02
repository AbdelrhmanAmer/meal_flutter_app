import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/meals_screen.dart';

import '../models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    super.key,
    required this.category,
    required this.onToggleFavorite
  });

  final Category category;
  final void Function(Meal meal) onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return InkWell( // GestureDetector
      onTap: (){
        final List<Meal> filteredMeals = dummyMeals.where(
                (meal) => meal.categories.contains(category.id)
        ).toList();

        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (ctx)=> MealsScreen(
                title: category.title,
                meals: filteredMeals,
                onToggleFavorite: onToggleFavorite,
              ),
          ),
        );
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              gradient: LinearGradient(
                colors: [
                  category.color.withOpacity(0.54),
                  category.color.withOpacity(0.9),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
          ),
          child: Text(
              category.title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
          )
      ),
    );
  }
}
