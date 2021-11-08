import 'package:flutter/material.dart';
import 'package:my_app/screens/categories_screen.dart';
import 'package:my_app/screens/favorites_screen.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text('Meals'),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.category), text: 'Categories'),
                Tab(
                  icon: Icon(Icons.star),
                  text: 'Favorites',
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [CategoriesScreen(), FavoritesScreen()],
          )),
    );
  }
}
