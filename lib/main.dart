import 'package:chat_app/Screens/Login/Profile_Page.dart';
import 'package:chat_app/Screens/Widget/HomePage.dart';
import 'package:chat_app/Screens/Messges/Page_2.dart';
import 'package:flutter/material.dart';
import 'Screens/Login/Regster.dart';
import 'Screens/Login/image_Piker.dart';
import 'Screens/Login/loginPage.dart';
import 'Screens/Messges/messges.dart';
import 'Screens/Wellcome.dart';
import 'Screens/Messges/Chat_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

// import 'p/test.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData.dark(),
      title: 'Chat App',
      // initialRoute: _auth.currentUser != null
      //     ? HomePage.HomePageR
      //     : WellComePage.wellcomPageR,
      home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const HomePageNavigationBar();
            } else {
              return const WellComePage();
            }
          }),
      // home: const ImagePiker(),
      routes: {
        WellComePage.wellcomPageR: (context) => const WellComePage(),
        LoginPage.LoginPageR: (context) => const LoginPage(),
        RegesterPage.RegesterPageR: (context) => const RegesterPage(),
        ChatPage.ChatPageR: (context) => const ChatPage(),
        HomePage.HomePageR: (context) => const HomePage(),
        HomePageNavigationBar.HomePageNaviBarR: (context) =>
            const HomePageNavigationBar(),
        Page2.Page2R: (context) => const Page2(),
        MessgesPage.MessgesPageR: (context) => const MessgesPage(),
        ImagePiker.ImagePikerR: (context) => const ImagePiker(),
        UserProfile.UserProfile1: (context) => const UserProfile(),
      },
    );
  }
}
