import 'dart:math';

import 'package:chat_app/Screens/Login/Profile_Page.dart';
import 'package:chat_app/Screens/Login/image_Piker.dart';
import 'package:chat_app/Screens/Wellcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:simple_animations/animation_builder/loop_animation_builder.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Messges/messges.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'Add_Post.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
    // Optional clientId
    // clientId: 'your-client_id.apps.googleusercontent.com',

    );
Future<void> _handleSignIn() async {
  try {
    await _googleSignIn.signIn();
  } catch (error) {
    print(error);
  }
}

Future<void> _handleSignOut() => _googleSignIn.disconnect();
final GoogleSignIn googleSignIn = GoogleSignIn();
late String sender;
late String owner;
Uint8List? _imageSelected;

class HomePage extends StatefulWidget {
  static const String HomePageR = 'HomePageR';
  const HomePage({super.key});
  // final String Image;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> images = [
    'image/w3.png',
    'image/w4.png',
    'image/w3.png',
    'image/w4.png',
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurntUser();
    _Pagecontroller =
        PageController(initialPage: 1, keepPage: false, viewportFraction: 0.28);
  }

  PageController _Pagecontroller = PageController();

  void getCurntUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        signIn = user;
        print(signIn.email);

        //  print(signIn.email);
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
      //  floatingActionButton:
      // onPressed: () {
      //   showDialog(
      //     context: context,
      //     builder: (context) {
      //       return const AddPost();
      //     },
      //   );
      // },

      // backgroundColor: const Color.fromARGB(179, 58, 56, 56),
      backgroundColor: const Color.fromARGB(255, 184, 180, 176),
      body: ModalProgressHUD(
        inAsyncCall: showSpiner,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 110),
                    child: SizedBox(
                      height: 667,
                      child: Streambldr(),
                    ),
                  ),
                  // Container(
                  //   height: 200,
                  //   width: double.infinity,
                  //   decoration: const BoxDecoration(
                  //     // gradient: LinearGradient(
                  //     //     begin: Alignment.topLeft,
                  //     //     end: Alignment.bottomLeft,
                  //     //     colors: [
                  //     //       Colors.redAccent,
                  //     //       Colors.deepPurple[500]!,
                  //     //     ]),
                  //     boxShadow: <BoxShadow>[
                  //       BoxShadow(
                  //           offset: Offset(-5, 8),
                  //           blurRadius: 10,
                  //           spreadRadius: 1,
                  //           color: Color.fromARGB(36, 0, 0, 0))
                  //     ],
                  //     color: Color.fromARGB(255, 184, 107, 45),
                  //     borderRadius: BorderRadius.only(
                  //       // bottomLeft: Radius.circular(40),
                  //       bottomRight: Radius.circular(70),
                  //       bottomLeft: Radius.circular(70),
                  //     ),
                  //   ),
                  // ),
                  // SafeArea(
                  //   child: Padding(
                  //     padding:
                  //         const EdgeInsets.only(top: 10, left: 15, right: 15),
                  //     child: Row(
                  //       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         Container(
                  //           height: 50,
                  //           width: 50,
                  //           decoration: BoxDecoration(
                  //               boxShadow: const <BoxShadow>[
                  //                 BoxShadow(
                  //                     offset: Offset(-5, 8),
                  //                     blurRadius: 10,
                  //                     spreadRadius: 1,
                  //                     color: Color.fromARGB(36, 0, 0, 0))
                  //               ],
                  //               color: const Color.fromARGB(255, 224, 217, 217),
                  //               borderRadius: BorderRadius.circular(35)),
                  //           child: Center(
                  //             child: IconButton(
                  //               onPressed: () {
                  //                 _auth.signOut();
                  //                 _handleSignOut();
                  //                 Navigator.pushNamed(
                  //                     context, WellComePage.wellcomPageR);
                  //               },
                  //               iconSize: 40,
                  //               icon: const Icon(
                  //                 Icons.logout,
                  //                 size: 30,
                  //                 color: Color.fromARGB(255, 214, 60, 49),
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //         // GestureDetector(
                  //         //   // onTap: () => Navigator.pushNamed(
                  //         //   //     context, ImagePiker.ImagePikerR),
                  //         //   // onTap: () => print(_imageSelected.toString()),
                  //         //   onTap: _handleSignIn,

                  //         //   child: Column(
                  //         //     children: [
                  //         //       Container(
                  //         //         height: 50,
                  //         //         padding: const EdgeInsets.all(10),
                  //         //         // width: 100,
                  //         //         decoration: BoxDecoration(
                  //         //             boxShadow: const <BoxShadow>[
                  //         //               BoxShadow(
                  //         //                   offset: Offset(-5, 8),
                  //         //                   blurRadius: 10,
                  //         //                   spreadRadius: 1,
                  //         //                   color: Color.fromARGB(28, 0, 0, 0))
                  //         //             ],
                  //         //             color: const Color.fromARGB(
                  //         //                 255, 224, 217, 217),
                  //         //             borderRadius: BorderRadius.circular(35)),
                  //         //         child: const Center(
                  //         //             child: Row(
                  //         //           children: [
                  //         //             Text(
                  //         //               'Wellcome',
                  //         //               style: TextStyle(
                  //         //                   fontSize: 23,
                  //         //                   fontWeight: FontWeight.bold),
                  //         //             ),
                  //         //             // GoogleUserCircleAvatar(
                  //         //             //   identity: ImagePiker.ImagePikerR,
                  //         //             //   // backgroundImage: AssetImage(ImagePiker()),
                  //         //             //   backgroundColor: Colors.redAccent,
                  //         //             // )
                  //         //           ],
                  //         //         )),
                  //         //       ),

                  //         //       // Container(
                  //         //       //   height: 30,
                  //         //       //   width: 200,
                  //         //       //   decoration: BoxDecoration(
                  //         //       //       borderRadius: BorderRadius.circular(25),
                  //         //       //       color: const Color.fromARGB(
                  //         //       //           73, 255, 255, 255)),
                  //         //       //   child: Center(
                  //         //       //       child: Text(
                  //         //       //           "Email : ${googleSignIn.currentUser.authentication.}")),
                  //         //       // )
                  //         //     ],
                  //         //   ),
                  //         // ),
                  //         // Container(
                  //         //   height: 50,
                  //         //   width: 50,
                  //         //   decoration: BoxDecoration(
                  //         //       boxShadow: const <BoxShadow>[
                  //         //         BoxShadow(
                  //         //             offset: Offset(-5, 8),
                  //         //             blurRadius: 10,
                  //         //             spreadRadius: 1,
                  //         //             color: Color.fromARGB(36, 0, 0, 0))
                  //         //       ],
                  //         //       color: const Color.fromARGB(255, 224, 217, 217),
                  //         //       borderRadius: BorderRadius.circular(35)),
                  //         //   child: Center(
                  //         //     child: IconButton(
                  //         //       onPressed: () {
                  //         //         Navigator.pushNamed(
                  //         //             context, MessgesPage.MessgesPageR);
                  //         //       },
                  //         //       iconSize: 40,
                  //         //       icon: const Icon(
                  //         //         Icons.message,
                  //         //         color: Colors.redAccent,
                  //         //         size: 30,
                  //         //       ),
                  //         //     ),
                  //         //   ),
                  //         // )
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 10, right: 10, left: 10, bottom: 10),
                      child: Container(
                        height: 150,
                        // width: 50,
                        child: PageView.builder(
                          allowImplicitScrolling: true,
                          itemCount: images.length,
                          controller: _Pagecontroller,
                          itemBuilder: (context, index) => Stack(
                            children: [
                              RotetContainer(
                                Container(
                                  height: 100,
                                  width: 0100,
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(colors: [
                                      Color.fromARGB(255, 226, 208, 198),
                                      Color.fromARGB(255, 218, 121, 3),
                                      Color.fromARGB(255, 172, 122, 82),
                                    ]),
                                    borderRadius: BorderRadius.circular(120),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5, left: 5),
                                child: CircleAvatar(
                                  radius: 45,
                                  backgroundImage: AssetImage(images[index]),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 107),
                    child: Divider(
                      height: 10,
                      // endIndent: double.infinity,
                      color: Colors.black,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 108),
                    child: Divider(
                      height: 10,
                      // endIndent: double.infinity,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: SpeedDial(
        backgroundColor: const Color.fromARGB(255, 221, 143, 53),
        animationAngle: 5,
        foregroundColor: Colors.white,
        animatedIcon: AnimatedIcons.menu_arrow,
        overlayColor: Colors.black,
        overlayOpacity: 0.4,
        // icon: Icons.close,
        children: [
          SpeedDialChild(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AddPost();
                  },
                );
              },
              backgroundColor: const Color.fromARGB(255, 221, 143, 53),
              label: "Create Post",
              child: const Icon(
                Icons.create,
                color: Colors.white,
              )),
          SpeedDialChild(
              onTap: () {
                // _auth.signOut();
                // _handleSignOut();
                Navigator.pushNamed(context, UserProfile.UserProfile1);
              },
              //    onTap: () => Navigator.of(context).push(
              //    MaterialPageRoute(builder: (_) => CreatePage(id:wholeDataList[]))),
              backgroundColor: const Color.fromARGB(255, 221, 143, 53),
              label: "Profile",
              child: const Icon(
                Icons.person,
                color: Color.fromARGB(255, 255, 255, 255),
              )),
          SpeedDialChild(
              onTap: () {
                _auth.signOut();
                _handleSignOut();
                Navigator.pushNamed(context, WellComePage.wellcomPageR);
              },
              //    onTap: () => Navigator.of(context).push(
              //    MaterialPageRoute(builder: (_) => CreatePage(id:wholeDataList[]))),
              backgroundColor: const Color.fromARGB(255, 221, 143, 53),
              label: "Log Out",
              child: const Icon(
                Icons.logout,
                color: Color.fromARGB(255, 247, 247, 247),
              )),
        ],
      ),
    );
  }

  // TextEditingController _controller = TextEditingController();

  // final Widget myWidget = TestCont();

  // getContenr() {
  //   widgets.add(myWidget);
  // }
}

