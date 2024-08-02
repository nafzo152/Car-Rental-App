// ignore_for_file: file_names

import 'package:cargo/reusable_widget/Custom_AppBar.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CarGoAppBar(),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(height: 25),
            Text(
              "Profile",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 25),
            Image.asset("assets/profile.png"),
            SizedBox(
              height: 20,
            ),
            Text(
              "Name: Nafis Ahmed",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Email: NafisAhmed@gmail.com",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Passport/MyKad: A2849283",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Drivers License Number: 49283743",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
