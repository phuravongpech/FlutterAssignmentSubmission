import 'package:flutter/material.dart';

List<String> images = [
  "assets/images/w4-s2/bird.jpg",
  "assets/images/w4-s2/bird2.jpg",
  "assets/images/w4-s2/insect.jpg",
  "assets/images/w4-s2/girl.jpg",
  "assets/images/w4-s2/man.jpg",
];

void main() => runApp(const MaterialApp(
    debugShowCheckedModeBanner: false, // Why this line ? Can you explain it ?
    //to hide the debug on top right of the screen
    home: ImageCard()));

class ImageCard extends StatefulWidget {
  const ImageCard({super.key});

  @override
  State<ImageCard> createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
  int imageIndex = 0;

  void nextImage() {
    setState(() {
      imageIndex = (imageIndex + 1) % images.length;
    });
  }

  void prevImage() {
    setState(() {
      imageIndex = (imageIndex - 1) % images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Go to the previous image',
            onPressed: () => prevImage(),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next image',
              onPressed: () => nextImage(),
            ),
          ),
        ],
      ),
      body: ImageIndex(
        imageIndex: imageIndex,
      ),
    );
  }
}

class ImageIndex extends StatelessWidget {
  final int imageIndex;
  const ImageIndex({super.key, required this.imageIndex});

  @override
  Widget build(BuildContext context) {
    return Image.asset(images[imageIndex]);
  }
}
