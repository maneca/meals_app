import 'package:flutter/material.dart';
import '../models/meal.dart';
import './meal_item.dart';

class ListViewMealItem extends StatelessWidget{
  final List<Meal> meals;

  ListViewMealItem(this.meals);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return MealItem(
          id: meals[index].id,
          title: meals[index].title,
          imageUrl: meals[index].imageUrl,
          duration: meals[index].duration,
          complexity: meals[index].complexity,
          affordability: meals[index].affordability
        );
      },
      itemCount: meals.length,
    );
  }
}