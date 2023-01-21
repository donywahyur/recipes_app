import 'package:flutter/material.dart';
import 'package:recipes_app/dummy_data.dart';
import 'package:recipes_app/models/category.dart';

class Recipe extends StatefulWidget {
  const Recipe({super.key});

  @override
  State<Recipe> createState() => _RecipeState();
}

class _RecipeState extends State<Recipe> {
  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;
    final food = dummy_food
        .where((food) => food.category.contains(category.id))
        .toList();

    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          leading: IconButton(
            color: Colors.black,
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, false),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            category.title,
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: ListView.builder(
            padding: EdgeInsets.all(10),
            itemCount: food.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => {
                  Navigator.pushNamed(context, '/detail-food',
                      arguments: food[index])
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(food[index].imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              food[index].title,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.timer_outlined,
                                        color: Colors.red),
                                    Text(
                                      '${food[index].duration} menit',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        food[index].favorite =
                                            !food[index].favorite;
                                      });
                                      print(food[index].favorite);
                                    },
                                    icon: Icon(
                                      food[index].favorite
                                          ? Icons.favorite
                                          : Icons.favorite_border_outlined,
                                      color: Colors.redAccent,
                                      size: 30,
                                    ))
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }));
  }
}
