// lib/app_state.dart
import 'package:flutter/material.dart';

class FavoriteData {
  final String title;
  final String description;
  final String imagePath;

  FavoriteData({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}

class MyAppState extends ChangeNotifier {
  final List<FavoriteData> favorites = [];

  void addFavorite(String title, String description, String imagePath) {
    favorites.add(FavoriteData(
      title: title,
      description: description,
      imagePath: imagePath,
    ));
    notifyListeners();
  }
}