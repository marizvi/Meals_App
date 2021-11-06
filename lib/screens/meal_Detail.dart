import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final RouteArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    final title = RouteArgs['title'];
    final id = RouteArgs['id'];
    final selectedMeal = DUMMY_MEALS.firstWhere((meals) => meals.id == id);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: Column(children: [
        Container(
          height: 300,
          width: double.infinity,
          child: Image.network(
            selectedMeal.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'Ingredients',
            style: Theme.of(context).textTheme.title,
          ),
        )
      ]),
    );
  }
}
