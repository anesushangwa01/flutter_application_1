// lib/pages/add_favorite_page.dart
import 'package:flutter/material.dart';
import '../app_state.dart';
import 'package:provider/provider.dart';

class AddFavoritePage extends StatefulWidget {
  @override
  _AddFavoritePageState createState() => _AddFavoritePageState();
}

class _AddFavoritePageState extends State<AddFavoritePage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  String _imagePath = '';

  void _pickImage() async {
    // For simplicity, use a local image path
    // In a real app, use the `image_picker` package to select an image
    setState(() {
      _imagePath = 'assets/sample_image.jpg'; // Replace with actual image picking logic
    });
  }

  void _submitForm() {
    if (_formKey.currentState!.validate() && _imagePath.isNotEmpty) {
      final title = _titleController.text;
      final description = _descriptionController.text;

      // Add the favorite to the app state
      Provider.of<MyAppState>(context, listen: false).addFavorite(
        title,
        description,
        _imagePath,
      );

      // Clear the form
      _titleController.clear();
      _descriptionController.clear();
      setState(() {
        _imagePath = '';
      });

      // Optionally, navigate to the FavoritesPage
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Favorite'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              if (_imagePath.isNotEmpty)
                Image.asset(
                  _imagePath,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ElevatedButton(
                onPressed: _pickImage,
                child: Text('Pick Image'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Add Favorite'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}