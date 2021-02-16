import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = "/meal-details";
  final Function toggleFavourite;
  final Function isFavourite;

  MealDetailsScreen(this.toggleFavourite, this.isFavourite);


  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    Widget buildSectionTitle(BuildContext context, String title){
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
      );
    }

    Widget buildContainer(Widget child){
      return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: 200,
        width: MediaQuery.of(context).size.width, // so we can adjust to different screen sizes
        child: child,
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("${selectedMeal.title}"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(selectedMeal.imageUrl, fit: BoxFit.cover),
              ),
              buildSectionTitle(context, "Ingredients"),
              // Using a listview inside a container because we needed to
              // defined a fixed height for the listview, otherwise it would
              // give an error with the Column
              buildContainer(
                ListView.builder(
                  itemBuilder: (ctx, index) => Card(
                    color: Theme.of(ctx).accentColor,
                    child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Text(selectedMeal.ingredients[index])),
                  ),
                  itemCount: selectedMeal.ingredients.length,
                ),
              ),
              buildSectionTitle(context, "Steps"),
              buildContainer(ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text("# ${(index + 1)}"),
                      ),
                      title: Text(selectedMeal.steps[index]),
                    ),
                    Divider()
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ))
            ],
          ),
        ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isFavourite(mealId) ? Icons.star : Icons.star_border),
        onPressed: () => toggleFavourite(mealId),
      ),
    );
  }
}
