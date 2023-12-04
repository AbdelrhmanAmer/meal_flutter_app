import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.meal,
    required this.onSelectedMeal
  });

  final Meal meal;
  final void Function(Meal meal) onSelectedMeal;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15) ),
      elevation: 10,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: ()=>onSelectedMeal(meal),
        child: Stack(
          children: [
            Hero(
              tag: meal.id,
              child: FadeInImage(
                // wait until image be reloaded
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(meal.imageUrl),
              ),
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
                    const SizedBox(height: 2,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [ 
                        Row(
                          children: [
                            const Icon(Icons.access_time_outlined,size: 15,),
                            const SizedBox(width: 10,),
                            Text('${meal.duration} min', style: const TextStyle(color: Colors.white, fontSize: 13),)
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.work,size: 15,),
                            const SizedBox(width: 10,),
                            Text(meal.complexityText, style: const TextStyle(color: Colors.white, fontSize: 13),)
                          ],
                        ),
                        Row(
                          children: [
                            const Text('\$', style: TextStyle(color: Colors.white, fontSize: 13),),
                            const SizedBox(width: 10,),
                            Text(meal.affordabilityText, style: const TextStyle(color: Colors.white, fontSize: 13),)
                          ],
                        ),
                      ],
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
