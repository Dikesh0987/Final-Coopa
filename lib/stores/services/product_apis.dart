// // Importing required packages
// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:coopa/stores/model/location_model.dart';
// import 'package:coopa/stores/model/product_model.dart';
// import 'package:coopa/stores/model/store_model.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';

// import 'package:fluttertoast/fluttertoast.dart';

// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'dart:io';

// // A class for handling authentication and store related functions
// class AuthAPI {
//   static late final auth =
//       FirebaseAuth.instance; // Firebase authentication instance
//   static final firestore =
//       FirebaseFirestore.instance; // Firebase Firestore instance
//   static final storage = FirebaseStorage.instance; // Firebase Storage instance
//   static final fmessaging =
//       FirebaseMessaging.instance; // Firebase Messaging instance

//   static Store? cInfo; // Current store information, initially set to null
//   static User get cstore =>
//       auth.currentUser!; // Get the current authenticated user

//   // Check if the store already exists in Firestore database
//   static Future<bool> storeExists() async {
//     return (await firestore.collection('stores').doc(cstore.uid).get()).exists;
//   }

//   // Create a new store in Firestore database
//   static Future<void> createStore() async {
//     final time = DateTime.now().millisecondsSinceEpoch.toString();

//     final store = Store(
//       images: cstore.photoURL.toString(),
//       name: cstore.displayName.toString(),
//       about: "Hii This is my store",
//       password: "password",
//       createdAt: time,
//       id: cstore.uid,
//       lastActive: time,
//       isOnline: true,
//       pushToken: '',
//       email: cstore.email.toString(),
//       // location: 'location',
//     );

//     await firestore
//         .collection('stores')
//         .doc(cstore.uid)
//         .set(store.toJson()); // Add the new store to Firestore database
//     cInfo =
//         store; // Set the current store information to the newly created store
//   }

//   // Get the current store information from Firestore database
//   static Future<void> getCurrentStoreInfo() async {
//     final storeSnapshot =
//         await firestore.collection('stores').doc(cstore.uid).get();
//     if (storeSnapshot.exists) {
//       cInfo = Store.fromJson(storeSnapshot
//           .data()!); // Set the current store information to the retrieved store data
//       updateActiveStatus(true); // Update the store's active status as 'online'
//     } else {
//       await createStore(); // Create a new store if the current store does not exist in Firestore database
//       await getCurrentStoreInfo(); // Get the current store information after creating the new store
//     }
//   }

//   // Update the store's active status in Firestore database
//   static Future<void> updateActiveStatus(bool isOnline) async {
//     await firestore.collection('stores').doc(cstore.uid).update({
//       'is_online':
//           isOnline, // Set the store's active status as 'online' or 'offline'
//       'last_active': DateTime.now()
//           .millisecondsSinceEpoch
//           .toString(), // Set the timestamp of the last active time
//     });
//   }

//   // Set up the new store with given store name and password
//   static Future<void> setupStore(
//     String name,
//     String password,
//     String currentAddress,
//     double latitude,
//     double longitude,
//   ) async {
//     final time = DateTime.now().millisecondsSinceEpoch.toString();

//     final store = Store(
//       images: cstore.photoURL.toString(),
//       name: name,
//       about: "Hii This is my store",
//       password: password,
//       createdAt: time,
//       id: cstore.uid,
//       lastActive: time,
//       isOnline: true,
//       pushToken: '',
//       email: cstore.email.toString(),
//       // location: 'location',
//     );

//     // Set the store data in Firestore
//     await firestore.collection('stores').doc(cstore.uid).set(store.toJson());

//     // Set the "cInfo" variable to the created store object
//     cInfo = store;

//     final geolocation = GeoLocation(
//         latitude: latitude, longitude: longitude, address: currentAddress);

//     await firestore
//         .collection('stores')
//         .doc(cstore.uid)
//         .collection('location')
//         .doc('geoLocation')
//         .set(geolocation.toJson());
//   }

// // This function uploads a profile picture for the current store to Firebase Storage
// // and updates the store's "images" field in Firestore with the download URL of the uploaded image.
//   static Future<void> uploadProfilePicture(File file) async {
//     final ext = file.path.split('.').last;
//     final ref = storage.ref().child('store_pictures/${cstore.uid}.$ext');

//     // Upload the file to Firebase Storage
//     final snapshot =
//         await ref.putFile(file, SettableMetadata(contentType: 'image/$ext'));

//     // Update the "images" field of the current store in Firestore with the download URL of the uploaded image
//     cInfo!.images = await snapshot.ref.getDownloadURL();
//     await firestore
//         .collection('stores')
//         .doc(cstore.uid)
//         .update({'images': cInfo!.images});
//   }

//   // Update store data

//   static Future<void> updateStoreData(String name, about) async {
//     final currentUser = FirebaseAuth.instance.currentUser;

//     if (currentUser == null) {
//       // Handle the case where there is no current user
//       return;
//     }

//     try {
//       await FirebaseFirestore.instance
//           .collection('stores')
//           .doc(currentUser.uid)
//           .update({
//         'name': name,
//         'about': about,
//       });
//     } catch (e) {
//       // Handle the error gracefully
//       print('Failed to update store info: $e');
//     }
//   }

//   /// ++++++ For products based API'S ++++++ ///
//   ///

//   static Product? pInfo;

