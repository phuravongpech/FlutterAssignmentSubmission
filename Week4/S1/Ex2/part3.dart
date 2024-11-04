import 'package:flutter/material.dart';

const String dartImage = 'assets/images/w4/dart.png';
const String flutterImage = 'assets/images/w4/flutter.png';
const String fireBaseImage = 'assets/images/w4/firebase.png';

enum Product {
  dart(
    title: 'Dart',
    description: 'A programming language ',
    image: dartImage,
  ),
  flutter(
    title: 'Flutter',
    description: 'widget lib',
    image: flutterImage,
  ),
  firebase(
    title: 'Firebase',
    description: 'cloud database.',
    image: fireBaseImage,
  );

  final String title;
  final String description;
  final String image;

  const Product({
    required this.title,
    required this.description,
    required this.image,
  });
}

class ProductCard extends StatelessWidget {
  final Product type;

  const ProductCard({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(
          20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Image.asset(
                type.image,
                width: 100,
                colorBlendMode: BlendMode.multiply,
              )
            ]),
            Text(
              type.title,
              style: const TextStyle(fontSize: 30),
            ),
            Text(type.description)
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.blue[400],
      body: const Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            ProductCard(type: Product.dart),
            ProductCard(type: Product.flutter),
            ProductCard(type: Product.firebase),
          ],
        ),
      ),
    ),
  ));
}
