import 'package:flutter/material.dart';
import 'data/jokes_data.dart';
import 'model/jokes_model.dart';

Color appColor = Colors.green[300] as Color;

void main() => runApp(const FavoriteCardApp());

class FavoriteCardApp extends StatefulWidget {
  const FavoriteCardApp({super.key});

  @override
  State<FavoriteCardApp> createState() => _FavoriteCardAppState();
}

class _FavoriteCardAppState extends State<FavoriteCardApp> {
  Jokes? favJoke;

  void setFavoriteJoke(Jokes joke) {
    setState(() {
      favJoke = joke;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: appColor,
          title: const Text("Favorite Jokes "),
        ),
        body: Column(
          children: [
            FavoriteCard(
              jokes: j1,
              isFavorite: j1 == favJoke,
              buttonPressed: () => setFavoriteJoke(j1),
            ),
            FavoriteCard(
              jokes: j2,
              isFavorite: j2 == favJoke,
              buttonPressed: () => setFavoriteJoke(j2),
            ),
            FavoriteCard(
              jokes: j3,
              isFavorite: j3 == favJoke,
              buttonPressed: () => setFavoriteJoke(j3),
            ),
          ],
        ),
      ),
    );
  }
}

class FavoriteCard extends StatefulWidget {
  final Jokes jokes;
  final VoidCallback buttonPressed;
  final bool isFavorite;
  const FavoriteCard(
      {super.key,
      required this.jokes,
      required this.buttonPressed,
      required this.isFavorite});

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: .5, color: Colors.grey),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.jokes.title,
                  style:
                      TextStyle(color: appColor, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 10.0),
                Text(widget.jokes.description),
              ],
            ),
          ),
          IconButton(
            onPressed: widget.buttonPressed,
            icon: widget.isFavorite
                ? const Icon(Icons.favorite)
                : const Icon(Icons.favorite_border),
            color: widget.isFavorite ? Colors.red : Colors.grey,
          )
        ],
      ),
    );
  }
}
