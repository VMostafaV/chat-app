import 'package:chat_app/Screens/Widget/HomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../p/src/test.dart';
import 'Login/Regster.dart';
import 'Login/loginPage.dart';
import '../p/src/my_button.dart';
// import 'Widget/Page_2.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();
final _auth = FirebaseAuth.instance;

class WellComePage extends StatefulWidget {
  static const String wellcomPageR = 'wellcomPageR';
  const WellComePage({super.key});

  @override
  State<WellComePage> createState() => _WellComePageState();
}

class _WellComePageState extends State<WellComePage> {
  // GoogleSignInAccount? _account;
  // login() {
  //   googleSignIn.signIn();
  // }
  Future signInWithGoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken, idToken: gAuth.idToken);
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  bool state = false;
  bool showSpiner = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // googleSignIn.onCurrentUserChanged.listen((event) async {
    //   if (event != null) {
    //     print('event');
    //     setState(() {
    //       state = state;
    //       event = _account;
    //     });
    //   } else {
    //     setState(() {
    //       state = false;
    //     });
    //   }
    // });
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
              Color.fromARGB(255, 197, 72, 4),
              Color.fromARGB(255, 218, 121, 3),
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
                        color: Color.fromARGB(255, 233, 229, 229),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        )),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        Container(
                          height: 50,
                          width: 250,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35),
                              boxShadow: const <BoxShadow>[
                                BoxShadow(
                                    offset: Offset(-5, 8),
                                    blurRadius: 10,
                                    spreadRadius: 1,
                                    color: Color.fromARGB(34, 0, 0, 0))
                              ],
                              color: const Color.fromARGB(255, 252, 249, 249)),
                          child: const Center(
                            child: Text(
                              '_-WELLCOME-_',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 201, 100, 11),
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        MyButton(
                            color: const Color.fromARGB(255, 201, 101, 14),
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, LoginPage.LoginPageR);
                            },
                            title: 'Login'),
                        const SizedBox(
                          height: 20,
                        ),
                        MyButton(
                            color: const Color.fromARGB(255, 14, 71, 156),
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, RegesterPage.RegesterPageR);
                            },
                            title: 'Regester'),
                        const SizedBox(
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
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => SignInDemo()));
                                // showDialog(
                                //   context: context,
                                //   builder: (context) {
                                //     return AlertDialog(
                                //       title: Text('Comeing soon'),
                                //     );
                                //   },
                                // );
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
                                  child: Text('Google',
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                //////

                                try {
                                  signInWithGoogle();

                                  if (_auth.currentUser == null) {
                                    Navigator.pushNamed(context,
                                        HomePageNavigationBar.HomePageNaviBarR);
                                    setState(() {
                                      showSpiner = false;
                                    });
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                "Inveild Google account")));
                                    setState(() {
                                      showSpiner = false;
                                    });
                                  }
                                } catch (e) {
                                  print(e);
                                }
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
                                    color: Colors.black),
                                child: const Center(
                                  child: Text(
                                    'Email (beta)',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
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
