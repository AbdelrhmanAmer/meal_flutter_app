import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';
import 'package:meal_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
    required this.onToggleFavorite
  });

  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return title == null
        ? content(context)
        : Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content(context),
    );
  }

  SingleChildScrollView content(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          children: meals.map(
                (meal) =>
                MealItem(
                    meal: meal,
                    onSelectedMeal: (Meal meal) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (ctx) =>
                                MealDetailScreen(
                                  meal: meal,
                                  onToggleFavorite: onToggleFavorite,
                                )
                        ),
                      );
                    }
                ),
          ).toList()
      ),
    );
  }
}
