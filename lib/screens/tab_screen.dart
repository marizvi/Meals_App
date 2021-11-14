import 'package:flutter/material.dart';
import '../models/meal.dart';
import 'package:my_app/screens/categories_screen.dart';
import 'package:my_app/screens/favourites_screen.dart';
import 'package:my_app/widgets/main_drawer.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;
  TabScreen(this.favouriteMeals);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String, Object>> _pages = [];

  // Can also be done in this manner
  // final List<Widget> _pages = [
  //   CategoriesScreen(),
  //   FavouritesScreen(),
  // ];

  void initState() {
    _pages = [
      {
        //String: //Object
        'page': CategoriesScreen(),
        'title': 'Categories',
      },
      {
        //String: //Object
        'page': FavouritesScreen(widget.favouriteMeals),
        'title': 'Your Favourites',
      }
    ];
    super.initState();
  }

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title'] as String),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        // onTap: (index) {
        //   print(index);
        // }, //will automatically provide index
        onTap: _selectPage,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType
            .shifting, //adds slight animation to navigation bar

        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              title: Text('Categories.')),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              title: Text('Favourites')),
        ],
      ),
    );
  }
}
