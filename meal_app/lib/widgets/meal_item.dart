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
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15) ),
      elevation: 10,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        child: Stack(
          children: [
            FadeInImage(
              // wait until image be reloaded
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                color: Colors.black54,
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis, // word...
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20
                      ),
                    ),
                    const SizedBox(height: 12,),
                    const Row(
                      children: [ ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
