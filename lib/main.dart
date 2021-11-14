import '../models/meal.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_app/dummy_data.dart';
import 'package:my_app/screens/categories_screen.dart';
import 'package:my_app/screens/filters_screen.dart';
import 'package:my_app/screens/tab_screen.dart';
import 'screens/category_meals_screen.dart';
import 'screens/meal_Detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMEals = DUMMY_MEALS;
  List<Meal> _favouriteMeals = [];

  void _setFilters(Map<String, bool> filterdata) {
    setState(() {
      _filters = filterdata;
      _availableMEals = DUMMY_MEALS.where((meal) {
        //function should return true if we want to keep it else false if we want to drop it
        if (_filters['gluten'] == true && !meal.isGluttenFree) {
          return false;
          //it means that it will not include meals with gluten
        }
        if (_filters['lactose'] == true && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] == true && !meal.isVegan) {
          return false;
        }
        if (_filters['vegan'] == true && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void toggleFavourite(String mealId) {
    final existingIndex =
        _favouriteMeals.indexWhere((element) => element.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favouriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        DUMMY_MEALS.firstWhere((element) => (element.id == mealId));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DaliMeals',
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          accentColor: Colors.orange[300],
          canvasColor: Colors.white, // main background colour of our app
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              title: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.w600))),
      // home: CategoriesScreen(), // this specifies the main screen of our app
      routes: {
        '/': (ctx) => TabScreen(_favouriteMeals), // this is our homepage
        '/categories-meals': (ctx) => CategoryMealsScreen(_availableMEals),
        '/meal_Detail': (ctx) => MealDetails(toggleFavourite),
        '/filter_screen': (ctx) => FilterScreen(_filters, _setFilters),
      },
    );
  }
}
