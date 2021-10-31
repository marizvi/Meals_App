import 'package:flutter/material.dart';
import 'package:my_app/categoryItem.dart';
import 'dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('DeliMeal'),
        ),
        body: GridView(
          children: DUMMY_CATEGORIES
              .map((cat_data) => CategoryItem(cat_data.title, cat_data.color))
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
        ));
  }
}
