import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../Wellcome.dart';
import 'Chat_page.dart';
import '../Widget/HomePage.dart';
import 'Page_2.dart';

class MessgesPage extends StatefulWidget {
  static const String MessgesPageR = 'messegsPageR';
  const MessgesPage({super.key});
  // String person;

  @override
  State<MessgesPage> createState() => _MessgesPageState();
}

class _MessgesPageState extends State<MessgesPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurntUser();
  }

  void getCurntUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        signIn = user;
        print(signIn.email);

        print(signIn.email);
      }
    } catch (e) {
      print(e);
    }
  }

  bool showSpiner = false;
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 201, 196, 196),
      body: ModalProgressHUD(
        inAsyncCall: showSpiner,
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Container(
                  //   height: 50,
                  //   width: 50,
                  //   decoration: BoxDecoration(
                  //       boxShadow: const <BoxShadow>[
                  //         BoxShadow(
                  //             offset: Offset(-5, 8),
                  //             blurRadius: 10,
                  //             spreadRadius: 1,
                  //             color: Color.fromARGB(36, 0, 0, 0))
                  //       ],
                  //       color: const Color.fromARGB(255, 235, 229, 229),
                  //       borderRadius: BorderRadius.circular(35)),
                  //   child: Center(
                  //     child: IconButton(
                  //       onPressed: () {
                  //         //    _auth.signOut();
                  //         Navigator.pop(context);
                  //       },
                  //       iconSize: 40,
                  //       icon: const Icon(
                  //         Icons.arrow_back,
                  //         size: 30,
                  //         color: Color.fromARGB(255, 214, 60, 49),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Container(
                      height: 50,
                      width: 110,
                      decoration: BoxDecoration(
                          boxShadow: const <BoxShadow>[
                            BoxShadow(
                                offset: Offset(-5, 8),
                                blurRadius: 10,
                                spreadRadius: 1,
                                color: Color.fromARGB(36, 0, 0, 0))
                          ],
                          color: const Color.fromARGB(255, 235, 229, 229),
                          borderRadius: BorderRadius.circular(35)),
                      child: const Center(
                          child: Text(
                        'List Chat',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          boxShadow: const <BoxShadow>[
                            BoxShadow(
                                offset: Offset(-5, 8),
                                blurRadius: 10,
                                spreadRadius: 1,
                                color: Color.fromARGB(36, 0, 0, 0))
                          ],
                          color: const Color.fromARGB(255, 235, 229, 229),
                          borderRadius: BorderRadius.circular(35)),
                      child: Center(
                        child: IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context,
                                  HomePageNavigationBar.HomePageNaviBarR);
                            },
                            icon: const Icon(
                              Icons.home,
                              size: 30,
                            )),
                      ),
                    ),
                  ),
                ],
              ),
              // SCont(
              //   color: Colors.orange,
              //   name: 'Desha',
              //   onPressed: () {
              //     Navigator.pushNamed(context, ChatPage.ChatPageR);
              //   },
              // ),
              // SCont(
              //   color: Colors.blue,
              //   name: 'Karem',
              //   onPressed: () {
              //     Navigator.pushNamed(context, Page2.Page2R);
              //   },
              // ),
              // ListView.builder(
              //     shrinkWrap: true,
              //     itemCount: 2,
              //     itemBuilder: (context, index) => Padding(
              //           padding: EdgeInsets.all(10.0),
              //           child: ListTile(
              //             leading: CircleAvatar(
              //               backgroundColor: colors[index],
              //               radius: 30,
              //             ),
              //             title: Text(_auth.currentUser!.email!),
              //           ),
              //         )),

              StreamBuilder<QuerySnapshot>(
                stream: _firebasestor
                    .collection('messeges')
                    // .orderBy('time')
                    .snapshots(),
                builder: ((context, snapshot) {
                  List<SCont> messegeWidgets = [];
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final messegs = snapshot.data!.docs.reversed;
                  for (var mesge in messegs) {
                    final messegText = mesge.get('text');
                    final messegSender = mesge.get('sender');
                    final currentUser = signIn.email;

                    // if (currentUser==messegSender) {
                    //   //asd
                    // }
                    final messegeWidget = SCont(
                      name: messegSender,
                      anotherName: messegText,
                      // isnt: currentUser == messegSender,
                    );
                    messegeWidgets.add(messegeWidget);
                  }
                  return Expanded(
                    child: ListView.builder(
                      itemCount: messegeWidgets.length,
                      reverse: true,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 5),
                      itemBuilder: (context, index) => messegeWidgets[index],
                    ),
                  );
                  // ListView.builder(
                  //     itemBuilder: (context, index) =>
                  //         Text(messegeWidgets[index].toString()));
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

late User signIn;
final _firebasestor = FirebaseFirestore.instance;
List<Color> colors = [
  Colors.greenAccent,
  Colors.redAccent,
  Colors.blueAccent,
];

class SCont extends StatelessWidget {
  SCont(
      {
      // required this.onPressed,
      required this.anotherName,
      required this.name,
      super.key});
  String name;
  String anotherName;
  //VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: onPressed,
      child: Container(
        height: 80,
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        decoration: const BoxDecoration(
            // color: Colors.red,
            ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      boxShadow: <BoxShadow>[
                        const BoxShadow(
                            offset: Offset(-5, 8),
                            blurRadius: 10,
                            spreadRadius: 1,
                            color: Color.fromARGB(36, 0, 0, 0))
                      ],
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.redAccent,
                      radius: 35,
                      child: const Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                          // color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text('new messege'),
                  ],
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(CupertinoIcons.ellipsis),
            )
          ],
        ),
      ),
    );
  }
}
