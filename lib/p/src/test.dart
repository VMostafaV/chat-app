// import 'package:chat_app/Screens/Widget/Chat_page.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';

// // import '../My_Button.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// import '../Screens/My_Button.dart';
// import '../Screens/Widget/HomePage.dart';
// // import '../Widget/HomePage.dart';

// class Logintest extends StatefulWidget {
//   const Logintest({super.key});

//   @override
//   State<Logintest> createState() => _LogintestState();
// }

// class _LogintestState extends State<LogintestPage> {
//   final _auth = FirebaseAuth.instance;
//   late String email;
//   late String password;
//   bool showSpiner = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(179, 58, 56, 56),
//       body: ModalProgressHUD(
//         inAsyncCall: showSpiner,
//         child: SafeArea(
//             child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               SizedBox(
//                 height: 100,
//               ),
//               SizedBox(
//                 height: 180,
//                 child: Image.asset('image/logo.png'),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 30),
//                 child: TextField(
//                   keyboardType: TextInputType.emailAddress,
//                   textAlign: TextAlign.center,
//                   onChanged: (ValueKey) {
//                     email = ValueKey;
//                   },
//                   decoration: const InputDecoration(
//                     hintText: 'Enter your Email',
//                     hintStyle:
//                         TextStyle(color: Color.fromARGB(193, 255, 255, 255)),
//                     contentPadding:
//                         EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(10))),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.orange, width: 1),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.blue, width: 2),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 30),
//                 child: TextField(
//                   keyboardType: TextInputType.phone,
//                   obscureText: true,
//                   textAlign: TextAlign.center,
//                   onChanged: (ValueKey) {
//                     password = ValueKey;
//                   },
//                   decoration: const InputDecoration(
//                     hintText: 'Enter your Password',
//                     hintStyle:
//                         TextStyle(color: Color.fromARGB(204, 255, 255, 255)),
//                     contentPadding:
//                         EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(10))),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.orange, width: 1),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.blue, width: 2),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               MyButton(
//                 color: Colors.yellow[900]!,
//                 onPressed: () async {
//                   setState(() {
//                     showSpiner = true;
//                   });
//                   try {
//                     final user = await _auth.signInWithEmailAndPassword(
//                       email: email,
//                       password: password,
//                     );
//                     if (user != null) {
//                       Navigator.pushNamed(context, HomePage.HomePageR);
//                       setState(() {
//                         showSpiner = false;
//                       });
//                     }
//                   } catch (e) {
//                     print(e);
//                   }
//                   {}
//                 },
//                 title: 'Login',
//               ),
//             ],
//           ),
//         )),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// //import '../My_Button.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// //import '../Widget/Chat_page.dart';
// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// import '../Screens/My_Button.dart';
// import '../Screens/Widget/HomePage.dart';

// //import '../Widget/HomePage.dart';

// class Regester extends StatefulWidget {
//   static const String RegesterPageR = 'RegesterPageR';
//   const Regester({super.key});

//   @override
//   State<Regester> createState() => _RegesterState();
// }

