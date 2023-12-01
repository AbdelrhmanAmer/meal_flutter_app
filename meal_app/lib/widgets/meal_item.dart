import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.meal
  });

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        child: Stack(
          children: [
            FadeInImage(
              // wait until image be reloaded
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
            ),
            Text(meal.title, style: const TextStyle(color: Colors.white),),
          ],
        ),
      ),
    );
  }
}
