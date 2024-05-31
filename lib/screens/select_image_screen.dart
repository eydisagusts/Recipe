import 'package:flutter/material.dart';

class SelectImageScreen extends StatelessWidget {
  const SelectImageScreen({Key? key}) : super(key: key);

  final List<String> _defaultImages = const [
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Image'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 6,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
        ),
        itemCount: _defaultImages.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pop(context, _defaultImages[index]);
            },
            child: Container(
              width: 100,  // Specify the width
              height: 100, // Specify the height
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.transparent,
                  width: 3,
                ),
              ),
              child: Image.asset(_defaultImages[index], fit: BoxFit.cover),
            ),
          );
        },
      ),
    );
  }
}
