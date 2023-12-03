import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/providers/navBar_provider.dart';
import '../models/meal.dart';
import '../providers/favorites_provider.dart';
import '../providers/filters_provider.dart';
import '../screens/categories_screen.dart';
import '../screens/filter_screen.dart';
import '../screens/meals_screen.dart';
import '../widgets/main_drawer.dart';

class TabsScreen extends ConsumerWidget {
  const TabsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Meal> availableMeals = ref.watch(filteredMealsProvider);
    final int selectedPageIndex = ref.watch(navBarProvider);

    Widget activePage =  CategoryScreen(
      availableMeals: availableMeals,
    );

    String activePageTitle = 'Pick your category';
    if(selectedPageIndex == 1){
      final List<Meal> favoriteMeals = ref.watch(favoritesMealsProvider);
        activePage = MealsScreen(
            meals: favoriteMeals,
        );
        activePageTitle = 'Favorites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      drawer:  MainDrawer(onSelectScreen: (String identifier){
        Navigator.pop(context);
        if(identifier == "filters"){
          Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx){
                return const FiltersScreen();
              })
          );
        }else if(identifier == "meals"){
          Navigator.of(context).pop();
        }
      } ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: ref.watch(navBarProvider.notifier).selectPage,
        currentIndex: selectedPageIndex,
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
