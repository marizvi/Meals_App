import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;
  FavouritesScreen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    //No scaffold because this screen is under TabView widget hence it is not needed
    if (favouriteMeals.isEmpty) {
      return Center(
        child: Text('You have no favourites yet..Start adding some.'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            favouriteMeals[index].id,
            favouriteMeals[index].title,
            favouriteMeals[index].imageUrl,
            favouriteMeals[index].duration,
            favouriteMeals[index].complexity,
            favouriteMeals[index].affordability,
          );
        },
        itemCount: favouriteMeals.length,
      );
    }
  }
}
