import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

final FirebaseStorage _storage = FirebaseStorage.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class StoreData {
  // ignore: non_constant_identifier_names
  Future<String> UploudPhotoToStorage(String childname, Uint8List file) async {
    Reference ref = _storage.ref().child(childname);

    UploadTask uploadTask = ref.putData(file);

    TaskSnapshot taskSnapshot = await uploadTask;

    String dounloadUrl = await taskSnapshot.ref.getDownloadURL();

    return dounloadUrl;
  }

  Future<String> saveData({
    required Uint8List file,
    required String name,
    required String bio,
  }) async {
    //Reference reference=FirebaseStorage.instance.ref('uploads/$filename');
    String res = 'Some error oqored';
    try {
      if (name.isNotEmpty) {
        // ignore: no_leading_underscores_for_local_identifiers
        String _imagesave = await UploudPhotoToStorage('profileUser', file);
        await _firestore
            .collection('userProfile')
            .add({'name': name, 'bio': bio, 'imageLink': _imagesave});
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