// class _RegesterState extends State<Regester> {
//   final _auth = FirebaseAuth.instance;
//   late String userName;
//   late String email;
//   late String password;
//   bool showSpiner = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(179, 58, 56, 56),
//       body: ModalProgressHUD(
//         inAsyncCall: showSpiner,
//         child: SafeArea(
//             child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               SizedBox(
//                 height: 100,
//               ),
//               SizedBox(
//                 height: 180,
//                 child: Image.asset('image/logo.png'),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 30),
//                 child: TextField(
//                   keyboardType: TextInputType.name,
//                   textAlign: TextAlign.center,
//                   onChanged: (ValueKey) {
//                     userName = ValueKey;
//                   },
//                   decoration: const InputDecoration(
//                     hintText: 'Enter your Name',
//                     hintStyle:
//                         TextStyle(color: Color.fromARGB(193, 255, 255, 255)),
//                     contentPadding:
//                         EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(10))),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.orange, width: 1),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.blue, width: 2),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 30),
//                 child: TextField(
//                   keyboardType: TextInputType.emailAddress,
//                   textAlign: TextAlign.center,
//                   onChanged: (val) {
//                     email = val;
//                   },
//                   decoration: const InputDecoration(
//                     hintText: 'Enter your Email',
//                     hintStyle:
//                         TextStyle(color: Color.fromARGB(204, 255, 255, 255)),
//                     contentPadding:
//                         EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(10))),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 30),
//                 child: TextField(
//                   obscureText: true,
//                   keyboardType: TextInputType.phone,
//                   textAlign: TextAlign.center,
//                   onChanged: (val) {
//                     password = val;
//                   },
//                   decoration: const InputDecoration(
//                     hintText: 'Enter your Phone Number',
//                     hintStyle: TextStyle(
//                         color: Color.fromARGB(204, 255, 255, 255),
//                         fontSize: 15),
//                     contentPadding:
//                         EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(10))),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.orange, width: 1),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.blue, width: 2),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               MyButton(
//                 color: Colors.blue[900]!,
//                 onPressed: () async {
//                   setState(() {
//                     showSpiner = true;
//                   });
//                   try {
//                     final user = await _auth.createUserWithEmailAndPassword(
//                       email: email,
//                       password: password,
//                     );
//                     if (user == null) {
//                       // showDialog(
//                       //   context: context,
//                       //   builder: (context) {
//                       //     return AlertDialog(
//                       //       shape: RoundedRectangleBorder(),
//                       //       backgroundColor: Colors.redAccent,
//                       //     );
//                       //   },
//                       // );
//                     }
//                     Navigator.pushNamed(context, HomePage.HomePageR);
//                     setState(() {
//                       showSpiner = false;
//                     });
//                   } catch (e) {
//                     // showDialog(
//                     //   context: context,
//                     //   builder: (context) {
//                     //     return AlertDialog(
//                     //       shape: RoundedRectangleBorder(),
//                     //       backgroundColor: Colors.redAccent,
//                     //     );
//                     //   },
//                     // );
//                     print(e);
//                   }
//                 },
//                 title: 'Regester',
//               ),
//             ],
//           ),
//         )),
//       ),
//     );
//   }
// }

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class Test extends StatelessWidget {
//   const Test({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: Container(
//                 height: 400,
//                 // width: double.infinity,
//                 //  margin: const EdgeInsets.all(10),
//                 child: Column(
//                   children: [
//                     Container(
//                       child: SCont(
//                         widget: Icon(
//                           Icons.sunny,
//                           color: Colors.cyan,
//                           size: 33,
//                         ),
//                         onpreesed: () {},
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 30, bottom: 30),
//                       child: SCont(
//                         widget: Icon(
//                           Icons.water_drop_outlined,
//                           color: Colors.cyan,
//                           size: 33,
//                         ),
//                         onpreesed: () {},
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(bottom: 30),
//                       child: SCont(
//                         widget: Icon(
//                           CupertinoIcons.decrease_quotelevel,
//                           color: Colors.cyan,
//                           size: 33,
//                         ),
//                         onpreesed: () {},
//                       ),
//                     ),
//                     SCont(
//                       widget: Icon(
//                         CupertinoIcons.wind,
//                         color: Colors.cyan,
//                         size: 33,
//                       ),
//                       onpreesed: () {},
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             Expanded(
//               flex: 3,
//               child: Container(
//                 // height: 600,
//                 decoration: const BoxDecoration(
//                   borderRadius:
//                       BorderRadius.only(bottomLeft: Radius.circular(50)),
//                   boxShadow: const <BoxShadow>[
//                     BoxShadow(
//                         offset: Offset(-5, 8),
//                         blurRadius: 10,
//                         spreadRadius: 1,
//                         color: Color.fromARGB(28, 0, 0, 0))
//                   ],
//                 ),
//                 child: Stack(
//                   children: [
//                     ClipRRect(
//                       borderRadius: BorderRadius.only(
//                         bottomLeft: Radius.circular(50),
//                       ),
//                       child: Image.asset(
//                         'image/w4.png',
//                         fit: BoxFit.cover,
//                         height: 600,
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 40, left: 250),
//                       child: Icon(
//                         CupertinoIcons.ellipsis,
//                         size: 30,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             )
//           ],
//         )
//       ]),
//     );
//   }
// }

// class SCont extends StatelessWidget {
//   SCont({required this.onpreesed, required this.widget, super.key});
//   Widget widget;
//   VoidCallback onpreesed;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onpreesed,
//       child: Container(
//         height: 55,
//         width: 55,
//         decoration: BoxDecoration(
//             boxShadow: const <BoxShadow>[
//               BoxShadow(
//                   offset: Offset(-3, 12),
//                   blurRadius: 10,
//                   spreadRadius: 1,
//                   color: Color.fromARGB(28, 0, 0, 0))
//             ],
//             borderRadius: BorderRadius.circular(10),
//             color: Color.fromARGB(255, 255, 255, 255)),
//         child: widget,
//       ),
//     );
//   }
// }

// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

// import 'dart:async';
// import 'dart:io';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:mime/mime.dart';
// import 'package:video_player/video_player.dart';

// class Test extends StatelessWidget {
//   const Test({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: 'Image Picker Demo',
//       home: MyHomePage(title: 'Image Picker Example'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, this.title});

//   final String? title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   List<XFile>? _mediaFileList;

//   void _setImageFileListFromFile(XFile? value) {
//     _mediaFileList = value == null ? null : <XFile>[value];
//   }

//   dynamic _pickImageError;
//   bool isVideo = false;

//   VideoPlayerController? _controller;
//   VideoPlayerController? _toBeDisposed;
//   String? _retrieveDataError;

//   final ImagePicker _picker = ImagePicker();
//   final TextEditingController maxWidthController = TextEditingController();
//   final TextEditingController maxHeightController = TextEditingController();
//   final TextEditingController qualityController = TextEditingController();

//   Future<void> _playVideo(XFile? file) async {
//     if (file != null && mounted) {
//       await _disposeVideoController();
//       late VideoPlayerController controller;
//       if (kIsWeb) {
//         controller = VideoPlayerController.network(file.path);
//       } else {
//         controller = VideoPlayerController.file(File(file.path));
//       }
//       _controller = controller;
//       // In web, most browsers won't honor a programmatic call to .play
//       // if the video has a sound track (and is not muted).
//       // Mute the video so it auto-plays in web!
//       // This is not needed if the call to .play is the result of user
//       // interaction (clicking on a "play" button, for example).
//       const double volume = kIsWeb ? 0.0 : 1.0;
//       await controller.setVolume(volume);
//       await controller.initialize();
//       await controller.setLooping(true);
//       await controller.play();
//       setState(() {});
//     }
//   }

//   Future<void> _onImageButtonPressed(
//     ImageSource source, {
//     required BuildContext context,
//     bool isMultiImage = false,
//     bool isMedia = false,
//   }) async {
//     if (_controller != null) {
//       await _controller!.setVolume(0.0);
//     }
//     if (context.mounted) {
//       if (isVideo) {
//         final XFile? file = await _picker.pickVideo(
//             source: source, maxDuration: const Duration(seconds: 10));
//         await _playVideo(file);
//       } else if (isMultiImage) {
//         await _displayPickImageDialog(context,
//             (double? maxWidth, double? maxHeight, int? quality) async {
//           try {
//             final List<XFile> pickedFileList = isMedia
//                 ? await _picker.pickMultipleMedia(
//                     maxWidth: maxWidth,
//                     maxHeight: maxHeight,
//                     imageQuality: quality,
//                   )
//                 : await _picker.pickMultiImage(
//                     maxWidth: maxWidth,
//                     maxHeight: maxHeight,
//                     imageQuality: quality,
//                   );
//             setState(() {
//               _mediaFileList = pickedFileList;
//             });
//           } catch (e) {
//             setState(() {
//               _pickImageError = e;
//             });
//           }
//         });
//       } else if (isMedia) {
//         await _displayPickImageDialog(context,
//             (double? maxWidth, double? maxHeight, int? quality) async {
//           try {
//             final List<XFile> pickedFileList = <XFile>[];
//             final XFile? media = await _picker.pickMedia(
//               maxWidth: maxWidth,
//               maxHeight: maxHeight,
//               imageQuality: quality,
//             );
//             if (media != null) {
//               pickedFileList.add(media);
//               setState(() {
//                 _mediaFileList = pickedFileList;
//               });
//             }
//           } catch (e) {
//             setState(() {
//               _pickImageError = e;
//             });
//           }
//         });
//       } else {
//         await _displayPickImageDialog(context,
//             (double? maxWidth, double? maxHeight, int? quality) async {
//           try {
//             final XFile? pickedFile = await _picker.pickImage(
//               source: source,
//               maxWidth: maxWidth,
//               maxHeight: maxHeight,
//               imageQuality: quality,
//             );
//             setState(() {
//               _setImageFileListFromFile(pickedFile);
//             });
//           } catch (e) {
//             setState(() {
//               _pickImageError = e;
//             });
//           }
//         });
//       }
//     }
//   }