//   static Future<void> addNewProduct(String title, price, discount, quantity,
//       description, File imagefile) async {
//     final time = DateTime.now().millisecondsSinceEpoch.toString();
//     final pId = new DateTime.now().millisecondsSinceEpoch;
//     final product = Product(
//         uniqueId: cstore.uid,
//         title: title,
//         price: price,
//         image: '',
//         discount: discount,
//         isAvailable: true,
//         registerAt: time,
//         quantity: quantity,
//         modifyAt: time,
//         description: description);

//     await firestore
//         .collection('inventory')
//         .doc(cstore.uid)
//         .collection('products')
//         .doc(time)
//         .set(product.toJson()); // Add the new store to Firestore database

//     final ext = imagefile.path.split('.').last;

//     final ref =
//         storage.ref().child('products_images/${cstore.uid}/${pId}.$ext');

//     // Upload the file to Firebase Storage
//     final snapshot = await ref.putFile(
//         imagefile, SettableMetadata(contentType: 'image/$ext'));

//     // Update the "images" field of the current store in Firestore with the download URL of the uploaded image
//     final storageImageUrl = await snapshot.ref.getDownloadURL();

//     try {
//       await FirebaseFirestore.instance
//           .collection('inventory')
//           .doc(cstore.uid)
//           .collection('products')
//           .doc(time)
//           .update({
//         'image': storageImageUrl,
//       });
//     } catch (e) {
//       // Handle the error gracefully
//       print('Failed to update store image: $e');
//     }
//   }

//   // For geting all products
//   static Stream<QuerySnapshot<Map<String, dynamic>>> getAllProducts(
//       String sId) {
//     return AuthAPI.firestore
//         .collection('inventory')
//         .doc('${cstore.uid.toString()}')
//         .collection('products')
//         .snapshots();
//   }

//   //  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllProducts() {
//   //   return AuthAPI.firestore
//   //       .collection('inventory')
//   //     .doc(cstore.uid)
//   //     .collection('products')
//   //     .snapshots();
//   // }

//   // update product details
//   static Future<void> updateProductData(String title, price, quantity, discount,
//       description, ragisterAtid) async {
//     final currentUser = FirebaseAuth.instance.currentUser;

//     if (currentUser == null) {
//       // Handle the case where there is no current user
//       return;
//     }

//     try {
//       await FirebaseFirestore.instance
//           .collection('inventory')
//           .doc('${cstore.uid.toString()}')
//           .collection('products')
//           .doc(ragisterAtid)
//           .update({
//         'title': title,
//         'price': price,
//         'quantity': quantity,
//         'discount': discount,
//         'description': description,
//       });
//     } catch (e) {
//       // Handle the error gracefully
//       print('Failed to update product info: $e');
//     }
//   }

//   // update avalabilty
//   static Future<void> productAvailability(Product product, bool status) async {
//     final currentUser = FirebaseAuth.instance.currentUser;

//     if (currentUser == null) {
//       // Handle the case where there is no current user
//       return;
//     }

//     try {
//       await FirebaseFirestore.instance
//           .collection('inventory')
//           .doc('${cstore.uid.toString()}')
//           .collection('products')
//           .doc(product.registerAt)
//           .update({
//         'isAvailable': status,
//       });
//     } catch (e) {
//       // Handle the error gracefully
//       print('Failed to update product status: $e');
//     }
//   }

//   // delete product
//   static Future<void> deleteProduct(Product product) async {
//     final currentUser = FirebaseAuth.instance.currentUser;

//     if (currentUser == null) {
//       // Handle the case where there is no current user
//       return;
//     }

//     try {
//       // Delete the product document from Firestore
//       await FirebaseFirestore.instance
//           .collection('inventory')
//           .doc(cstore.uid)
//           .collection('products')
//           .doc(product.registerAt)
//           .delete();

//       // Delete the image file from Cloud Storage
//       await FirebaseStorage.instance.refFromURL(product.image).delete();
//     } catch (e) {
//       // Handle the error gracefully
//       print('Failed to delete product: $e');
//     }
//   }

//   /// for store status online or offline
//   // update avalabilty
//   static Future<void> storeStatus(Store store, bool status) async {
//     final currentUser = FirebaseAuth.instance.currentUser;

//     if (currentUser == null) {
//       // Handle the case where there is no current user
//       return;
//     }

//     try {
//       await FirebaseFirestore.instance
//           .collection('store')
//           .doc('${cstore.uid.toString()}')
//           .update({
//         'isOnline': status,
//       });
//     } catch (e) {
//       // Handle the error gracefully
//       print('Failed to update store status: $e');
//     }
//   }

//   /// -- get all users connections --- ///
//   static Stream<QuerySnapshot<Map<String, dynamic>>> getAllStoreConn() {
//     return AuthAPI.firestore
//         .collection('stores')
//         .doc(AuthAPI.cstore.uid)
//         .collection('connections_list')
//         .where('status', isEqualTo: 'accept')
//         .snapshots();
//   }

//   static Stream<QuerySnapshot<Map<String, dynamic>>> getSalectedUserData(
//       List<String> sId) {
//     return AuthAPI.firestore
//         .collection('users')
//         .where('id', whereIn: sId)
//         .snapshots();
//   }

//   // for make connection functions ..
//   static Future<void> dropConnections(Store store) async {
//     firestore
//         .collection('users')
//         .doc(AuthAPI.cstore.uid)
//         .collection('connections_list')
//         .doc(store.id)
//         .delete();
//     firestore
//         .collection('stores')
//         .doc(store.id)
//         .collection('connections_list')
//         .doc(AuthAPI.cstore.uid)
//         .delete();
//   }
// }
