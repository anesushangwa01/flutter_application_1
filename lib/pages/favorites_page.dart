// lib/pages/favorites_page.dart
import 'package:flutter/material.dart';
import '../app_state.dart';
import '../widgets/favorite_item.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) {
      return Center(
        child: Text('No favorites yet.'),
      );
    }

    return ListView.builder(
      itemCount: appState.favorites.length,
      itemBuilder: (context, index) {
        var favorite = appState.favorites[index];
        return FavoriteItem(
          title: favorite.title,
          description: favorite.description,
          imagePath: favorite.imagePath,
        );
      },
    );
  }
}