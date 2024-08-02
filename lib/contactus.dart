import 'package:cargo/reusable_widget/Custom_AppBar.dart';
import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AppBarExample(),
    );
  }
}

class AppBarExample extends StatelessWidget {
  const AppBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CarGoAppBar(),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                )
              ],
            ),
            Text(
              "Contact Us",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Email: support@cargo.com",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Tel no: +60 11-1234-567",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Fax no: +60 10-999-9876",
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
