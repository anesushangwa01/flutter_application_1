// lib/widgets/favorite_item.dart
import 'package:flutter/material.dart';

class FavoriteItem extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  FavoriteItem({
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: ListTile(
        leading: Image.asset(
          imagePath,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        title: Text(title),
        subtitle: Text(description),
      ),
    );
  }
}