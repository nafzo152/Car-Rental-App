// ignore_for_file: library_private_types_in_public_api

import 'package:cargo/welcome_page.dart';
import 'package:flutter/material.dart';
import '../login_page.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return WelcomePage(toggleView: toggleView);
    } else {
      return LoginPage(toggleView: toggleView);
    }
  }
}
