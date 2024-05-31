import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:recipe_app/recipes.dart';
import 'package:recipe_app/screens/add_recipe_screen.dart';
import 'package:recipe_app/screens/favorites_screen.dart';
import 'package:recipe_app/screens/recipe_details_screen.dart';
import 'package:recipe_app/screens/myaccount_screen.dart';
import 'package:recipe_app/screens/settings_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class RecipeApp extends StatelessWidget {
  const RecipeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Recipe App',
      home: RecipeListScreen(),
    );
  }
}

class RecipeListScreen extends StatefulWidget {
  const RecipeListScreen({Key? key}) : super(key: key);

  @override
  _RecipeListScreenState createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  late int selectedImageIndex;
  Map<String, bool> favoriteStatuses = {};
  List<Map<String, String>> userRecipes = [];
  bool isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  List<Map<String, String>> allRecipes = [];
  List<Map<String, String>> filteredRecipes = [];

  final List<String> _defaultImages = [
    'assets/images/bananasplit.png',
    'assets/images/cheesecake.png',
    'assets/images/dumplings.png',
    'assets/images/eggfriedbread.png',
    'assets/images/fish.png',
    'assets/images/greeksalad.png',
    'assets/images/guacamole.png',
    'assets/images/lasagna.png',
    'assets/images/noodles.png',
    'assets/images/omelette.png',
    'assets/images/paella.png',
    'assets/images/pancakes.png',
    'assets/images/pie.png',
    'assets/images/pizza.png',
    'assets/images/pretzel.png',
    'assets/images/sesarsalad.png',
    'assets/images/smileysushi.png',
    'assets/images/spagetti.png',
    'assets/images/sushi.png',
    'assets/images/taco.png',
  ];

  @override
  void initState() {
    super.initState();
    selectedImageIndex = -1;
    _loadFavoriteStatuses();
    _loadAllRecipes();
  }

  void _loadFavoriteStatuses() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      for (String recipeName in recipeNames) {
        favoriteStatuses[recipeName] = prefs.getBool(recipeName) ?? false;
      }
      for (var recipe in userRecipes) {
        favoriteStatuses[recipe['id']!] = prefs.getBool(recipe['id']!) ?? false;
      }
    });
  }

  void _loadAllRecipes() {
    setState(() {
      allRecipes = [
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
        ...userRecipes,
      ];
      _searchRecipes(_searchController.text); // Apply search filter if search query is not empty
    });
  }

  void _addRecipe(Map<String, String> recipe) {
    setState(() {
      recipe['id'] = DateTime.now().millisecondsSinceEpoch.toString();
      userRecipes.add(recipe);
      favoriteStatuses[recipe['id']!] = false;
      _loadAllRecipes(); // Reload recipes after adding a new one
    });
  }

  void _deleteRecipe(String recipeId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      if (recipeNames.contains(recipeId)) {
        int index = recipeNames.indexOf(recipeId);
        recipeNames.removeAt(index);
        recipeImages.removeAt(index);
        recipeDetails.remove(recipeId);
      } else {
        userRecipes.removeWhere((recipe) => recipe['id'] == recipeId);
      }
      favoriteStatuses.remove(recipeId);
      prefs.remove(recipeId);
      _loadAllRecipes(); // Reload recipes after deleting one
    });
  }

  void _searchRecipes(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredRecipes = [...allRecipes]; // Reset to display all recipes if query is empty
      } else {
        // Filter recipes based on query
        filteredRecipes = allRecipes.where((recipe) {
          return recipe['title']!.toLowerCase().contains(query.toLowerCase()) ||
              recipe['ingredients']!.toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5DC),
      appBar: AppBar(
        title: !isSearching
            ? const Text('Tasty Bites', style: TextStyle(color: Colors.white))
            : TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: 'Search...',
            border: InputBorder.none,
          ),
          style: const TextStyle(color: Colors.white),
          onChanged: _searchRecipes,
        ),
        backgroundColor: const Color(0xFF00BCD4),
        centerTitle: true,
        leading: PopupMenuButton(
          offset: const Offset(0, 56),
          icon: const Icon(Icons.menu, color: Colors.white),
          itemBuilder: (context) {
            return [
              const PopupMenuItem(value: 'favorites', child: Text('Favorites')),
            ];
          },
          onSelected: (value) {
            setState(() {
              if (value == 'favorites') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FavoritesScreen(
                      userRecipes: userRecipes,
                      onDelete: _deleteRecipe,
                    ),
                  ),
                );
              }
            });
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(isSearching ? Icons.close : Icons.search, color: Colors.white),
            onPressed: () {
              setState(() {
                if (isSearching) {
                  _searchController.clear();
                  _searchRecipes(''); // Clear search query and display all recipes
                }
                isSearching = !isSearching;
              });
            },
          ),
          PopupMenuButton(
            offset: const Offset(0, 56),
            icon: const Icon(Icons.more_vert, color: Colors.white),
            itemBuilder: (context) {
              return [
                const PopupMenuItem(value: 'myAccount', child: Text('My Account')),
                const PopupMenuItem(value: 'settings', child: Text('Settings')),
              ];
            },
            onSelected: (value) {
              setState(() {
                if (value == 'myAccount') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyAccountScreen(),
                    ),
                  );
                } else if (value == 'settings') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsScreen()),
                  );
                }
              });
              // Handle menu item selection if needed
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(height: 10),
            Center(
              child: Text(
                'ALL RECIPES',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: GoogleFonts.playfairDisplay().fontFamily, // Using Google Fonts
                ),
              ),
            ),
            const SizedBox(height: 10),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 1,
                mainAxisSpacing: 6,
                childAspectRatio: 1.3,
              ),
              itemCount: filteredRecipes.length,
              itemBuilder: (context, index) {
                String imagePath = filteredRecipes[index].containsKey('image')
                    ? filteredRecipes[index]['image']!
                    : _defaultImages[0]; // Default to the first image if not found

                return GestureDetector(
                  onTap: () {
                    String selectedRecipeId = filteredRecipes[index]['id']!;
                    String selectedRecipeName = filteredRecipes[index]['title']!;
                    String selectedRecipeIngredients = filteredRecipes[index]['ingredients']!;
                    String selectedRecipeMethod = filteredRecipes[index]['method']!;

                    setState(() {
                      selectedImageIndex = index;
                    });

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecipeDetailsScreen(
                          recipeId: selectedRecipeId,
                          recipeName: selectedRecipeName,
                          ingredients: selectedRecipeIngredients,
                          method: selectedRecipeMethod,
                          imagePath: imagePath,
                          onDelete: _deleteRecipe,
                        ),
                      ),
                    ).then((value) {
                      if (mounted) {
                        setState(() {
                          selectedImageIndex = -1; // Reset selected image index
                        });
                      }
                    });
                  },
                  onLongPress: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Delete Recipe'),
                        content: const Text('Are you sure you want to delete this recipe?'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              _deleteRecipe(filteredRecipes[index]['id']!);
                              Navigator.pop(context);
                            },
                            child: const Text('Delete'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            color: selectedImageIndex == index
                                ? Colors.grey.withOpacity(0.5)
                                : Colors.transparent,
                            child: Image.asset(imagePath),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Center(
                            child: Text(
                              filteredRecipes[index]['title']!,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newRecipe = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddRecipeScreen()),
          );

          if (newRecipe != null) {
            _addRecipe(newRecipe);
          }
        },
        child: const Icon(Icons.add),
        backgroundColor: const Color(0xFF00BCD4)
      ),
    );
  }
}
