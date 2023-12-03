import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/models/meal.dart';

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
