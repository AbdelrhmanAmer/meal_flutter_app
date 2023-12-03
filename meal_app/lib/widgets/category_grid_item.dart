import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../screens/meals_screen.dart';
import '../models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    super.key,
    required this.category,
    required this.availableMeals
  });

  final Category category;
  final List<Meal> availableMeals;

  @override
  Widget build(BuildContext context) {
    return InkWell( // GestureDetector
      onTap: (){
        final List<Meal> filteredMeals = availableMeals
            .where(
                (meal) => meal.categories.contains(category.id)
        ).toList();

        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (ctx)=> MealsScreen(
                title: category.title,
                meals: filteredMeals,
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
