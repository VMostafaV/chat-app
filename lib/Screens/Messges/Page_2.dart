// import 'package:chat_app/Screens/Wellcome.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// import 'HomePage.dart';
// import 'Page_2.dart';

final _firebasestor = FirebaseFirestore.instance;
late User signIn;

class Page2 extends StatefulWidget {
  static const String Page2R = 'Page2R';
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  final messsController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  String? messege;
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

  void getMessege() async {
    await for (var snapshot in _firebasestor.collection('desha').snapshots()) {
      for (var messge in snapshot.docs) {
        print(messge.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(179, 58, 56, 56),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(212, 5, 56, 99),
        leading: Row(
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back,
                size: 25,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      offset: Offset(-5, 8),
                      blurRadius: 10,
                      spreadRadius: 1,
                      color: Color.fromARGB(36, 0, 0, 0))
                ],
              ),
              child: CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 20,
                child: const Icon(
                  Icons.person,
                  size: 25,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'Karem',
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
        leadingWidth: 200,
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 7),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.ellipsis,
                  size: 30,
                ),
              )),
        ],
      ),
      body: SafeArea(
        child: Container(
          child: Stack(
            //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: double.infinity,
                // width: 500,
                child: Image.asset(
                  'image/w2.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 45),
                child: Streambldr(),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                    height: 60,
                    width: 500,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 1, 32, 73)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment,
                      children: [
                        Container(
                          height: 50,
                          width: 350,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: const Color.fromARGB(113, 255, 255, 255)),
                          child: Expanded(
                            child: TextField(
                              controller: messsController,
                              onChanged: (val) {
                                messege = val;
                              },
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(117, 255, 255, 255),
                                      width: 0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 1, 32, 73),
                                      width: 0),
                                ),
                                hintText: 'Type your messge here...',
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(193, 255, 255, 255)),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white),
                          child: IconButton(
                              onPressed: () {
                                _firebasestor.collection('desha').add({
                                  'owner': messege,
                                  'sender': signIn.email,
                                  'time': FieldValue.serverTimestamp()
                                });
                                print(messege);
                                messsController.clear();
                              },
                              icon: Icon(
                                Icons.send,
                                size: 30,
                                color: Color.fromARGB(255, 8, 73, 104),
                              )),
                        )
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Streambldr extends StatefulWidget {
  const Streambldr({super.key});

  @override
  State<Streambldr> createState() => _StreambldrState();
}

class _StreambldrState extends State<Streambldr> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firebasestor.collection('desha').orderBy('time').snapshots(),
      builder: ((context, snapshot) {
        List<MessgesT> messegeWidgets = [];
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final messegs = snapshot.data!.docs.reversed;
        for (var mesge in messegs) {
          final messegText = mesge.get('owner');
          final messegSender = mesge.get('sender');
          final currentUser = signIn.email;

          // if (currentUser==messegSender) {
          //   //asd
          // }
          final messegeWidget = MessgesT(
            sender: messegSender,
            text: messegText,
            isnt: currentUser == messegSender,
          );
          messegeWidgets.add(messegeWidget);
        }
        return Expanded(
          child: ListView(
            reverse: true,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            children: messegeWidgets,
          ),
        );
      }),
    );
  }
}

// ignore: must_be_immutable
class MessgesT extends StatelessWidget {
  MessgesT(
      {super.key,
      required this.text,
      required this.isnt,
      required this.sender});
  final String text;
  final String sender;
  bool isnt = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment:
            isnt ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Material(
            elevation: 3,
            borderRadius: isnt
                ? const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20))
                : const BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
            color: isnt
                ? Color.fromARGB(255, 14, 101, 136)
                : Color.fromARGB(97, 255, 255, 255),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                text,
                style: const TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
          ),
          Text(
            sender,
            style: const TextStyle(fontSize: 10),
          ),
        ],
      ),
    );
  }
}
