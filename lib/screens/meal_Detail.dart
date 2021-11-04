import 'package:flutter/material.dart';

class MealDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final RouteArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    final title = RouteArgs['title'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Details'),
      ),
      body: Text(title as String),
    );
  }
}
