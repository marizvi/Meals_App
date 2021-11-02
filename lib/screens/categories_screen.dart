import 'package:flutter/material.dart';
import 'package:my_app/widgets/categoryItem.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('DeliMeal'),
        ),
        body: GridView(
          // padding: EdgeInsets.only(top: 10, left: 5, right: 5),
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          children: DUMMY_CATEGORIES
              .map((cat_data) =>
                  CategoryItem(cat_data.id, cat_data.title, cat_data.color))
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 20),
        ));
  }
}
