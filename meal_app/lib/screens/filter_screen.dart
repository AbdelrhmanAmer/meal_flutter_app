import 'package:flutter/material.dart';
import 'package:meal_app/screens/tabs_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
      ),
      body: const Column(
        children: [],
      ),
      drawer: MainDrawer(onSelectScreen: (identifier){
        if(identifier == "meals"){
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (ctx){
                return const TabsScreen();
              })
          );
        }else if(identifier == "filters"){
          Navigator.of(context).pop();
        }
      },
      ),
    );
  }
}
