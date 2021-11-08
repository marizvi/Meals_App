import 'package:flutter/material.dart';
import 'package:my_app/screens/categories_screen.dart';
import 'package:my_app/screens/favourites_screen.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  // Can also be done in this manner
  // final List<Widget> _pages = [
  //   CategoriesScreen(),
  //   FavouritesScreen(),
  // ];

  final List<Map<String, Object>> _pages = [
    {
      //String: //Object
      'page': CategoriesScreen(),
      'title': 'Categories',
    },
    {
      //String: //Object
      'page': FavouritesScreen(),
      'title': 'Your Favourites',
    }
  ];

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
