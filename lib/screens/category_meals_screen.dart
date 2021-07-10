import 'package:flutter/material.dart';

import 'package:flutter_complete_guide/widgets/meal_item.dart';
import '../models/meal.dart';

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

  @override
  void didChangeDependencies() {
    final routeArguments =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    categoryTitle = routeArguments['title'];
    final categoryId = routeArguments['id'];
    displayedMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeMeal (String mealId) {
    setState(() {
      // displayedMeal will be updated 
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            affordability: displayedMeals[index].affordability,
            complexity: displayedMeals[index].complexity,
            duration: displayedMeals[index].duration,
            // removeItem: _removeMeal,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}

  // initState will run before build() runs, however, it will not work because
  // context is not passed to ModalRoute since this initState runs too early
  // We will use didChangeDependencies to fix this

  // @override
  // void initState() {
  //   // get the arguments recived from pushNamed(arguments:)
  //   final routeArguments =
  //       ModalRoute.of(context).settings.arguments as Map<String, String>;
  //   categoryTitle = routeArguments['title'];
  //   final categoryId = routeArguments['id'];
  //   displayedMeals = DUMMY_MEALS.where((meal) {
  //     return meal.categories.contains(categoryId);
  //   }).toList();
  //   super.initState();
  // }

