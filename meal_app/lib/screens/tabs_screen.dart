import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/meal.dart';
import '../providers/favorites_provider.dart';
import '../providers/filters_provider.dart';
import '../screens/categories_screen.dart';
import '../screens/filter_screen.dart';
import '../screens/meals_screen.dart';
import '../widgets/main_drawer.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  void _setScreen(String identifier){
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
  }

  void _selectPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {

    final List<Meal> availableMeals = ref.watch(filteredMealsProvider);

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
