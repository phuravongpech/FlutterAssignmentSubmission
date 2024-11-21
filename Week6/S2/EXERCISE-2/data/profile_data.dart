import 'package:flutter/material.dart';
import '../model/profile_tile_model.dart';

ProfileData ronanProfile = ProfileData(
    name: "Ronan",
    position: "Flutter Developer",
    avatarUrl: 'assets/images/w5-s2/aang.png',
    tiles: [
      TileData(
          icon: Icons.phone, title: "Phone Number", value: "+123 456 7890"),
      TileData(
          icon: Icons.location_on, title: "Address", value: "123 Cambodia"),
      TileData(icon: Icons.email, title: "Mail", value: "ronan.ogogr@cadt.edu"),
    ]);
ProfileData vongProfile = ProfileData(
    name: "Vong",
    position: "Flutter Developer",
    avatarUrl: 'assets/images/w5-s2/aang.png',
    tiles: [
      TileData(
          icon: Icons.phone, title: "Phone Number", value: "+123 456 7890"),
      TileData(icon: Icons.location_on, title: "Address", value: "Moon"),
      TileData(icon: Icons.email, title: "Mail", value: "helloworld@cadt.edu"),
    ]);
ProfileData amazonProfile = ProfileData(
    name: "amazon",
    position: "Flutter Developer",
    avatarUrl: 'assets/images/w5-s2/aang.png',
    tiles: [
      TileData(
          icon: Icons.phone, title: "Phone Number", value: "+123 456 7890"),
      TileData(icon: Icons.location_on, title: "Address", value: "Moon"),
      TileData(icon: Icons.email, title: "Mail", value: "helloworld@cadt.edu"),
    ]);
