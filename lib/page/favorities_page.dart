import 'package:flutter/material.dart';

import '../models/meals.dart';
import '../widgets/meal_item.dart';

class FavoritiesPage extends StatelessWidget {
  const FavoritiesPage(this.favoritesMeal, {Key? key}) : super(key: key);
  final List<Meal> favoritesMeal;

  @override
  Widget build(BuildContext context) {
    if (favoritesMeal.isNotEmpty) {
      return ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
              title: favoritesMeal[index].title,
              id: favoritesMeal[index].id,
              imgUrl: favoritesMeal[index].imgUrl,
              complexity: favoritesMeal[index].complexity,
              affordability: favoritesMeal[index].affordability,
              duration: favoritesMeal[index].duration,
            );
          },
          itemCount: favoritesMeal.length);
    } else {
      return const Center(
          child: Text(
              'You have no any favorite meals yeat. so please add so meals'));
    }
  }
}