//   @override
//   void deactivate() {
//     if (_controller != null) {
//       _controller!.setVolume(0.0);
//       _controller!.pause();
//     }
//     super.deactivate();
//   }

//   @override
//   void dispose() {
//     _disposeVideoController();
//     maxWidthController.dispose();
//     maxHeightController.dispose();
//     qualityController.dispose();
//     super.dispose();
//   }

//   Future<void> _disposeVideoController() async {
//     if (_toBeDisposed != null) {
//       await _toBeDisposed!.dispose();
//     }
//     _toBeDisposed = _controller;
//     _controller = null;
//   }

//   Widget _previewVideo() {
//     final Text? retrieveError = _getRetrieveErrorWidget();
//     if (retrieveError != null) {
//       return retrieveError;
//     }
//     if (_controller == null) {
//       return const Text(
//         'You have not yet picked a video',
//         textAlign: TextAlign.center,
//       );
//     }
//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: AspectRatioVideo(_controller),
//     );
//   }

//   Widget _previewImages() {
//     final Text? retrieveError = _getRetrieveErrorWidget();
//     if (retrieveError != null) {
//       return retrieveError;
//     }
//     if (_mediaFileList != null) {
//       return Semantics(
//         label: 'image_picker_example_picked_images',
//         child: ListView.builder(
//           key: UniqueKey(),
//           itemBuilder: (BuildContext context, int index) {
//             final String? mime = lookupMimeType(_mediaFileList![index].path);

//             // Why network for web?
//             // See https://pub.dev/packages/image_picker_for_web#limitations-on-the-web-platform
//             return Semantics(
//               label: 'image_picker_example_picked_image',
//               child: kIsWeb
//                   ? Image.network(_mediaFileList![index].path)
//                   : (mime == null || mime.startsWith('image/')
//                       ? Image.file(
//                           File(_mediaFileList![index].path),
//                           errorBuilder: (BuildContext context, Object error,
//                               StackTrace? stackTrace) {
//                             return const Center(
//                                 child:
//                                     Text('This image type is not supported'));
//                           },
//                         )
//                       : _buildInlineVideoPlayer(index)),
//             );
//           },
//           itemCount: _mediaFileList!.length,
//         ),
//       );
//     } else if (_pickImageError != null) {
//       return Text(
//         'Pick image error: $_pickImageError',
//         textAlign: TextAlign.center,
//       );
//     } else {
//       return const Text(
//         'You have not yet picked an image.',
//         textAlign: TextAlign.center,
//       );
//     }
//   }

//   Widget _buildInlineVideoPlayer(int index) {
//     final VideoPlayerController controller =
//         VideoPlayerController.file(File(_mediaFileList![index].path));
//     const double volume = kIsWeb ? 0.0 : 1.0;
//     controller.setVolume(volume);
//     controller.initialize();
//     controller.setLooping(true);
//     controller.play();
//     return Center(child: AspectRatioVideo(controller));
//   }

//   Widget _handlePreview() {
//     if (isVideo) {
//       return _previewVideo();
//     } else {
//       return _previewImages();
//     }
//   }

