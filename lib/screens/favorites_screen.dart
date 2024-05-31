import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:recipe_app/recipes.dart';
import 'package:recipe_app/screens/recipe_details_screen.dart';

class FavoritesScreen extends StatefulWidget {
  final List<Map<String, String>> userRecipes;
  final void Function(String) onDelete;

  const FavoritesScreen({
    Key? key,
    required this.userRecipes,
    required this.onDelete,
  }) : super(key: key);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<Map<String, String>> favoriteRecipes = [];
  Map<String, bool> favoriteStatuses = {};

  @override
  void initState() {
    super.initState();
    _loadFavoriteRecipes();
  }

  void _loadFavoriteRecipes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Map<String, String>> allRecipes = [
      ...List.generate(
        recipeNames.length,
            (index) => {
          'id': recipeNames[index],
          'title': recipeNames[index],
          'ingredients': recipeDetails[recipeNames[index]]!['ingredients']!,
          'method': recipeDetails[recipeNames[index]]!['method']!,
          'image': recipeImages[index],
        },
      ),
      ...widget.userRecipes,
    ];
    List<Map<String, String>> favorites = [];

    for (var recipe in allRecipes) {
      if (prefs.getBool(recipe['id']!) ?? false) {
        favorites.add(recipe);
      }
    }

    setState(() {
      favoriteRecipes = favorites;
      favoriteStatuses = Map.fromIterable(
        allRecipes,
        key: (recipe) => recipe['id']!,
        value: (recipe) => prefs.getBool(recipe['id']!) ?? false,
      );
    });
  }

  void _toggleFavorite(String recipeId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      favoriteStatuses[recipeId] = !(favoriteStatuses[recipeId] ?? false);
      prefs.setBool(recipeId, favoriteStatuses[recipeId]!);
      _loadFavoriteRecipes();
    });
  }

  void _confirmUnfavorite(String recipeId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Unfavorite Recipe',),
          content: const Text('Are you sure you want to remove this item from your favorite list?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                _toggleFavorite(recipeId); // Unfavorite the recipe
              },
              child: const Text('Unfavorite'),
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
        title: const Text('Favorite Recipes', style: TextStyle(color: Colors.white),),
        backgroundColor: const Color(0xFF00BCD4),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: favoriteRecipes.isEmpty
          ? const Center(child: Text('No favorite recipes yet.'))
          : SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Text(
                    'Favorites',
                    style: TextStyle(fontSize: 13, color: Colors.black),
                  ),
                ),
              ],
            ),
            GridView.builder(
              padding: const EdgeInsets.all(10.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.3,
              ),
              itemCount: favoriteRecipes.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                String recipeId = favoriteRecipes[index]['id']!;
                String recipeName = favoriteRecipes[index]['title']!;
                String ingredients = favoriteRecipes[index]['ingredients']!;
                String method = favoriteRecipes[index]['method']!;
                String imagePath = favoriteRecipes[index].containsKey('image')
                    ? favoriteRecipes[index]['image']!
                    : 'assets/images/default_recipe.png';

                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RecipeDetailsScreen(
                              recipeId: recipeId,
                              recipeName: recipeName,
                              ingredients: ingredients,
                              method: method,
                              imagePath: imagePath,
                              onDelete: widget.onDelete,
                            ),
                          ),
                        ).then((recipeId) {
                          if (recipeId != null) {
                            setState(() {
                              favoriteRecipes.removeWhere((recipe) => recipe['id'] == recipeId);
                            });
                          }
                        });
                      },
                      child: Image.asset(imagePath, fit: BoxFit.cover),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        recipeName,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                    Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        _confirmUnfavorite(recipeId);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00BCD4),
                      ),
                      child: const Text('Unfavorite', style: TextStyle(color: Colors.black),),
                    ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}