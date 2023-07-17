import 'package:chat_app/Screens/Widget/HomePage.dart';
import 'package:chat_app/p/src/my_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final _firebasestor = FirebaseFirestore.instance;
final _auth = FirebaseAuth.instance;
TextEditingController _controller = TextEditingController();

class AddPost extends StatefulWidget {
  AddPost(
      {
      //required this.sender,
      super.key});
  // String sender;

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  Future<void> createPost() async {
    final String poster = post.toString();
    final String comment = _auth.currentUser!.email!;

    final DocumentReference postRef =
        await _firebasestor.collection('posts').add({
      "poster": poster,
      "comment": comment,
    });

    await postRef.set({
      'poster': poster,
      'comment': comment,
      'timestamp': Timestamp.now(),
    });
  }

  late String? post;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          // gradient: LinearGradient(
          //     begin: Alignment.topLeft,
          //     end: Alignment.bottomLeft,
          //     colors: [
          //       Colors.redAccent,
          //       Colors.deepPurple[500]!,
          //     ]),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Create poste',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  maxLines: 5,
                  onChanged: (val) {
                    post = val;
                  },
                  decoration: const InputDecoration(
                    hintText: 'wtite Post here',

                    // TextStyle(color: Color.fromARGB(204, 187, 99, 48)),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    // border: OutlineInputBorder(
                    //     borderRadius:
                    //         BorderRadius.all(Radius.circular(10))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyButton(
                    color: Colors.blue[900]!,
                    onPressed: () {
                      createPost();
                      Navigator.pop(context);
                    },
                    title: 'Post',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
