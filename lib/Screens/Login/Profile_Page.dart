// import 'package:flutter/material.dart';

// import 'dart:io';
// import 'dart:typed_data';

import 'dart:typed_data';

import 'package:chat_app/p/recorece/save_data.dart';
import 'package:chat_app/p/src/my_button.dart';
import 'package:chat_app/Screens/Widget/HomePage.dart';
import 'package:chat_app/p/src/test.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

TextEditingController nameContr = TextEditingController();

class UserProfile extends StatefulWidget {
  static const String UserProfile1 = 'UserProfile2';
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  pickImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();
    XFile? file = await _imagePicker.pickImage(source: source);
    if (file != null) {
      return file.readAsBytes();
    }
    print('No Image selected');
  }

  Uint8List? _imageSlected;
  selectImageGallery() async {
    Navigator.pop(context);
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _imageSlected = img;
    });
  }

  selectImageFromCamera() async {
    Navigator.pop(context);
    Uint8List img = await pickImage(ImageSource.camera);
    setState(() {
      _imageSlected = img;
    });
  }

  // ignore: unused_field
  final _auth = FirebaseAuth.instance;
  bool showSpiner = false;
  String name = nameContr.text;

  savePhotot() async {
    // ignore: unused_local_variable
    String res =
        await StoreData().saveData(file: _imageSlected!, name: name, bio: '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ModalProgressHUD(
            inAsyncCall: showSpiner,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color.fromARGB(255, 206, 73, 2),
                Color.fromARGB(255, 214, 119, 2),
              ])),
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 180,
                        child: Image.asset(
                          'image/logo.png',
                          width: 300,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
                        height: 615,
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 248, 247, 247),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50),
                            )),
                        child: Column(children: [
                          const SizedBox(
                            height: 25,
                          ),
                          Text(
                            'Uploud Your Image',
                            style: TextStyle(
                                color: Colors.yellow[900],
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(78, 192, 116, 2),
                                  borderRadius: BorderRadius.circular(25)),
                              child: Center(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      showSpiner = true;
                                    });
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return SimpleDialog(
                                            title: const Text('item image'),
                                            children: [
                                              SimpleDialogOption(
                                                onPressed: () {
                                                  //ToDo
                                                  selectImageFromCamera();
                                                },
                                                child: const Text(
                                                  'Capture image from camera',
                                                ),
                                              ),
                                              SimpleDialogOption(
                                                onPressed: () {
                                                  //ToDo

                                                  selectImageGallery();
                                                },
                                                child: const Text(
                                                    'Chose image from gallery'),
                                              ),
                                              SimpleDialogOption(
                                                onPressed: () {
                                                  //ToDo
                                                  Navigator.pop(context);
                                                },
                                                child: const Text('Cancel'),
                                              )
                                            ],
                                          );
                                        });
                                    setState(() {
                                      showSpiner = false;
                                    });
                                  },
                                  // ignore: unnecessary_null_comparison
                                  child: _imageSlected != null
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          child: Image(
                                            image: MemoryImage(_imageSlected!),
                                            fit: BoxFit.cover,
                                            width: 200,
                                          ),
                                        )
                                      : Icon(
                                          Icons.person,
                                          color: Colors.grey,
                                          size: 120,
                                        ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            padding: const EdgeInsets.all(10),
                            alignment: const AlignmentDirectional(-1, -3),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: const <BoxShadow>[
                                BoxShadow(
                                    offset: Offset(-5, 8),
                                    blurRadius: 10,
                                    spreadRadius: 1,
                                    color: Color.fromARGB(36, 0, 0, 0))
                              ],
                            ),
                            child: TextField(
                              controller: nameContr,
                              keyboardType: TextInputType.name,
                              textAlign: TextAlign.center,
                              onChanged: (ValueKey) {
                                //  userName = ValueKey;
                              },
                              decoration: const InputDecoration(
                                hintText: 'Enter your Name ',
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(204, 187, 99, 48)),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          MyButton(
                              color: const Color.fromARGB(255, 197, 105, 25),
                              onPressed: () {
                                savePhotot;

                                if (_imageSlected != null) {
                                  Navigator.pushNamed(context,
                                      HomePageNavigationBar.HomePageNaviBarR);
                                  print(_imageSlected);
                                } else {
                                  showDialog<void>(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text('Invild Photo'),
                                        );
                                      });
                                  // print(_imageSlected.toString());
                                }
                              },
                              title: 'Uploud'),
                          const SizedBox(
                            height: 5,
                          ),
                          InkWell(
                            onTap: () => Navigator.pushNamed(context,
                                HomePageNavigationBar.HomePageNaviBarR),
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 40),
                              height: 60,
                              width: 100,
                              decoration: BoxDecoration(
                                  boxShadow: const <BoxShadow>[
                                    BoxShadow(
                                        offset: Offset(-2, 10),
                                        blurRadius: 10,
                                        spreadRadius: 1,
                                        color: Color.fromARGB(57, 0, 0, 0))
                                  ],
                                  color: Colors.blue[900],
                                  borderRadius: BorderRadius.circular(25)),
                              child: const Center(
                                child: Text(
                                  'Skip',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ]),
                      )
                    ]),
              ),
            )));
  }
}