//   Future<void> retrieveLostData() async {
//     final LostDataResponse response = await _picker.retrieveLostData();
//     if (response.isEmpty) {
//       return;
//     }
//     if (response.file != null) {
//       if (response.type == RetrieveType.video) {
//         isVideo = true;
//         await _playVideo(response.file);
//       } else {
//         isVideo = false;
//         setState(() {
//           if (response.files == null) {
//             _setImageFileListFromFile(response.file);
//           } else {
//             _mediaFileList = response.files;
//           }
//         });
//       }
//     } else {
//       _retrieveDataError = response.exception!.code;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title!),
//       ),
//       body: Center(
//         child: !kIsWeb && defaultTargetPlatform == TargetPlatform.android
//             ? FutureBuilder<void>(
//                 future: retrieveLostData(),
//                 builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
//                   switch (snapshot.connectionState) {
//                     case ConnectionState.none:
//                     case ConnectionState.waiting:
//                       return const Text(
//                         'You have not yet picked an image.',
//                         textAlign: TextAlign.center,
//                       );
//                     case ConnectionState.done:
//                       return _handlePreview();
//                     case ConnectionState.active:
//                       if (snapshot.hasError) {
//                         return Text(
//                           'Pick image/video error: ${snapshot.error}}',
//                           textAlign: TextAlign.center,
//                         );
//                       } else {
//                         return const Text(
//                           'You have not yet picked an image.',
//                           textAlign: TextAlign.center,
//                         );
//                       }
//                   }
//                 },
//               )
//             : _handlePreview(),
//       ),
//       floatingActionButton: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: <Widget>[
//           Semantics(
//             label: 'image_picker_example_from_gallery',
//             child: FloatingActionButton(
//               onPressed: () {
//                 isVideo = false;
//                 _onImageButtonPressed(ImageSource.gallery, context: context);
//               },
//               heroTag: 'image0',
//               tooltip: 'Pick Image from gallery',
//               child: const Icon(Icons.photo),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 16.0),
//             child: FloatingActionButton(
//               onPressed: () {
//                 isVideo = false;
//                 _onImageButtonPressed(
//                   ImageSource.gallery,
//                   context: context,
//                   isMultiImage: true,
//                   isMedia: true,
//                 );
//               },
//               heroTag: 'multipleMedia',
//               tooltip: 'Pick Multiple Media from gallery',
//               child: const Icon(Icons.photo_library),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 16.0),
//             child: FloatingActionButton(
//               onPressed: () {
//                 isVideo = false;
//                 _onImageButtonPressed(
//                   ImageSource.gallery,
//                   context: context,
//                   isMedia: true,
//                 );
//               },
//               heroTag: 'media',
//               tooltip: 'Pick Single Media from gallery',
//               child: const Icon(Icons.photo_library),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 16.0),
//             child: FloatingActionButton(
//               onPressed: () {
//                 isVideo = false;
//                 _onImageButtonPressed(
//                   ImageSource.gallery,
//                   context: context,
//                   isMultiImage: true,
//                 );
//               },
//               heroTag: 'image1',
//               tooltip: 'Pick Multiple Image from gallery',
//               child: const Icon(Icons.photo_library),
//             ),
//           ),
//           if (_picker.supportsImageSource(ImageSource.camera))
//             Padding(
//               padding: const EdgeInsets.only(top: 16.0),
//               child: FloatingActionButton(
//                 onPressed: () {
//                   isVideo = false;
//                   _onImageButtonPressed(ImageSource.camera, context: context);
//                 },
//                 heroTag: 'image2',
//                 tooltip: 'Take a Photo',
//                 child: const Icon(Icons.camera_alt),
//               ),
//             ),
//           Padding(
//             padding: const EdgeInsets.only(top: 16.0),
//             child: FloatingActionButton(
//               backgroundColor: Colors.red,
//               onPressed: () {
//                 isVideo = true;
//                 _onImageButtonPressed(ImageSource.gallery, context: context);
//               },
//               heroTag: 'video0',
//               tooltip: 'Pick Video from gallery',
//               child: const Icon(Icons.video_library),
//             ),
//           ),
//           if (_picker.supportsImageSource(ImageSource.camera))
//             Padding(
//               padding: const EdgeInsets.only(top: 16.0),
//               child: FloatingActionButton(
//                 backgroundColor: Colors.red,
//                 onPressed: () {
//                   isVideo = true;
//                   _onImageButtonPressed(ImageSource.camera, context: context);
//                 },
//                 heroTag: 'video1',
//                 tooltip: 'Take a Video',
//                 child: const Icon(Icons.videocam),
//               ),
//             ),
//         ],
//       ),
//     );
//   }

//   Text? _getRetrieveErrorWidget() {
//     if (_retrieveDataError != null) {
//       final Text result = Text(_retrieveDataError!);
//       _retrieveDataError = null;
//       return result;
//     }
//     return null;
//   }

