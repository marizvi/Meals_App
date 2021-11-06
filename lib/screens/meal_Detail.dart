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
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          padding: EdgeInsets.all(7),
          height: 100,
          width: 300,
          child: ListView.builder(
            itemBuilder: (ctx, index) => Card(
              color: Colors.white10,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(selectedMeal.ingredients[index]),
              ),
            ),
            itemCount: selectedMeal.ingredients.length,
          ),
        ),
      ]),
    );
  }
}
