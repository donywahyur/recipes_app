import 'package:flutter/material.dart';
import 'package:recipes_app/models/category.dart';

class CategoryItem extends StatefulWidget {
  final Category category;
  const CategoryItem({super.key, required this.category});

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    final category = widget.category;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/recipe', arguments: category);
      },
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 10,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey,
            image: DecorationImage(
                image: NetworkImage(category.imageUrl), fit: BoxFit.cover)),
        child: Container(
          padding: EdgeInsets.all(15),
          alignment: Alignment.bottomLeft,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topRight,
                stops: [0.1, 0.8],
                colors: [Colors.black, Colors.transparent],
              )),
          child: Text(category.title,
              style: TextStyle(color: Colors.white, fontSize: 20)),
        ),
      ),
    );
  }
}
