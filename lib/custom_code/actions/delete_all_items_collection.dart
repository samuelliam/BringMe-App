// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:bring_me/auth/firebase_auth/auth_util.dart';
import 'package:bring_me/auth/firebase_auth/firebase_auth_manager.dart';

Future deleteAllItemsCollection() async {
  // delete all item collection inside user firebase
// Get the current user's ID
  String userId = currentUserUid;

  // Get a reference to the user's collection
  CollectionReference userCollection = FirebaseFirestore.instance
      .collection('users')
      .doc(userId)
      .collection('items');

  // Get all the documents in the collection
  QuerySnapshot querySnapshot = await userCollection.get();

  // Loop through all the documents and delete them
  for (DocumentSnapshot documentSnapshot in querySnapshot.docs) {
    await documentSnapshot.reference.delete();
  }
}
