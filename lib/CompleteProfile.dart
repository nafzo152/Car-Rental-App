// ignore_for_file: library_private_types_in_public_api

import 'dart:io';
import 'package:cargo/profileVerifiedSuccessfully.dart';
import 'package:cargo/reusable_widget/Custom_AppBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddUserPage extends StatefulWidget {
  const AddUserPage({Key? key}) : super(key: key);

  @override
  _AddUserPageState createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  final _formKey = GlobalKey<FormState>();

  var pname = "";
  var govid = "";
  var driveid = "";
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final pnameController = TextEditingController();
  final govidController = TextEditingController();
  final driveidController = TextEditingController();
  String? url;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    pnameController.dispose();
    govidController.dispose();
    driveidController.dispose();
    super.dispose();
  }

  clearText() {
    pnameController.clear();
    govidController.clear();
    driveidController.clear();
  }

  CollectionReference pids =
      FirebaseFirestore.instance.collection('userdetails');

  Future<void> addUser() async {
    return pids
        .add({'pname': pname, 'govid': govid, 'driveid': driveid, 'image': url})
        .then((value) => print('User Added'))
        .catchError((error) => print('Failed to Add user: $error'));
  }

  File? _image;
  final picker = ImagePicker();
  // String? downloadUrl;

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
        FirebaseStorage.instance.ref().child('images').child('user$imgId');
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
              Container(
                  height: 300,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text(
                        "Add Personal Picture",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
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
                          govid = govidController.text;
                          pname = pnameController.text;
                          driveid = driveidController.text;
                          addUser();
                          clearText();
                        });
                      }
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const VerifySuccessful()));
                    },
                    child: Text(
                      'Submit',
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
