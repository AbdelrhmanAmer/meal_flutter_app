import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/filter_screen.dart';
import 'package:meal_app/screens/meals_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  final List<Meal> _favoriteMeals = [];

  _showInfoMessage(String message){
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message))
    );
  }
  void _setScreen(String identifier){
    if(identifier == "filters"){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (ctx){
          return const FiltersScreen();
        })
      );
    }else if(identifier == "meals"){
      Navigator.of(context).pop();
    }
  }
  void _toggleFavoriteMeal(Meal meal){
    final bool isExist = _favoriteMeals.contains(meal);
    if(isExist){
      setState(() {
        _favoriteMeals.remove(meal);
      });
      _showInfoMessage("Meal is no longer a favorite. ");
    }else{
      setState(() {
        _favoriteMeals.add(meal);
      });
      _showInfoMessage("Marked as a favorite. ");
    }
  }
  void _selectPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {
    Widget activePage =  CategoryScreen( onToggleFavorite: _toggleFavoriteMeal, );

    String activePageTitle = 'Pick your category';
    if(_selectedPageIndex == 1){
      setState(() {
        activePage = MealsScreen(
            meals: _favoriteMeals,
            onToggleFavorite: _toggleFavoriteMeal
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
