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

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final title = _titleController.text;
      final description = _descriptionController.text;

      Provider.of<MyAppState>(context, listen: false).addFavorite(title, description);

      _titleController.clear();
      _descriptionController.clear();

      if (Navigator.canPop(context)) {
        Navigator.pop(context);
      } else {
        print("No route to pop!");
        // Options for handling no route:
        // 1. Stay on the page (do nothing).
        // 2. Navigate to a default route (e.g., home):
        // Navigator.pushNamed(context, '/'); // Or Navigator.pushReplacementNamed
        // 3. Show a message (SnackBar, Dialog):
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Favorite added."))); // User-friendly message
      }
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