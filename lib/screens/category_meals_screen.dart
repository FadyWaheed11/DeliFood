import 'package:delifood/models/meal.dart';
import 'package:delifood/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  var _loadingInitData = false;

  @override
  void didChangeDependencies() {
    if (!_loadingInitData) {
      final routesArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routesArgs['title'];
      final String categoryId = routesArgs['id'];
      displayedMeals = widget.availableMeals
          .where((meal) => meal.categories.contains(categoryId))
          .toList();
      _loadingInitData = true;
    }
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: ListView.builder(
        itemBuilder: (context, item) {
          final index = displayedMeals[item];
          return MealItem(
            id: index.id,
            title: index.title,
            imageUrl: index.imageUrl,
            duration: index.duration,
            complexity: index.complexity,
            affordability: index.affordability,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
