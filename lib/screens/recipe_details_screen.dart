import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecipeDetailsScreen extends StatefulWidget {
  final String recipeId;
  final String recipeName;
  final String ingredients;
  final String method;
  final String imagePath;
  final void Function(String) onDelete;

  const RecipeDetailsScreen({
    Key? key,
    required this.recipeId,
    required this.recipeName,
    required this.ingredients,
    required this.method,
    required this.imagePath,
    required this.onDelete,
  }) : super(key: key);

  @override
  _RecipeDetailsScreenState createState() => _RecipeDetailsScreenState();
}

class _RecipeDetailsScreenState extends State<RecipeDetailsScreen> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _loadFavoriteStatus();
  }

  void _loadFavoriteStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isFavorite = prefs.getBool(widget.recipeId) ?? false;
    });
  }

  void _toggleFavorite() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isFavorite = !isFavorite;
      prefs.setBool(widget.recipeId, isFavorite);
    });
  }

  void _confirmDelete() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Recipe'),
          content: const Text('Are you sure you want to delete this recipe?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                widget.onDelete(widget.recipeId);
                Navigator.of(context).pop(); // Close the dialog
                Navigator.of(context).pop(); // Close the details screen
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5DC),
      appBar: AppBar(
        title: Text(
          widget.recipeName,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF00BCD4),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.white,
            ),
            onPressed: _toggleFavorite,
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: _confirmDelete,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(widget.imagePath, fit: BoxFit.cover),
              ),
              const SizedBox(height: 16),
              const Text(
                'Ingredients',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(widget.ingredients),
              const SizedBox(height: 16),
              const Text(
                'Method',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(widget.method),
            ],
          ),
        ),
      ),
    );
  }
}
