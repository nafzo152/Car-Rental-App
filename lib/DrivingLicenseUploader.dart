// ignore_for_file: file_names, library_private_types_in_public_api

import 'dart:io';
import 'package:cargo/reusable_widget/Custom_AppBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'CompleteProfile.dart';

class DidUploader extends StatefulWidget {
  const DidUploader({Key? key}) : super(key: key);

  @override
  _GovidUploaderState createState() => _GovidUploaderState();
}

class _GovidUploaderState extends State<DidUploader> {
  final _formKey = GlobalKey<FormState>();

  var pname = "";

  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final pnameController = TextEditingController();

  String? url;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    pnameController.dispose();

    super.dispose();
  }

  clearText() {
    pnameController.clear();
  }

  CollectionReference pids =
      FirebaseFirestore.instance.collection('licence pictures');

  Future<void> addUser() async {
    return pids
        .add({
          'pname': pname,
          ' frontimage': url,
        })
        .then((value) => print('Govid Added'))
        .catchError((error) => print('Failed to Add user: $error'));
  }

  File? _image;
  final picker = ImagePicker();

  Future imagePicker() async {
    try {
      final pick = await picker.pickImage(source: ImageSource.gallery);
      setState(() {
        if (pick != null) {
          _image = File(pick.path);
        }
      });
    } catch (e) {
      return e;
    }
  }

  Future uploadImage(File _image) async {
    String imgId = DateTime.now().microsecondsSinceEpoch.toString();

    Reference refrence =
        FirebaseStorage.instance.ref().child('frontimage').child('user$imgId');
    await refrence.putFile(_image);
    url = await refrence.getDownloadURL();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CarGoAppBar(),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: ListView(
            children: [
              SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text(
                        "Add front Side of Driver's License",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Expanded(
                        flex: 2,
                        child: Container(
                          width: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.deepPurple)),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: _image == null
                                      ? Center(child: Text('No image selected'))
                                      : Image.file(_image!,
                                          fit: BoxFit.fitWidth),
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      imagePicker();
                                    },
                                    child: Text("Select Image")),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, otherwise false.
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          pname = pnameController.text;
                          addUser();
                          clearText();
                        });
                      }
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddUserPage()));
                    },
                    child: Text(
                      'Next',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