class HomePageNavigationBar extends StatefulWidget {
  static const String HomePageNaviBarR = 'HomePageNaviBarR';
  const HomePageNavigationBar({super.key});

  @override
  State<HomePageNavigationBar> createState() => _HomePageNavigationBarState();
}

class _HomePageNavigationBarState extends State<HomePageNavigationBar> {
  int unSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.yellow[900],
        currentIndex: unSelected,
        onTap: (index) {
          setState(() {
            unSelected = index;
          });
        },
        backgroundColor: const Color.fromARGB(255, 231, 228, 228),
        elevation: 3,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            label: 'Chat Room',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.home),
          //   label: 'home',
          // ),
        ],
      ),
      body: SafeArea(child: MWidget.elementAt(unSelected)),
    );
  }
}

List<Widget> MWidget = [
  const HomePage(),
  const MessgesPage(),

  // Player()
];
late String post;
List<Widget> widgets = [];
late User signIn;

class TestCont extends StatefulWidget {
  TestCont({
    required this.messegTime,
    required this.messegSender,
    required this.messegText,
    // required this.messegsName,
    super.key,
  });
  //String TextPost;

  String messegSender;
  String messegText;
  Timestamp messegTime;

  ///String messegsName;

  @override
  State<TestCont> createState() => _TestContState();
}