//   Future<void> _displayPickImageDialog(
//       BuildContext context, OnPickImageCallback onPick) async {
//     return showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: const Text('Add optional parameters'),
//             content: Column(
//               children: <Widget>[
//                 TextField(
//                   controller: maxWidthController,
//                   keyboardType:
//                       const TextInputType.numberWithOptions(decimal: true),
//                   decoration: const InputDecoration(
//                       hintText: 'Enter maxWidth if desired'),
//                 ),
//                 TextField(
//                   controller: maxHeightController,
//                   keyboardType:
//                       const TextInputType.numberWithOptions(decimal: true),
//                   decoration: const InputDecoration(
//                       hintText: 'Enter maxHeight if desired'),
//                 ),
//                 TextField(
//                   controller: qualityController,
//                   keyboardType: TextInputType.number,
//                   decoration: const InputDecoration(
//                       hintText: 'Enter quality if desired'),
//                 ),
//               ],
//             ),
//             actions: <Widget>[
//               TextButton(
//                 child: const Text('CANCEL'),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//               TextButton(
//                   child: const Text('PICK'),
//                   onPressed: () {
//                     final double? width = maxWidthController.text.isNotEmpty
//                         ? double.parse(maxWidthController.text)
//                         : null;
//                     final double? height = maxHeightController.text.isNotEmpty
//                         ? double.parse(maxHeightController.text)
//                         : null;
//                     final int? quality = qualityController.text.isNotEmpty
//                         ? int.parse(qualityController.text)
//                         : null;
//                     onPick(width, height, quality);
//                     Navigator.of(context).pop();
//                   }),
//             ],
//           );
//         });
//   }
// }

// typedef OnPickImageCallback = void Function(
//     double? maxWidth, double? maxHeight, int? quality);

// class AspectRatioVideo extends StatefulWidget {
//   const AspectRatioVideo(this.controller, {super.key});

//   final VideoPlayerController? controller;

//   @override
//   AspectRatioVideoState createState() => AspectRatioVideoState();
// }

// class AspectRatioVideoState extends State<AspectRatioVideo> {
//   VideoPlayerController? get controller => widget.controller;
//   bool initialized = false;

//   void _onVideoControllerUpdate() {
//     if (!mounted) {
//       return;
//     }
//     if (initialized != controller!.value.isInitialized) {
//       initialized = controller!.value.isInitialized;
//       setState(() {});
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     controller!.addListener(_onVideoControllerUpdate);
//   }

