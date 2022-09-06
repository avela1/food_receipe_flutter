import 'package:flutter/material.dart';

import '../models/dummy_data.dart';

class MealDetailPage extends StatelessWidget {
  const MealDetailPage(this.toggleFavorites, this.isMealFavorite, {Key? key})
      : super(key: key);
  final Function toggleFavorites;
  final Function isMealFavorite;
  static const mealDetailRoute = "/meal_detail";

  Widget buildDivider() {
    return const Divider(
      thickness: 3, // thickness of the line
      indent: 60, // empty space to the leading edge of divider.
      endIndent: 60, // empty space to the trailing edge of the divider.
      color: Colors.white, // The color to use when painting the line.
    );
  }

  Widget buildTitles(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.subtitle2?.copyWith(
              fontSize: 30,
              // color: Theme.of(context).colorScheme.primary,
            ),
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey),
      ),
      height: 300,
      width: 350,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealIdArguments =
        ModalRoute.of(context)?.settings.arguments as String;

    final mealDetail =
        DUMMY_MEALS.firstWhere((meal) => (meal.id == mealIdArguments));
    return Scaffold(
      appBar: AppBar(title: Text(mealDetail.title)),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: ClipRRect(
              child: Image.network(
                mealDetail.imgUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          buildDivider(),
          buildTitles(context, 'INGREDIENTS'),
          buildDivider(),
          buildContainer(
            ListView.builder(
              itemBuilder: ((context, index) {
                return Card(
                  color: Theme.of(context).colorScheme.primary,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Text(
                      mealDetail.ingredients[index],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              }),
              itemCount: mealDetail.ingredients.length,
            ),
          ),
          buildDivider(),
          buildTitles(context, 'STEPS'),
          buildDivider(),
          buildContainer(
            ListView.builder(
              itemBuilder: ((context, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text(
                          '#${index + 1}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20),
                        ),
                        backgroundColor: Theme.of(context).colorScheme.primary,
                      ),
                      title: Text(mealDetail.steps[index]),
                    ),
                    const Divider(
                      color: Colors
                          .black, // The color to use when painting the line.
                    ),
                  ],
                );
              }),
              itemCount: mealDetail.steps.length,
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            isMealFavorite(mealIdArguments) ? Icons.star : Icons.star_border,
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
          onPressed: () {
            toggleFavorites(mealIdArguments);
          }),
    );
  }
}