class _TestContState extends State<TestCont> {
  bool like = false;
  @override
  void initState() {
    super.initState();
  }

  int curtnind = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: const Color.fromARGB(255, 224, 217, 217),
        boxShadow: const <BoxShadow>[
          BoxShadow(
              offset: Offset(-5, 8),
              blurRadius: 10,
              spreadRadius: 1,
              color: Color.fromARGB(36, 0, 0, 0))
        ],
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage('image/logo.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Text(widget.messegSender),
                          const SizedBox(
                            height: 9,
                          ),
                          Row(
                            children: [
                              Text(
                                widget.messegTime.toString(),
                                style: const TextStyle(fontSize: 5),
                              ),
                              const Icon(
                                Icons.timer_outlined,
                                size: 15,
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(CupertinoIcons.ellipsis)),
                    IconButton(
                        onPressed: () {
                          // widgets.remove(TestCont(
                          //     messegSender: widget.messegSender,
                          //     messegText: widget.messegText));

                          // if (click) {
                          //   setState(() {
                          //     click = false;
                          //   });
                          // } else {
                          //   setState(() {
                          //     click = true;
                          //   });
                          // }

                          //  print(widgets);

                          // await _firebasestor
                          //     .collection('posts')
                          //     .doc('3J0oUD835QsWIZP2SaVm')
                          //     .delete();
                          final docUser =
                              _firebasestor.collection('posts').doc();
                          docUser.delete();
                        },
                        // icon: click
                        //     ? const Icon(Icons.open_in_browser)
                        //    :
                        icon: const Icon(
                          Icons.close,
                          size: 50,
                        )),
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 5),
              child: Text(widget.messegText),
            ),
            //  Image.asset('image/logo.png'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Text(
                        '😂',
                        style: _style,
                      ),
                      Text(
                        '😍',
                        style: _style,
                      ),
                      Text(' . $curtnind')
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(
                    children: [
                      const Text('0 Comments'),
                      Text('. $curtnind Likes'),
                    ],
                  ),
                )
              ],
            ),
            const Divider(
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 40, left: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      if (like) {
                        setState(() {
                          like = false;
                        });
                      }
                      {
                        setState(() {
                          like = true;
                        });
                      }
                      ;
                    },
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            curtnind++;
                          });
                        },
                        icon: like
                            ? Icon(Icons.thumb_up,
                                size: 35, color: Colors.blue[900]!)
                            : const Icon(Icons.thumb_up,
                                size: 35,
                                color: Color.fromARGB(255, 212, 128, 2))),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.comment,
                        size: 35, color: Color.fromARGB(255, 212, 128, 2)),
                  ),
                ],
              ),
            )
          ]),
    );
  }

  final TextStyle _style = const TextStyle(fontSize: 15);
}

