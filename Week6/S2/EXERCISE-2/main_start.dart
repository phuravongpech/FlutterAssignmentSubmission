import 'package:flutter/material.dart';
import 'model/profile_tile_model.dart';
import 'data/profile_data.dart';

List<ProfileData> profileData = [ronanProfile, vongProfile, amazonProfile];

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: mainColor.withAlpha(100),
        appBar: AppBar(
          backgroundColor: mainColor,
          title: const Text(
            'CADT student Profile',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: [...profileData.map((pf) => ProfileApp(data: pf))],
        ),
      )));
}

const Color mainColor = Color(0xff5E9FCD);

class ProfileApp extends StatelessWidget {
  final ProfileData data;
  const ProfileApp({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 50),
      decoration: BoxDecoration(
          color: mainColor.withAlpha(100),
          border: const Border(
              bottom: BorderSide(width: BorderSide.strokeAlignCenter))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage(data.avatarUrl),
          ),
          const SizedBox(height: 20),
          Text(
            data.name,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: mainColor,
            ),
          ),
          Text(
            data.position,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 20),
          for (var i = 0; i < data.tiles.length; i++)
            ProfileTile(
              icon: data.tiles[i].icon,
              title: data.tiles[i].title,
              data: data.tiles[i].value,
            ),
        ],
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    super.key,
    required this.icon,
    required this.title,
    required this.data,
  });

  final IconData icon;
  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: ListTile(
          leading: Icon(icon, color: mainColor),
          title: Text(title),
          subtitle: Text(data),
        ),
      ),
    );
  }
}
