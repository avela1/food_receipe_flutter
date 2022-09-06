import 'package:flutter/material.dart';

import './models/meals.dart';
import './models/dummy_data.dart';
import './page/filters_page.dart';
import './page/taps_controller_page.dart';
import './page/category_meal_page.dart';
import './page/meal_detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  Map<String, bool> _filters = {
    'glueten': false,
    'lactose': false,
    'vegan': false,
    'vegiterian': false,
  };

  List<Meal> _availableMeal = DUMMY_MEALS;
  // ignore: prefer_final_fields
  List<Meal> _favoritesMeal = [];

  void _setFilters(Map<String, bool> filtersdata) {
    setState(() {
      _filters = filtersdata;
      _availableMeal = DUMMY_MEALS.where((element) {
        if (_filters['glueten']! && !element.isGlutenFree) {
          return false;
        }
        if (_filters['lactose']! && !element.isLactoseFree) {
          return false;
        }
        if (_filters['vegan']! && !element.isVegan) {
          return false;
        }
        if (_filters['vegiterian']! && !element.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  bool _isMealFavorite(String mealId) {
    return _favoritesMeal.any((element) => mealId == element.id);
  }

  void _toggleFavorites(String mealId) {
    final indexOfMeal =
        _favoritesMeal.indexWhere((element) => element.id == mealId);
    if (indexOfMeal >= 0) {
      setState(() {
        _favoritesMeal.removeAt(indexOfMeal);
      });
    } else {
      setState(() {
        _favoritesMeal
            .add(DUMMY_MEALS.firstWhere((element) => mealId == element.id));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Recipe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: const Color.fromARGB(255, 215, 204, 209),
        fontFamily: 'Raleway',
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        textTheme: ThemeData.light().textTheme.copyWith(
              subtitle1: const TextStyle(
                  fontFamily: 'RobontoCondensed',
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              subtitle2: const TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
            .copyWith(secondary: Colors.amber),
      ),
      // home: const CategoriesPage(
      //   title: 'Daily Food Recipe',
      // ),
      routes: {
        '/': (context) => TapsControllerPage(_favoritesMeal),
        CategoryMealPage.categoryMealRoute: (context) =>
            CategoryMealPage(_availableMeal),
        MealDetailPage.mealDetailRoute: (context) =>
            MealDetailPage(_toggleFavorites, _isMealFavorite),
        FiltersPage.filtersRoute: (context) =>
            FiltersPage(_filters, _setFilters),
      },
    );
  }
}
