import 'package:flutter/material.dart';

import 'dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final routesArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String categoryTitle = routesArgs['title'];
    final String categoryId = routesArgs['id'];
    final categoryMeals =
        DUMMY_MEALS.where((meal) => meal.categories.contains(categoryId)).toList();
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: ListView.builder(itemBuilder: (context, item) {
        return Text(categoryMeals[item].title);
      },itemCount: categoryMeals.length,),
    );
  }
}