Widget RotetContainer(Widget widget) {
  return LoopAnimationBuilder<double>(
    tween: Tween(begin: 0.5, end: 4 * pi),
    duration: const Duration(seconds: 10), // for 2 seconds per iteration
    builder: (context, value, _) {
      return Transform.rotate(
        angle: value, // use value
        child: widget,
      );
    },
  );
}

// class _StreambldrState extends State<Streambldr> {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: _firebasestor.collection('posts').snapshots(),
//       builder: ((context, snapshot) {
//         List<Widget> widgets = [];
//         if (!snapshot.hasData) {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//         final messegs = snapshot.data!.docs.reversed;
//         for (var mesge in messegs) {
//           final messegText = mesge.get('poster');
//           final messegSender = mesge.get('comment');
//           final currentUser = signIn.email;
//           final isMe = currentUser == messegSender;
//           final messegeWidget = TestCont(
//             messegSender: messegSender,
//             messegText: messegText,
//             //   TextPost: mesge,
//             //   isnt: isMe,
//           );
//           widgets.add(messegeWidget);
//        //  widgets.remove(mesge);
//           // remove() {

//           // }
//           ////////////////////////////////////////////
//         }
//         return Expanded(
//           child: ListView(
//             reverse: true,
//             padding: const EdgeInsets.symmetric(
//               vertical: 10,
//             ),
//             children: widgets,
//           ),
//         );
//       }),
//     );
//   }
// }
class Streambldr extends StatefulWidget {
  const Streambldr({super.key});

  @override
  State<Streambldr> createState() => _StreambldrState();
}

final _firebasestor = FirebaseFirestore.instance;

class _StreambldrState extends State<Streambldr> {
  Future<void> createPost() async {
    const String poster = 'Bard';
    const String comment = 'This is a test post.';

    final DocumentReference postRef = _firebasestor.collection('posts').doc();

    await postRef.set({
      'poster': poster,
      'comment': comment,
      'timestamp': Timestamp.now(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firebasestor.collection('posts').snapshots(),
      builder: ((context, snapshot) {
        List<Widget> widgets = [];
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final messegs = snapshot.data!.docs.reversed;
        for (var mesge in messegs) {
          final messegText = mesge.get('poster');
          final messegSender = mesge.get('comment');
          final _Timee = mesge.get('timestamp');
          // final messegesName = mesge.get('username');
          final currentUser = signIn.email;
          // ignore: unused_local_variable
          final isMe = currentUser == messegSender;
          final messegeWidget = TestCont(
              messegSender: messegSender,
              messegText: messegText,
              messegTime: _Timee
              //  messegsName: messegesName,
              //   TextPost: mesge,
              //   isnt: isMe,
              );
          widgets.add(messegeWidget);
        }
        return ListView(
          //  reverse: true,
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          children: widgets,
        );
      }),
    );
  }
}

bool click = false;
remove() {
  if (click) {
    click = false;
  }
  {
    click = true;
  }
}

Widget EditImage(widget) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(100),
    child: widget,
  );
}
