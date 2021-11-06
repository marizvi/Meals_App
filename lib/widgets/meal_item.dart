import 'package:flutter/material.dart';
import 'package:my_app/models/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem(this.id, this.title, this.imageUrl, this.duration, this.complexity,
      this.affordability);

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed('/meal_Detail', arguments: {'title': title, 'id': id});
  }

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.pricey:
        return 'Pricey';
      case Affordability.Luxurious:
        return 'Expensive';
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ), //used generally when parent widgets are round cornered
                Positioned(
                    bottom: 20,
                    right: 10,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      width: 300,
                      color: Colors.black54,
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                        ),
                        // softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ))
              ],
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 10),
                      Text('$duration min'),
                    ]),
                    Row(children: [
                      Icon(Icons.work),
                      SizedBox(width: 10),
                      Text(complexityText),
                    ]),
                    Row(children: [
                      Icon(Icons.work),
                      SizedBox(width: 10),
                      Text(affordabilityText),
                    ]),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
