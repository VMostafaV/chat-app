import 'package:chat_app/p/src/my_button.dart';
import 'package:chat_app/Screens/Widget/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'Login/Regster.dart';
// import 'Login/loginPage.dart';
// import 'My_Button.dart';
// import 'Widget/Page_2.dart';

class LoginPage extends StatefulWidget {
  static const String LoginPageR = 'LoginPageR';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = FirebaseAuth.instance;
  bool showSpiner = false;
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
            decoration: BoxDecoration(
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
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 248, 247, 247),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        )),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 35,
                        ),
                        Text(
                          '_-WELLCOME-_',
                          style: TextStyle(
                              color: Colors.yellow[900],
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          padding: EdgeInsets.all(10),
                          alignment: AlignmentDirectional(-1, -3),
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
                            onChanged: (ValueKey) {
                              email = ValueKey;
                            },
                            decoration: const InputDecoration(
                              hintText: 'Enter your Email',
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(204, 187, 99, 48)),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          padding: EdgeInsets.all(10),
                          alignment: AlignmentDirectional(-1, -3),
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
                            keyboardType: TextInputType.phone,
                            // obscureText: true,
                            textAlign: TextAlign.center,
                            onChanged: (ValueKey) {
                              password = ValueKey;
                            },
                            decoration: const InputDecoration(
                              hintText: 'Enter your Password',
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(204, 187, 99, 48)),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        MyButton(
                            color: Color.fromARGB(255, 197, 105, 25),
                            onPressed: () async {
                              setState(() {
                                showSpiner = true;
                              });
                              try {
                                final user =
                                    await _auth.signInWithEmailAndPassword(
                                  email: email,
                                  password: password,
                                );
                                // final userN =await _auth.signInWithEmailAndPassword(email: username, password: password)
                                if (user != null) {
                                  Navigator.pushNamed(context,
                                      HomePageNavigationBar.HomePageNaviBarR);
                                  setState(() {
                                    showSpiner = false;
                                  });
                                } else {
                                  // ScaffoldMessenger.of(context).showSnackBar(
                                  //     const SnackBar(
                                  //         content: Text('Invild data')));
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title:
                                              Text('Invild Email & Password'),
                                        );
                                      });
                                }
                              } catch (e) {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text('Invild Email & Password'),
                                      );
                                    });
                                setState(() {
                                  showSpiner = false;
                                });
                                print(e);
                              }
                            },
                            title: 'Login'),
                        SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'OR',
                          style: TextStyle(
                              color: Color.fromARGB(255, 224, 114, 18),
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                //ToDo

                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('Comeing soon'),
                                    );
                                  },
                                );
                              },
                              child: Container(
                                height: 50,
                                width: 150,
                                decoration: BoxDecoration(
                                    boxShadow: const <BoxShadow>[
                                      BoxShadow(
                                          offset: Offset(-5, 8),
                                          blurRadius: 10,
                                          spreadRadius: 1,
                                          color: Color.fromARGB(52, 0, 0, 0))
                                    ],
                                    borderRadius: BorderRadius.circular(30),
                                    color:
                                        const Color.fromARGB(255, 35, 89, 170)),
                                child: const Center(
                                  child: Text('facebook',
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('Comeing soon'),
                                    );
                                  },
                                );
                              },
                              child: Container(
                                height: 50,
                                width: 150,
                                decoration: BoxDecoration(
                                    boxShadow: const <BoxShadow>[
                                      BoxShadow(
                                          offset: Offset(-5, 8),
                                          blurRadius: 10,
                                          spreadRadius: 1,
                                          color: Color.fromARGB(52, 0, 0, 0))
                                    ],
                                    borderRadius: BorderRadius.circular(30),
                                    color:
                                        const Color.fromARGB(244, 15, 15, 15)),
                                child: const Center(
                                  child: Text(
                                    'Gethup',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
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
