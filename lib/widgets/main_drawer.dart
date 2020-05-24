import 'package:delifood/screens/filter_screen.dart';
import 'package:delifood/screens/tabs_screen.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon,Function tabHandler) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24.0,
            fontWeight: FontWeight.bold),
      ),
      leading: Icon(
        icon,
        size: 26.0,
      ),
      onTap: tabHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120.0,
            width: double.infinity,
            padding: const EdgeInsets.all(20.0),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30.0,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          buildListTile('Meals', Icons.restaurant,(){
            Navigator.pushReplacementNamed(context, TabsScreen.routeName);
          }),
          buildListTile('Filters', Icons.settings,(){
            Navigator.pushReplacementNamed(context, FilterScreen.routeName);
          }),
        ],
      ),
    );
  }
}
