import 'package:delifood/widgets/meal_item.dart';
import 'package:flutter/material.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final routesArgs =
    ModalRoute
        .of(context)
        .settings
        .arguments as Map<String, String>;
    final String categoryTitle = routesArgs['title'];
    final String categoryId = routesArgs['id'];
    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: ListView.builder(
        itemBuilder: (context, item) {
          final index = categoryMeals[item];
          return MealItem(
            id: index.id,
            title: index.title,
            imageUrl: index.imageUrl,
            duration: index.duration,
            complexity: index.complexity,
            affordability: index.affordability,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
