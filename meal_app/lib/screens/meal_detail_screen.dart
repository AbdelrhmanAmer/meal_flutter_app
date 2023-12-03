import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/providers/favorites_provider.dart';

class MealDetailScreen extends ConsumerWidget {
  const MealDetailScreen({
    super.key,
    required this.meal,
  });
  final Meal meal;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Meal> favoriteMeals = ref.watch(favoritesMealsProvider);

    final bool isFavorite = favoriteMeals.contains(meal);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
              onPressed: (){
                 final wasAdded = ref
                    .read(favoritesMealsProvider.notifier)
                    .toggleFavoriteMeal(meal);
                 ScaffoldMessenger.of(context).clearSnackBars();
                 ScaffoldMessenger.of(context).showSnackBar(
                   SnackBar(content: Text(wasAdded
                       ? "Marked As favorite"
                       : "Meal is no longer a favorite")
                   )
                 );
              },
              icon: Icon(
                isFavorite? Icons.star : Icons.star_border_outlined,
                color: isFavorite? Colors.amber: Colors.white,
              ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 14,),
            Text('Ingredients', style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.primary
            ),
            ),
            const SizedBox(height: 14,),
            for(final ingredient in meal.ingredients)
              Text(
                ingredient,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground
                ),
              ),
            const SizedBox(height: 24,),
            Text('Steps', style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.primary
            ),
            ),
            const SizedBox(height: 14,),
            for(final step in meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 12
                ),
                child: Text(
                  step,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