//   @override
//   void dispose() {
//     controller!.removeListener(_onVideoControllerUpdate);
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (initialized) {
//       return Center(
//         child: AspectRatio(
//           aspectRatio: controller!.value.aspectRatio,
//           child: VideoPlayer(controller!),
//         ),
//       );
//     } else {
//       return Container();
//     }
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// pickImage(ImageSource source) async {
//   final ImagePicker _imagePicker = ImagePicker();
//   XFile? file = await _imagePicker.pickImage(source: source);
//   if (file != null) {
//     return file.readAsBytes();
//   }
//   print('No Image selected');
// }

// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert' show json;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

import 'sign_in_button.dart';
import 'package:sign_in_button/sign_in_button.dart';

/// The scopes required by this application.
const List<String> scopes = <String>[
  'email',
  'https://www.googleapis.com/auth/contacts.readonly',
];

GoogleSignIn _googleSignIn = GoogleSignIn(
  // Optional clientId
  // clientId: 'your-client_id.apps.googleusercontent.com',
  scopes: scopes,
);

// void main() {
//   runApp(
//     const MaterialApp(
//       title: 'Google Sign In',
//       home: SignInDemo(),
//     ),
//   );
// }

/// The SignInDemo app.
class SignInDemo extends StatefulWidget {
  ///
  const SignInDemo({super.key});

  @override
  State createState() => _SignInDemoState();
}

class _SignInDemoState extends State<SignInDemo> {
  GoogleSignInAccount? _currentUser;
  bool _isAuthorized = false; // has granted permissions?
  String _contactText = '';

  @override
  void initState() {
    super.initState();

    _googleSignIn.onCurrentUserChanged
        .listen((GoogleSignInAccount? account) async {
      // In mobile, being authenticated means being authorized...
      bool isAuthorized = account != null;
      // However, in the web...
      if (kIsWeb && account != null) {
        isAuthorized = await _googleSignIn.canAccessScopes(scopes);
      }

      setState(() {
        _currentUser = account;
        _isAuthorized = isAuthorized;
      });

      // Now that we know that the user can access the required scopes, the app
      // can call the REST API.
      if (isAuthorized) {
        unawaited(_handleGetContact(account!));
      }
    });

    // In the web, _googleSignIn.signInSilently() triggers the One Tap UX.
    //
    // It is recommended by Google Identity Services to render both the One Tap UX
    // and the Google Sign In button together to "reduce friction and improve
    // sign-in rates" ([docs](https://developers.google.com/identity/gsi/web/guides/display-button#html)).
    _googleSignIn.signInSilently();
  }

  // Calls the People API REST endpoint for the signed-in user to retrieve information.
  Future<void> _handleGetContact(GoogleSignInAccount user) async {
    setState(() {
      _contactText = 'Loading contact info...';
    });
    final http.Response response = await http.get(
      Uri.parse('https://people.googleapis.com/v1/people/me/connections'
          '?requestMask.includeField=person.names'),
      headers: await user.authHeaders,
    );
    if (response.statusCode != 200) {
      setState(() {
        _contactText = 'People API gave a ${response.statusCode} '
            'response. Check logs for details.';
      });
      print('People API ${response.statusCode} response: ${response.body}');
      return;
    }
    final Map<String, dynamic> data =
        json.decode(response.body) as Map<String, dynamic>;
    final String? namedContact = _pickFirstNamedContact(data);
    setState(() {
      if (namedContact != null) {
        _contactText = 'I see you know $namedContact!';
      } else {
        _contactText = 'No contacts to display.';
      }
    });
  }

  String? _pickFirstNamedContact(Map<String, dynamic> data) {
    final List<dynamic>? connections = data['connections'] as List<dynamic>?;
    final Map<String, dynamic>? contact = connections?.firstWhere(
      (dynamic contact) => (contact as Map<Object?, dynamic>)['names'] != null,
      orElse: () => null,
    ) as Map<String, dynamic>?;
    if (contact != null) {
      final List<dynamic> names = contact['names'] as List<dynamic>;
      final Map<String, dynamic>? name = names.firstWhere(
        (dynamic name) =>
            (name as Map<Object?, dynamic>)['displayName'] != null,
        orElse: () => null,
      ) as Map<String, dynamic>?;
      if (name != null) {
        return name['displayName'] as String?;
      }
    }
    return null;
  }

  // This is the on-click handler for the Sign In button that is rendered by Flutter.
  //
  // On the web, the on-click handler of the Sign In button is owned by the JS
  // SDK, so this method can be considered mobile only.
  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  // Prompts the user to authorize `scopes`.
  //
  // This action is **required** in platforms that don't perform Authentication
  // and Authorization at the same time (like the web).
  //
  // On the web, this must be called from an user interaction (button click).
  Future<void> _handleAuthorizeScopes() async {
    final bool isAuthorized = await _googleSignIn.requestScopes(scopes);
    setState(() {
      _isAuthorized = isAuthorized;
    });
    if (isAuthorized) {
      unawaited(_handleGetContact(_currentUser!));
    }
  }

  Future<void> _handleSignOut() => _googleSignIn.disconnect();

  Widget _buildBody() {
    final GoogleSignInAccount? user = _currentUser;
    if (user != null) {
      // The user is Authenticated
      return SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(35),
                ),
                child: ListTile(
                  leading: GoogleUserCircleAvatar(
                    identity: user,
                  ),
                  title: Text(user.displayName ?? ''),
                  subtitle: Text(user.email),
                  trailing: IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              title: Text('Loading..'),
                            );
                          });
                    },
                    icon: Icon(CupertinoIcons.ellipsis),
                  ),
                ),
              ),
            ),
            //     const Text('Signed in successfully.'),
            if (_isAuthorized) ...<Widget>[
              // The user has Authorized all required scopes
              ///   Text(_contactText),
              ElevatedButton(
                child: const Text('REFRESH'),
                onPressed: () => _handleGetContact(user),
              ),
            ],
            if (!_isAuthorized) ...<Widget>[
              // The user has NOT Authorized all required scopes.
              // (Mobile users may never see this button!)
              const Text(
                  'Additional permissions needed to read your contacts.'),
              ElevatedButton(
                onPressed: _handleAuthorizeScopes,
                child: const Text('REQUEST PERMISSIONS'),
              ),
            ],
            ElevatedButton(
              onPressed: _handleSignOut,
              child: const Text('SIGN OUT'),
            ),
          ],
        ),
      );
    } else {
      // The user is NOT Authenticated
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          const Text('You are not currently signed in.'),
          // This method is used to separate mobile from web code with conditional exports.
          // See: src/sign_in_button.dart
          TextButton(
            child: Text('Sign in'),
            onPressed: _handleSignIn,
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Color.fromARGB(255, 74, 2, 102),
        body: ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: _buildBody(),
    ));
  }
}
