import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/models/meal.dart';

class FavoritesMealsNotifier extends StateNotifier<List<Meal>>{
  FavoritesMealsNotifier(): super([]);

  bool toggleFavoriteMeal(Meal meal){
    final bool isExist = state.contains(meal);
    if(isExist){
        state = state.where((element) => element.id != meal.id).toList();
        return false;
    }else{
        state = [...state, meal];
        return true;
    }
  }
}


final favoritesMealsProvider = StateNotifierProvider<FavoritesMealsNotifier, List<Meal>>((ref) {
  return  FavoritesMealsNotifier() ;
});
