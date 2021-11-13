import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:my_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FilterScreen(this.currentFilters, this.saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    // TODO: implement initState
    _glutenFree = widget.currentFilters['gluten'] as bool;
    _lactoseFree = widget.currentFilters['lactose'] as bool;
    _vegan = widget.currentFilters['vegan'] as bool;
    _vegetarian = widget.currentFilters['vegetarian'] as bool;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Your Filters"),
          actions: [
            IconButton(
                onPressed: () {
                  final selectedFilters = {
                    'gluten': _glutenFree,
                    'lactose': _lactoseFree,
                    'vegan': _vegan,
                    'vegetarian': _vegetarian,
                  };
                  widget.saveFilters(selectedFilters);
                },
                icon: Icon(Icons.save))
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              child: Text(
                "Adjust your meal selection",
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  SwitchListTile(
                      title: Text("GLuten-free"),
                      subtitle: Text('Only include Gluten-free meals'),
                      value: _glutenFree,
                      onChanged: (newValue) {
                        setState(() {
                          _glutenFree = newValue;
                        });
                      }),
                  SwitchListTile(
                      title: Text("Lactose-free"),
                      subtitle: Text('Only include Lactose-free meals'),
                      value: _lactoseFree,
                      onChanged: (newValue) {
                        setState(() {
                          _lactoseFree = newValue;
                        });
                      }),
                  SwitchListTile(
                      title: Text("Vegan"),
                      subtitle: Text('Only include Vegan meals'),
                      value: _vegan,
                      onChanged: (newValue) {
                        setState(() {
                          _vegan = newValue;
                        });
                      }),
                  SwitchListTile(
                      title: Text("Vegetarian"),
                      subtitle: Text('Only include Vegetarian meals'),
                      value: _vegetarian,
                      onChanged: (newValue) {
                        setState(() {
                          _vegetarian = newValue;
                        });
                      })
                ],
              ),
            )
          ],
        ));
  }
}
