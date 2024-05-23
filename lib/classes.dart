import 'package:flutter/material.dart';
import 'package:recipe_app/main.dart';

class RecipeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      home: RecipeListScreen(),
    );
  }
}

class RecipeListScreen extends StatefulWidget {
  @override
  _RecipeListScreenState createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  List<String> recipes = ['Breakfast', 'Lunch', 'Dinner', 'Healthy', 'Deserts'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(35), // Adjust the height as needed
        child: AppBar(
          title: const Text(
            'Tasty Bites',
            style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic, color: Colors.white),
          ),
          backgroundColor: Colors.green,
          centerTitle: true,
        ),
      ),
      body: Column(
          children: <Widget>[
      const SizedBox(height: 20), // Add some spacing at the top
      Center(
        child: Text(
          'Recipes',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: Colors.blue),
        ),
      ),
          Expanded(
          child: ListView.builder(
            shrinkWrap: true, // Allow the ListView to scroll within the Column
            itemCount: recipes.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(recipes[index]),
              );
            },
          ),
            )
        ],
      ),
    );
  }
}