import 'package:flutter/material.dart';
// import 'package:meal_app/screens/tabs_screen.dart';
// import 'package:meal_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

enum Filter{
  glutenFree,
  lactoseFree,
  veganFree,
  vegetarianFree
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFreeFilter = false;
  bool _lactoseFreeFilter = false;
  bool _veganFreeFilter = false;
  bool _vegetarianFreeFilter = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
      ),
      body: WillPopScope(
        onWillPop: ()async{
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeFilter,
            Filter.lactoseFree: _lactoseFreeFilter,
            Filter.veganFree: _veganFreeFilter,
            Filter.vegetarianFree: _vegetarianFreeFilter
          });
          return false;
        },
        child: Column(
          children: [
            content(
                context,
                'Gluten-free',
                'Only include gluten-free meals.',
                _glutenFreeFilter,
                    (bool value){ setState(()=> _glutenFreeFilter=value ); }
            ),
            content(
                context,
                'Lactose-free',
                'Only include lactose-free meals.',
                _lactoseFreeFilter,
                    (bool value){ setState(()=> _lactoseFreeFilter=value); }
            ),
            content(
                context,
                'Vegan-free',
                'Only include vegan-free meals.',
                _veganFreeFilter,
                    (bool value){ setState(()=> _veganFreeFilter=value); }
            ),
            content(
                context,
                'Vegetarian-free',
                'Only include vegetarian-free meals.',
                _vegetarianFreeFilter,
                    (bool value){ setState(()=> _vegetarianFreeFilter=value); }
            ),
          ],
        ),
      ),
      // drawer: MainDrawer(onSelectScreen: (identifier){
      //   if(identifier == "meals"){
      //     Navigator.of(context).pushReplacement(
      //         MaterialPageRoute(builder: (ctx){
      //           return const TabsScreen();
      //         })
      //     );
      //   }else if(identifier == "filters"){
      //     Navigator.of(context).pop();
      //   }
      // },
      // ),
    );
  }
  SwitchListTile content(
      BuildContext context,
      String title,
      String subTitle,
      bool filter,
      Function(bool newValue) onChanged
      ){
    return SwitchListTile(
      value: filter,
      onChanged: onChanged,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
      subtitle:  Text(
        subTitle,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
    );
  }
}
