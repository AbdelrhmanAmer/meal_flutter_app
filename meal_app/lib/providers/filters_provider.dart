import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/models/meal.dart';

import 'meals_provider.dart';

enum Filter{
  glutenFree,
  lactoseFree,
  veganFree,
  vegetarianFree
}

class FiltersMealsNotifier extends StateNotifier<Map<Filter, bool>>{
  FiltersMealsNotifier()
      : super({
    Filter.glutenFree: false,
    Filter.lactoseFree: false,
    Filter.veganFree: false,
    Filter.vegetarianFree: false,
  });

  void setFilter(Filter filter, bool isActive){
    // state[filter] = isActive;    // Wrong

    state = { ...state, filter: isActive };
  }
  void setFilters(Map<Filter, bool> chosenFilters){
    state = chosenFilters;
  }
}


final filtersProvider =
      StateNotifierProvider<FiltersMealsNotifier, Map<Filter, bool>>((ref) {
  return  FiltersMealsNotifier() ;
});

final filteredMealsProvider = Provider((ref){
  final List<Meal> meals = ref.watch(mealsProvider);
  final Map<Filter, bool> activeFilters = ref.watch(filtersProvider);

  return meals.where((meal){
    if(activeFilters[Filter.glutenFree]    ! && !meal.isGlutenFree) { return false; }
    if(activeFilters[Filter.lactoseFree]   ! && !meal.isLactoseFree){ return false; }
    if(activeFilters[Filter.veganFree]     ! && !meal.isVegan)      { return false; }
    if(activeFilters[Filter.vegetarianFree]! && !meal.isVegetarian) { return false; }
    return true;
  }).toList();
});
