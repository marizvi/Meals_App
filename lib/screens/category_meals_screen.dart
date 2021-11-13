import 'package:flutter/cupertino.dart';
import 'package:my_app/widgets/meal_item.dart';
import '../models/meal.dart';
import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatefulWidget {
  final List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);
  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late String CategoryTitle;
  late List<Meal> CategoryMeal;
  var _isloaded = false;

  @override
  Widget build(BuildContext context) {
    if (!_isloaded) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      CategoryTitle = routeArgs['title'] as String;
      final CategoryId = routeArgs['id'];
      CategoryMeal = widget.availableMeals.where((meal) {
        return meal.categories.contains(CategoryId);
      }).toList();
      _isloaded = true;
    }

    void _removeMeal(String mealId) {
      setState(() {
        CategoryMeal.removeWhere((meal) => meal.id == mealId);
      });
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(CategoryTitle as String),
        ),
        body: Container(
          color: Colors.white,
          child: ListView.builder(
            itemBuilder: (ctx, index) {
              return MealItem(
                CategoryMeal[index].id,
                CategoryMeal[index].title,
                CategoryMeal[index].imageUrl,
                CategoryMeal[index].duration,
                CategoryMeal[index].complexity,
                CategoryMeal[index].affordability,
                _removeMeal,
              );
            },
            itemCount: CategoryMeal.length,
          ),
        ));
  }
}
