import 'package:delifood/models/meal.dart';
import 'package:delifood/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal>favoriteMeals;
  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if(favoriteMeals.isEmpty){
      return Center(
        child: Text('Favorites'),
      );
    }else
      {
        return ListView.builder(
          itemBuilder: (context, item) {
            final index = favoriteMeals[item];
            return MealItem(
              id: index.id,
              title: index.title,
              imageUrl: index.imageUrl,
              duration: index.duration,
              complexity: index.complexity,
              affordability: index.affordability,
            );
          },
          itemCount: favoriteMeals.length,
        );
      }
  }
}
