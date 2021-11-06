import 'package:flutter/cupertino.dart';
import 'package:my_app/dummy_data.dart';
import 'package:my_app/widgets/meal_item.dart';

import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final CategoryTitle = routeArgs['title'];
    final CategoryId = routeArgs['id'];
    final CategoryMeal = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(CategoryId);
    }).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(CategoryTitle as String),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
                CategoryMeal[index].id,
                CategoryMeal[index].title,
                CategoryMeal[index].imageUrl,
                CategoryMeal[index].duration,
                CategoryMeal[index].complexity,
                CategoryMeal[index].affordability);
          },
          itemCount: CategoryMeal.length,
        ));
  }
}
