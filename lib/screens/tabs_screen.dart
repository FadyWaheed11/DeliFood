import 'package:delifood/screens/favorites_screen.dart';
import 'package:delifood/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'categories_screen.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/home';
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Meals'),
            bottom: TabBar(
              unselectedLabelColor: Colors.blueGrey.withOpacity(0.7),
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.category),
                  text: 'Categories',
                ),
                Tab(
                  icon: Icon(Icons.star),
                  text: 'Favorites',
                ),
              ],
            ),
          ),
          drawer: MainDrawer(),
          body: TabBarView(
              children: <Widget>[CategoriesScreen(), FavoritesScreen()]),
        ));
  }
}
