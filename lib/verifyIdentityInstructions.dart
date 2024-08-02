// ignore_for_file: file_names

import 'package:cargo/giduploader.dart';
import 'package:cargo/reusable_widget/Custom_AppBar.dart';
import 'package:flutter/material.dart';

class VerifyID extends StatefulWidget {
  const VerifyID({Key? key}) : super(key: key);

  @override
  State<VerifyID> createState() => _VerifyIDState();
}

class _VerifyIDState extends State<VerifyID> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CarGoAppBar(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(
              'assets/tick.jpg',
              width: 270,
              height: 200,
            ),
            Text(
              'Verify your identity',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'We will need you ',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '1. Government Issued Id Picture',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              '2. Your Driving Licence Picture',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: 120),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(200, 50),
                      textStyle: TextStyle(fontSize: 21),
                      backgroundColor: Colors.purple,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                    ),
                    child: Text('CONTINUE'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GovidUploader()),
                      );
                    },
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
