import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "/filters";
  final Function saveFilters;
  final Map<String, bool> filters;

  FiltersScreen(this.filters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegan = false;
  var _vegetarian = false;
  var _lactoseFree = false;

  @override
  initState(){
    _glutenFree = widget.filters["gluten"];
    _lactoseFree = widget.filters["lactose"];
    _vegetarian = widget.filters["vegetarian"];
    _vegan = widget.filters["vegan"];
    super.initState();
  }

  Widget _buildSwitchListTile(
      String title, String subtitle, bool currentValue, Function updateValue) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        value: currentValue,
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Filters"),
          actions: [
            IconButton(icon: Icon(Icons.save), onPressed: () {

              final selectedFilters = {
                "gluten": _glutenFree,
                "lactose": _lactoseFree,
                "vegan": _vegan,
                "vegetarian": _vegetarian
              };
              widget.saveFilters(selectedFilters);
              Navigator.of(context).pushNamed("/");
            })
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "Adjust your meal selection",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            // Expanded will get the remaining screen space between the container and the end of the screen
            Expanded(
              child: ListView(
                children: [
                  _buildSwitchListTile(
                      "Gluten free",
                      "Only include gluten free meals",
                      _glutenFree, (newValue) {
                        setState(() {
                          _glutenFree = newValue;
                        });
                  }),
                  _buildSwitchListTile(
                      "Lactose free",
                      "Only include lactose free meals",
                      _lactoseFree, (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  }),
                  _buildSwitchListTile(
                      "Vegetarian",
                      "Only include vegetarian meals",
                      _vegetarian, (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  }),
                  _buildSwitchListTile(
                      "Vegan free",
                      "Only include vegan meals",
                      _vegan, (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  }),
                ],
              ),
            )
          ],
        ));
  }
}
