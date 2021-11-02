import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:my_app/models/category.dart';

class CategoryMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final CategoryTitle = routeArgs['title'];
    final CategoryId = routeArgs['id'];
    return Scaffold(
      appBar: AppBar(
        title: Text(CategoryTitle as String),
      ),
      body: Center(
        child: Text('The Recipes for: ' + CategoryTitle + ".."),
      ),
    );
  }
}
