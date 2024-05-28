import 'package:flutter/material.dart';
import 'package:recipe_app/recipes.dart';

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Recipe App',
      home: RecipeListScreen(),
    );
  }
}

class RecipeDetailsScreen extends StatelessWidget {
  final String recipeName;
  final String ingredients;
  final String method;

  const RecipeDetailsScreen(this.recipeName, this.ingredients, this.method,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipeName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Ingredients',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              Text(
                ingredients,
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 16),
              const Text(
                'Method',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              // Wrap the method text in a Text widget with \n for new lines
              Text(
                method,
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class RecipeListScreen extends StatefulWidget {
  const RecipeListScreen({super.key});

  @override
  _RecipeListScreenState createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  late int selectedImageIndex;

  @override
  void initState() {
    super.initState();
    selectedImageIndex = -1;
  }

  bool showSearchBox = false;
  String selectedMenuItem = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasty Bites', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
        centerTitle: true,
        leading: PopupMenuButton(
          offset: const Offset(0, 56),
          icon: const Icon(Icons.menu, color: Colors.white),
          itemBuilder: (context) {
            return [
              const PopupMenuItem(
                  value: 'allrecipes', child: Text('All Recipes')),
              const PopupMenuItem(value: 'favorites', child: Text('Favorites')),
              const PopupMenuItem(value: 'dinner', child: Text('Dinner')),
              const PopupMenuItem(value: 'lunch', child: Text('Lunch')),
              const PopupMenuItem(value: 'breakfast', child: Text('Breakfast')),
              const PopupMenuItem(value: 'desserts', child: Text('Desserts')),
            ];
          },
          onSelected: (value) {},
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              setState(() {
                showSearchBox = !showSearchBox;
              });
            },
          ),
          PopupMenuButton(
            offset: const Offset(0, 56),
            icon: const Icon(Icons.more_vert, color: Colors.white),
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                    value: 'myAccount', child: Text('My Account')),
                const PopupMenuItem(value: 'settings', child: Text('Settings')),
              ];
            },
            onSelected: (value) {
              switch (value) {
                case 'allrecipes':
                  break;
                case 'favorites':
                  break;
                case 'dinner':
                  break;
                case 'lunch':
                  break;
                case 'breakfast':
                  break;
                case 'desserts':
                  break;
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
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
                    'All Recipes',
                    style: TextStyle(fontSize: 13, color: Colors.black),
                  ),
                ),
              ],
            ),
            if (showSearchBox)
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: showSearchBox ? 50 : 0,
                padding: const EdgeInsets.all(8),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            const Center(
              child: Text(
                'Recipes',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.blue,
                ),
              ),
            ),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 1,
                mainAxisSpacing: 6,
                childAspectRatio: 1.3,
              ),
              itemCount: recipeImages.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if (recipeDetails.containsKey(recipeNames[index])) {
                      setState(() {
                        selectedImageIndex = index;
                      });

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecipeDetailsScreen(
                            recipeNames[index],
                            recipeDetails[recipeNames[index]]!['ingredients'] ??
                                'Ingredients not available',
                            recipeDetails[recipeNames[index]]!['method'] ??
                                'Method not available',
                          ),
                        ),
                      ).then((value) {
                        if (mounted) {
                          setState(() {
                            selectedImageIndex =
                                -1; // Reset selected image index
                          });
                        }
                      });
                    }
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
                            child: Image.asset(recipeImages[index]),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2.5,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Center(
                              child: Text(
                                recipeNames[index],
                                textAlign: TextAlign.center,
                              ),
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
    );
  }
}
