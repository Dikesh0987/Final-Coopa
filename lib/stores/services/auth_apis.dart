// Importing required packages
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coopa/stores/model/store_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

// A class for handling authentication and store related functions
class AuthAPI {
  static final auth = FirebaseAuth.instance; // Firebase authentication instance
  static final firestore =
      FirebaseFirestore.instance; // Firebase Firestore instance
  static final storage = FirebaseStorage.instance; // Firebase Storage instance
  static final fmessaging =
      FirebaseMessaging.instance; // Firebase Messaging instance

  static Store? cInfo; // Current store information, initially set to null
  static User get cstore =>
      auth.currentUser!; // Get the current authenticated user

  // Check if the store already exists in Firestore database
  static Future<bool> storeExists() async {
    return (await firestore.collection('stores').doc(cstore.uid).get()).exists;
  }

  // Create a new store in Firestore database
  static Future<void> createStore() async {
    final time = DateTime.now().millisecondsSinceEpoch.toString();

    final store = Store(
      images: cstore.photoURL.toString(),
      name: cstore.displayName.toString(),
      about: "Hii This is my store",
      password: "password",
      createdAt: time,
      id: cstore.uid,
      lastActive: time,
      isOnline: true,
      pushToken: '',
      email: cstore.email.toString(),
      location: 'location',
    );

    await firestore
        .collection('stores')
        .doc(cstore.uid)
        .set(store.toJson()); // Add the new store to Firestore database
    cInfo =
        store; // Set the current store information to the newly created store
  }

  // Get the current store information from Firestore database
  static Future<void> getCurrentStoreInfo() async {
    final storeSnapshot =
        await firestore.collection('stores').doc(cstore.uid).get();
    if (storeSnapshot.exists) {
      cInfo = Store.fromJson(storeSnapshot
          .data()!); // Set the current store information to the retrieved store data
      updateActiveStatus(true); // Update the store's active status as 'online'
    } else {
      await createStore(); // Create a new store if the current store does not exist in Firestore database
      await getCurrentStoreInfo(); // Get the current store information after creating the new store
    }
  }

  // Update the store's active status in Firestore database
  static Future<void> updateActiveStatus(bool isOnline) async {
    await firestore.collection('stores').doc(cstore.uid).update({
      'is_online':
          isOnline, // Set the store's active status as 'online' or 'offline'
      'last_active': DateTime.now()
          .millisecondsSinceEpoch
          .toString(), // Set the timestamp of the last active time
    });
  }

  // Set up the new store with given store name and password
  static Future<void> setupStore(String name, String password) async {
    final time = DateTime.now().millisecondsSinceEpoch.toString();

    final store = Store(
      images: cstore.photoURL.toString(),
      name: name,
      about: "Hii This is my store",
      password: password,
      createdAt: time,
      id: cstore.uid,
      lastActive: time,
      isOnline: true,
      pushToken: '',
      email: cstore.email.toString(),
      location: 'location',
    );
    // Set the store data in Firestore
    await firestore.collection('stores').doc(cstore.uid).set(store.toJson());

    // Set the "cInfo" variable to the created store object
    cInfo = store;
  }

// This function uploads a profile picture for the current store to Firebase Storage
// and updates the store's "images" field in Firestore with the download URL of the uploaded image.
  static Future<void> uploadProfilePicture(File file) async {
    final ext = file.path.split('.').last;
    final ref = storage.ref().child('store_pictures/${cstore.uid}.$ext');

    // Upload the file to Firebase Storage
    final snapshot =
        await ref.putFile(file, SettableMetadata(contentType: 'image/$ext'));

    // Update the "images" field of the current store in Firestore with the download URL of the uploaded image
    cInfo!.images = await snapshot.ref.getDownloadURL();
    await firestore
        .collection('stores')
        .doc(cstore.uid)
        .update({'images': cInfo!.images});
  }
}
