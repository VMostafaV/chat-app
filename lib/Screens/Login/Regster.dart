import 'package:chat_app/p/src/my_button.dart';
// import 'package:chat_app/Screens/Widget/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
// import 'package:firebase_core/firebase_core.dart';

import 'image_Piker.dart';
// import 'Login/Regster.dart';
// import 'Login/loginPage.dart';
// import 'My_Button.dart';
// import 'Widget/Page_2.dart';

class RegesterPage extends StatefulWidget {
  static const String RegesterPageR = 'RegesterPageR';
  const RegesterPage({super.key});

  @override
  State<RegesterPage> createState() => _RegesterPageState();
}

class _RegesterPageState extends State<RegesterPage> {
  final _auth = FirebaseAuth.instance;
  bool showSpiner = false;
  late String userName;
  late String email;
  late String password;
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
                    child: Column(
                      children: [
                        // SizedBox(
                        //   height: 35,
                        // ),
                        // Text(
                        //   '_-WELLCOME-_',
                        //   style: TextStyle(
                        //       color: Colors.yellow[900],
                        //       fontSize: 30,
                        //       fontWeight: FontWeight.bold),
                        // ),
                        const SizedBox(
                          height: 30,
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
                            keyboardType: TextInputType.name,
                            textAlign: TextAlign.center,
                            onChanged: (ValueKey) {
                              userName = ValueKey;
                            },
                            decoration: const InputDecoration(
                              hintText: 'Enter your Name ',
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(204, 187, 99, 48)),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              // border: OutlineInputBorder(
                              //     borderRadius:
                              //         BorderRadius.all(Radius.circular(10))),
                              // enabledBorder: OutlineInputBorder(
                              //   borderSide:
                              //       BorderSide(color: Colors.orange, width: 1),
                              // ),
                              // focusedBorder: OutlineInputBorder(
                              //   borderSide:
                              //       BorderSide(color: Colors.blue, width: 2),
                              // ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
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
                            keyboardType: TextInputType.emailAddress,
                            textAlign: TextAlign.center,
                            onChanged: (val) {
                              email = val;
                            },
                            decoration: const InputDecoration(
                              hintText: 'Enter your Email',
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(204, 187, 99, 48)),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              // border: OutlineInputBorder(
                              //     borderRadius:
                              //         BorderRadius.all(Radius.circular(10))),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
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
                            obscureText: true,
                            keyboardType: TextInputType.phone,
                            textAlign: TextAlign.center,
                            onChanged: (val) {
                              password = val;
                            },
                            decoration: const InputDecoration(
                              hintText: 'create your new Passowrd',
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(204, 187, 99, 48),
                                  fontSize: 15),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              // border: OutlineInputBorder(
                              //     borderRadius:
                              //         BorderRadius.all(Radius.circular(10))),
                              // enabledBorder: OutlineInputBorder(
                              //   borderSide:
                              //       BorderSide(color: Colors.orange, width: 1),
                              // ),
                              // focusedBorder: OutlineInputBorder(
                              //   borderSide:
                              //       BorderSide(color: Colors.blue, width: 2),
                              // ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        MyButton(
                            color: Colors.blue[900]!,
                            onPressed: () async {
                              setState(() {
                                showSpiner = true;
                              });
                              try {
                                final user =
                                    await _auth.createUserWithEmailAndPassword(
                                  email: email,
                                  password: password,
                                );

                                // ignore: unused_local_variable
                                // final userN =
                                //     await _auth.createUserWithEmailAndPassword(
                                //         email: userName, password: password);

                                // ignore: unnecessary_null_comparison
                                if (user != null) {
                                  Navigator.pushNamed(
                                      context, ImagePiker.ImagePikerR);
                                  setState(() {
                                    showSpiner = false;
                                  });
                                } else {
                                  throw Exception("Error");
                                }
                              } catch (e) {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text(' $e'),
                                      );
                                    });
                                setState(() {
                                  showSpiner = false;
                                });
                                print(e);
                              }
                            },
                            title: 'Regester'),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
 // Text(
                        //   'OR',
                        //   style: TextStyle(
                        //       color: Colors.yellow[900],
                        //       fontWeight: FontWeight.bold),
                        // ),
                        // SizedBox(
                        //   height: 20,
                        // ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //   children: [
                        //     Container(
                        //       height: 50,
                        //       width: 150,
                        //       decoration: BoxDecoration(
                        //           boxShadow: const <BoxShadow>[
                        //             BoxShadow(
                        //                 offset: Offset(-5, 8),
                        //                 blurRadius: 10,
                        //                 spreadRadius: 1,
                        //                 color: Color.fromARGB(52, 0, 0, 0))
                        //           ],
                        //           borderRadius: BorderRadius.circular(30),
                        //           color: Colors.blue[900]),
                        //       child: Center(
                        //         child: Text(
                        //           'facebook',
                        //           style: TextStyle(color: Colors.white),
                        //         ),
                        //       ),
                        //     ),
                        //     Container(
                        //       height: 50,
                        //       width: 150,
                        //       decoration: BoxDecoration(
                        //           boxShadow: const <BoxShadow>[
                        //             BoxShadow(
                        //                 offset: Offset(-5, 8),
                        //                 blurRadius: 10,
                        //                 spreadRadius: 1,
                        //                 color: Color.fromARGB(52, 0, 0, 0))
                        //           ],
                        //           borderRadius: BorderRadius.circular(30),
                        //           color: Color.fromARGB(230, 15, 15, 15)),
                        //       child: Center(
                        //         child: Text(
                        //           'Gethup',
                        //           style: TextStyle(color: Colors.white),
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // const SizedBox(
                        //   height: 30,
                        // ),
                        // TextButton(
                        //   child: Text(
                        //     'Try with email',
                        //     style: TextStyle(
                        //       color: Color.fromARGB(255, 179, 29, 29),
                        //       fontSize: 15,
                        //     ),
                        //   ),
                        //   onPressed: () {},
                        // ),