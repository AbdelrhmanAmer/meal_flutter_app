import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/providers/filters_provider.dart';
// import 'package:meal_app/screens/tabs_screen.dart';
// import 'package:meal_app/widgets/main_drawer.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({ super.key,});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Map<Filter, bool> activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
      ),
      body:  Column(
          children: [
            customSwitch(
                context,
                'Gluten-free',
                'Only include gluten-free meals.',
                activeFilters[Filter.glutenFree]!,
                    (bool value)=>ref
                        .read(filtersProvider.notifier)
                        .setFilter(Filter.glutenFree, value)
            ),
            customSwitch(
                context,
                'Lactose-free',
                'Only include lactose-free meals.',
                activeFilters[Filter.lactoseFree]!,
                    (bool value)=> ref
                        .read(filtersProvider.notifier)
                        .setFilter(Filter.lactoseFree, value)
            ),
            customSwitch(
                context,
                'Vegan-free',
                'Only include vegan-free meals.',
                activeFilters[Filter.veganFree]!,
                    (bool value)=> ref
                        .read(filtersProvider.notifier)
                        .setFilter(Filter.veganFree, value)
            ),
            customSwitch(
                context,
                'Vegetarian-free',
                'Only include vegetarian-free meals.',
                activeFilters[Filter.vegetarianFree]!,
                    (bool value)=>ref
                        .read(filtersProvider.notifier)
                        .setFilter(Filter.vegetarianFree, value)
            ),
          ],
        ),
    );
  }
  SwitchListTile customSwitch(
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
