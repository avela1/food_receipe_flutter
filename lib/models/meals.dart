// ignore_for_file: constant_identifier_names

enum Complexity {
  Simple,
  Challenging,
  Hard,
}

enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imgUrl;
  final List<String> steps;
  final List<String> ingredients;
  final Complexity complexity;
  final Affordability affordability;
  final int duration;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegetarian;
  final bool isVegan;

  const Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.imgUrl,
    required this.steps,
    required this.ingredients,
    required this.complexity,
    required this.affordability,
    required this.duration,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
  });
}
