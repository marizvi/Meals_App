import 'package:flutter/material.dart';
import 'package:my_app/widgets/main_drawer.dart';

class FilterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Your Filters"),
        ),
        drawer: MainDrawer(),
        body: Center(
          child: Text("Filter Screen"),
        ));
  }
}
