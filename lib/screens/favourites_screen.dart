import 'package:flutter/material.dart';
import '../models/meal.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;
  FavouritesScreen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    //No scaffold because this screen is under TabView widget hence it is not needed
    return Center(
      child: Text('You have no favourites yet..Start adding some.'),
    );
  }
}
