import 'package:flutter/material.dart';

import '../models/meals.dart';
import '../page/meal_detail_page.dart';

// ignore: must_be_immutable
class MealItem extends StatelessWidget {
  final String title;
  final String id;
  final String imgUrl;
  final Complexity complexity;
  final Affordability affordability;
  final int duration;

  const MealItem({
    Key? key,
    required this.title,
    required this.id,
    required this.imgUrl,
    required this.complexity,
    required this.affordability,
    required this.duration,
  }) : super(key: key);

  String get complexityText {
    switch (complexity) {
      case Complexity.Challenging:
        return "Challenging";
      case Complexity.Hard:
        return "Hard";
      case Complexity.Simple:
        return "Simple";
      default:
        return "unknown";
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordability";
      case Affordability.Luxurious:
        return "Luxurious";
      case Affordability.Pricey:
        return "Pricey";
      default:
        return "unknown";
    }
  }

  void selectMealDetail(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealDetailPage.mealDetailRoute, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMealDetail(context),
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(imgUrl,
                      height: 250, width: double.infinity, fit: BoxFit.cover),
                ),
                Positioned(
                  bottom: 5,
                  right: 15,
                  child: Container(
                    color: Colors.black54,
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    width: 300,
                    child: Text(title,
                        style: const TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.fade,
                        softWrap: true),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(children: [
                    const Icon(
                      Icons.timelapse,
                      color: Colors.green,
                      size: 24.0,
                      semanticLabel: 'Time Taken',
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      '$duration min',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )
                  ]),
                  Row(children: [
                    const Icon(
                      Icons.work,
                      color: Colors.blue,
                      size: 24.0,
                      semanticLabel: 'Time Taken',
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      complexityText,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )
                  ]),
                  Row(children: [
                    const Icon(
                      Icons.attach_money,
                      color: Colors.pink,
                      size: 24.0,
                      semanticLabel: 'Time Taken',
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      affordabilityText,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
