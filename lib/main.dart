import 'package:flutter/material.dart';
import 'package:my_app/screens/categories_screen.dart';
import 'screens/category_meals_screen.dart';
import 'screens/meal_Detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DaliMeals',
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          accentColor: Colors.blue,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
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
        '/': (ctx) => CategoriesScreen(), // this is our homepage
        '/categories-meals': (ctx) => CategoryMealsScreen(),
        '/meal_Detail': (ctx) => MealDetails(),
      },
    );
  }
}
