// lib/app_state.dart
import 'package:flutter/material.dart';

class FavoriteData {
  final String title;
  final String description;

  FavoriteData({
    required this.title,
    required this.description,
  });
}

class MyAppState extends ChangeNotifier {
  final List<FavoriteData> favorites = [];

  void addFavorite(String title, String description) {
    favorites.add(FavoriteData(
      title: title,
      description: description,
    ));
    notifyListeners();
  }
}