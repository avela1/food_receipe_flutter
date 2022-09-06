import 'package:flutter/material.dart';

import '../models/meals.dart';
import '../widgets/meal_item.dart';

class CategoryMealPage extends StatefulWidget {
  const CategoryMealPage(this.availableMeal, {Key? key}) : super(key: key);
  static const categoryMealRoute = "/category-meal";
  final List<Meal> availableMeal;
  @override
  State<CategoryMealPage> createState() => _CategoryMealPageState();
}

class _CategoryMealPageState extends State<CategoryMealPage> {
  String? categoryTitle;
  var checkLoaded = false;
  late List<Meal> displayedMeal;

  @override
  void didChangeDependencies() {
    if (!checkLoaded) {
      final categoryArguments =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      final String? categoryId = categoryArguments['id'];
      categoryTitle = categoryArguments['title'];

      displayedMeal = widget.availableMeal.where(
        (meal) {
          return meal.categories.contains(categoryId);
        },
      ).toList();
      checkLoaded = true;
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
              title: displayedMeal[index].title,
              id: displayedMeal[index].id,
              imgUrl: displayedMeal[index].imgUrl,
              complexity: displayedMeal[index].complexity,
              affordability: displayedMeal[index].affordability,
              duration: displayedMeal[index].duration,
            );
          },
          itemCount: displayedMeal.length),
    );
  }
}
