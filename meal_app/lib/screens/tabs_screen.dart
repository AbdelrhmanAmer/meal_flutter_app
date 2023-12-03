import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/providers/favorites_provider.dart';
import '../providers/meals_provider.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/filter_screen.dart';
import 'package:meal_app/screens/meals_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

const kInitialFilter = {
  Filter.glutenFree: false,
    Filter.lactoseFree:false,
    Filter.veganFree: false,
    Filter.vegetarianFree: false
};

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  Map<Filter, bool> _selectedFilters = kInitialFilter;



  void _setScreen(String identifier){
    Navigator.pop(context);
    if(identifier == "filters"){
      Navigator.of(context).push(
        MaterialPageRoute(builder: (ctx){
          return FiltersScreen(
            currentFilters: _selectedFilters,
          );
        })
      ) .then((value) => setState(
              ()=>_selectedFilters= value ?? kInitialFilter)
      );

    }else if(identifier == "meals"){
      Navigator.of(context).pop();
    }
  }

  void _selectPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    final List<Meal> meals = ref.watch(mealsProvider);
    final List<Meal> availableMeals = meals.where((meal){
      if(_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree){
        return false;
      }
      if(_selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree){
        return false;
      }
      if(_selectedFilters[Filter.veganFree]! && !meal.isVegan){
        return false;
      }
      if(_selectedFilters[Filter.vegetarianFree]! && !meal.isVegetarian){
        return false;
      }
      return true;
    }).toList();

    Widget activePage =  CategoryScreen(
      availableMeals: availableMeals,
    );

    String activePageTitle = 'Pick your category';

    if(_selectedPageIndex == 1){
      final List<Meal> favoriteMeals = ref.watch(favoritesMealsProvider);
      setState(() {
        activePage = MealsScreen(
            meals: favoriteMeals,
        );
        activePageTitle = 'Favorites';
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      drawer:  MainDrawer(onSelectScreen: _setScreen,),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.fastfood_outlined),
              label: "Categories"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: "Favorite"
          ),
        ],
      ),
    );
  }
}
