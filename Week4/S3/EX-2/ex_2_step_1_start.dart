import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Favorite cards"),
        ),
        body: const Column(
          children: [
            Card(title: 'hi', description: 'hi'),
            Card(title: 'hi', description: 'hi'),
            Card(title: 'hi', description: 'hi'),
            Card(title: 'hi', description: 'hi'),
          ],
        ),
      ),
    ));

class Card extends StatefulWidget {
  final String title;
  final String description;

  const Card({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  State<Card> createState() => _CardState();
}

class _CardState extends State<Card> {
  bool isFavorite = false;

  void isFavoriteButton() {
    setState(() {
      isFavorite = isFavorite ? false : true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30.0),
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: Colors.black54, width: BorderSide.strokeAlignCenter))),
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.title),
              Text(widget.description),
            ],
          )),
          IconButton(
            icon: isFavorite
                ? const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )
                : const Icon(Icons.favorite_border),
            onPressed: () => {isFavoriteButton()},
          ),
        ],
      ),
    );
  }
}
