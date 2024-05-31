import 'package:flutter/material.dart';

class AddRecipeScreen extends StatefulWidget {
  const AddRecipeScreen({Key? key}) : super(key: key);

  @override
  _AddRecipeScreenState createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  final _formKey = GlobalKey<FormState>();
  String _recipeTitle = '';
  String _selectedImage = ''; // Initialize selected image variable
  List<TextEditingController> _methodControllers = [];
  TextEditingController _ingredientsController = TextEditingController();

  final List<String> _defaultImages = [
    'assets/images/cheesecake.png',
    'assets/images/bananasplit.png',
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

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.pop(context, {
        'title': _recipeTitle,
        'ingredients': _ingredientsController.text,
        'method': _getMethodText(),
        'image': _selectedImage.isNotEmpty ? _selectedImage : _defaultImages[0],
      });
    }
  }

  String _getMethodText() {
    String method = '';
    for (int i = 0; i < _methodControllers.length; i++) {
      if (_methodControllers[i].text.trim().isNotEmpty) {
        method += '${i + 1}. ${_methodControllers[i].text}\n';
      }
    }
    return method.trim();
  }

  @override
  void initState() {
    super.initState();
    _methodControllers.add(TextEditingController());
  }

  @override
  void dispose() {
    _methodControllers.forEach((controller) => controller.dispose());
    _ingredientsController.dispose();
    super.dispose();
  }

  void _showImagePicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 6, // Display 6 images per row
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: _defaultImages.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedImage = _defaultImages[index]; // Update selected image here
                  });
                  Navigator.pop(context); // Close the bottom sheet after selection
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: _selectedImage == _defaultImages[index]
                          ? Colors.blue
                          : Colors.transparent,
                      width: 3,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(_defaultImages[index], fit: BoxFit.cover),
                      ),
                      if (_selectedImage == _defaultImages[index])
                        Positioned(
                          bottom: 5,
                          right: 5,
                          child: Icon(
                            Icons.check_circle,
                            color: Colors.blue,
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5DC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF00BCD4),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Text(
            'Add New Recipe',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Recipe Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a recipe title';
                  }
                  return null;
                },
                onSaved: (value) {
                  _recipeTitle = value!;
                },
              ),
              TextFormField(
                controller: _ingredientsController,
                decoration: const InputDecoration(labelText: 'Ingredients'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the ingredients';
                  }
                  return null;
                },
                maxLines: 5,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Method',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: _methodControllers.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            children: [
                              Text(
                                '${index + 1}.',
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: TextFormField(
                                  controller: _methodControllers[index],
                                  onChanged: (value) {
                                    if (value.isNotEmpty && index == _methodControllers.length - 1) {
                                      _methodControllers.add(TextEditingController());
                                      setState(() {});
                                    }
                                  },
                                  decoration: const InputDecoration(
                                    labelText: 'Step',
                                    border: OutlineInputBorder(),
                                  ),
                                  maxLines: null,
                                  textCapitalization: TextCapitalization.sentences,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Select an Image',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _showImagePicker,
                child: const Text('Choose Image', style: TextStyle(color: Colors.black),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00BCD4),
                ),
              ),
              const SizedBox(height: 10),
              if (_selectedImage.isNotEmpty)
                Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue,
                        width: 3,
                      ),
                    ),
                    child: Image.asset(_selectedImage, fit: BoxFit.cover),
                  ),
                ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Submit', style: TextStyle(color: Colors.black),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00BCD4),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
