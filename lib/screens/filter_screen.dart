import 'package:delifood/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filter_screen';
  final Function setFilters;
  final Map<String , bool> filters;
  FilterScreen(this.filters,this.setFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree,
      _vegetarianFree,
      _veganFree ,
      _lactoseFree ;


  @override
  void initState() {
    _glutenFree = widget.filters['gluten'];
    _lactoseFree = widget.filters['lactose'];
    _veganFree = widget.filters['vegan'];
    _vegetarianFree = widget.filters['vegetarian'];
    super.initState();
  }

  Widget _buildSwitchListTile(
      String title, String subtitle, bool currentValue, Function updateValue) {
    return SwitchListTile(
      value: currentValue,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.save), onPressed:(){
            final selectedFilters = {
              'gluten': _glutenFree,
              'lactose': _lactoseFree,
              'vegan': _veganFree,
              'vegetarian': _vegetarianFree,
            };
            widget.setFilters(selectedFilters);
          } ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
              child: ListView(
            children: <Widget>[
              _buildSwitchListTile(
                  'Gluten-free', 'Only include gluten-free meals.', _glutenFree,
                  (newValue) {
                setState(() {
                  _glutenFree = newValue;
                });
              }),
              _buildSwitchListTile('Lactose-free',
                  'Only include lactose-free meals.', _lactoseFree, (newValue) {
                setState(() {
                  _lactoseFree = newValue;
                });
              }),
              _buildSwitchListTile('Vegetarian-free',
                  'Only include gluten-free meals.', _vegetarianFree, (newValue) {
                setState(() {
                  _vegetarianFree = newValue;
                });
              }),
              _buildSwitchListTile(
                  'Vegan-free', 'Only include vegan-free meals.', _veganFree,
                  (newValue) {
                setState(() {
                  _veganFree = newValue;
                });
              }),
            ],
          ))
        ],
      ),
    );
  }
}
