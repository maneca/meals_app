import 'package:flutter/material.dart';
import '../widgets/listview_meal_item.dart';
import '../models/meal.dart';

class FavouritesScreen extends StatelessWidget{
  final List<Meal> favouriteMeals;

  FavouritesScreen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {

    if(favouriteMeals.isEmpty){
      return Center(child: Text("You have no favourites yet - start adding some"),);
    }else{
      return ListViewMealItem(favouriteMeals);
    }

  }

}