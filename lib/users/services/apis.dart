// Import required packages
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coopa/stores/model/store_model.dart';
import 'package:coopa/users/model/connnection_model.dart';
import 'package:coopa/users/model/location_model.dart';
import 'package:coopa/users/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';

// APIs class provides access to Firebase services
class APIs {
  // Firebase authentication instance
  static final auth = FirebaseAuth.instance;

  // Firebase Firestore instance
  static final firestore = FirebaseFirestore.instance;

  // Firebase Storage instance
  static final storage = FirebaseStorage.instance;

  // Firebase Messaging instance
  static final fmessaging = FirebaseMessaging.instance;

  // Current user information, initially set to null
  static UserModel? uInfo;

  // Get the current authenticated user
  static User get cuser => auth.currentUser!;

  // Check if the user already exists in Firestore database
  static Future<bool> userExists() async {
    return (await firestore.collection('users').doc(cuser.uid).get()).exists;
  }

  static Future<void> setupUserAcc(String name, String password,
      double latitude, longitude, String currentAddress) async {
    final time = DateTime.now().millisecondsSinceEpoch.toString();

    final users = UserModel(
      images: cuser.photoURL.toString(),
      name: name,
      about: "Hii This is my Coopa acc",
      createdAt: time,
      password: password,
      id: cuser.uid,
      lastActive: time,
      isOnline: true,
      pushToken: '',
      email: cuser.email.toString(),
      // location: 'location',
    );
    // Set the store data in Firestore
    await firestore.collection('users').doc(cuser.uid).set(users.toJson());

    // Set the "uInfo" variable to the created store object
    uInfo = users;

    final geolocation = GeoLocation(
        latitude: latitude, longitude: longitude, address: currentAddress);

    await firestore
        .collection('users')
        .doc(cuser.uid)
        .collection('location')
        .doc('geoLocation')
        .set(geolocation.toJson());
  }

  // Get the current user information from Firestore database
  static Future<void> getCurrentUserInfo() async {
    final storeSnapshot =
        await firestore.collection('users').doc(cuser.uid).get();
    if (storeSnapshot.exists) {
      uInfo = UserModel.fromJson(storeSnapshot
          .data()!); // Set the current store information to the retrieved store data
      updateActiveStatus(true); // Update the store's active status as 'online'
    } else {
      // await createStore(); // Create a new store if the current store does not exist in Firestore database
      await getCurrentUserInfo(); // Get the current store information after creating the new store
    }
  }

  // Update the store's active status in Firestore database
  static Future<void> updateActiveStatus(bool isOnline) async {
    await firestore.collection('users').doc(cuser.uid).update({
      'is_online':
          isOnline, // Set the store's active status as 'online' or 'offline'
      'last_active': DateTime.now()
          .millisecondsSinceEpoch
          .toString(), // Set the timestamp of the last active time
    });
  }

  // This function uploads a profile picture for the current store to Firebase Storage
// and updates the store's "images" field in Firestore with the download URL of the uploaded image.
  static Future<void> uploadProfilePicture(File file) async {
    final ext = file.path.split('.').last;
    final ref = storage.ref().child('user_profile_pic/${cuser.uid}.$ext');

    // Upload the file to Firebase Storage
    final snapshot =
        await ref.putFile(file, SettableMetadata(contentType: 'image/$ext'));

    // Update the "images" field of the current store in Firestore with the download URL of the uploaded image
    uInfo!.images = await snapshot.ref.getDownloadURL();
    await firestore
        .collection('users')
        .doc(cuser.uid)
        .update({'images': uInfo!.images});
  }

  // Update user data

  static Future<void> updateUserData(String name, about) async {
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      // Handle the case where there is no current user
      return;
    }

    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.uid)
          .update({
        'name': name,
        'about': about,
      });
    } catch (e) {
      // Handle the error gracefully
      print('Failed to update user info: $e');
    }
  }

  // For geting all stores
  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllStores() {
    return APIs.firestore.collection('stores').snapshots();
  }

  // For geting pro stores
  static Stream<QuerySnapshot<Map<String, dynamic>>> getStores(List sid) {
    return APIs.firestore
        .collection('stores')
        .where('id', isEqualTo: sid)
        .snapshots();
  }

// for get all products according to time ..
  // For geting all products
  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllProductsAccToTime() {
    return APIs.firestore
        .collection('products')
        .orderBy('registerAt', descending: true)
        .snapshots();
  }

  /// ------- For make new connectuin through ----- ///

  // for create a new connection id ..
  static String getConnectionID(String id) {
    return cuser.uid.hashCode <= id.hashCode
        ? '${cuser.uid}_$id'
        : '${id}_${cuser.uid}';
  }

  // for make connection functions ..
  static Future<void> makeNewConnections(Store store) async {
    final time = DateTime.now().millisecondsSinceEpoch.toString();

    final connection = ConnectionModel(
      connectionId: getConnectionID(store.id),
      fromId: APIs.uInfo!.id,
      toId: store.id,
      status: 'pending',
      sent: time,
    );

    final connectionmodel = ConnectionModel(
      connectionId: getConnectionID(store.id),
      fromId: APIs.uInfo!.id,
      toId: store.id,
      status: 'accept',
      sent: time,
    );
    firestore
        .collection('users')
        .doc(APIs.uInfo!.id)
        .collection('connections_list')
        .doc(store.id)
        .set(connection.toJson());
    firestore
        .collection('stores')
        .doc(store.id)
        .collection('connections_list')
        .doc(APIs.uInfo!.id)
        .set(connection.toJson());
  }
}
