import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  UserModel({
    required this.images,
    required this.name,
    required this.about,
    required this.createdAt,
    required this.id,
    required this.lastActive,
    required this.isOnline,
    required this.password,
    required this.pushToken,
    required this.email,
    // required this.location,
  });

  late String images;
  late String name;
  late String about;
  late String createdAt;
  late String id;
  late String lastActive;
  late bool isOnline;
  late String password;
  late String pushToken;
  late String email;
  // late String location;

  UserModel.fromJson(Map<String, dynamic> json)
      : images = json['images'] ?? '',
        name = json['name'] ?? '',
        about = json['about'] ?? '',
        createdAt = json['created_at'] ?? '',
        id = json['id'] ?? '',
        lastActive = json['last_active'] ?? '',
        isOnline = json["is_online"] ?? false,
        password = json['password'] ?? '',
        pushToken = json['push_token'] ?? '',
        email = json['email'] ?? '';
        // location = json['location'] ?? '';

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['images'] = images;
    data['name'] = name;
    data['about'] = about;
    data['created_at'] = createdAt;
    data['id'] = id;
    data['last_active'] = lastActive;
    data['is_online'] = isOnline;
    data['password'] = password;
    data['push_token'] = pushToken;
    data['email'] = email;
    // data['location'] = location;
    return data;
  }

  // Firestore
  UserModel.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc)
      : images = doc.data()?['images'] ?? '',
        name = doc.data()?['name'] ?? '',
        about = doc.data()?['about'] ?? '',
        createdAt = doc.data()?['created_at'] ?? '',
        id = doc.data()?['id'] ?? '',
        lastActive = doc.data()?['last_active'] ?? '',
        isOnline = doc.data()?['is_online'] ?? false,
        password = doc.data()?['password'] ?? '',
        pushToken = doc.data()?['push_token'] ?? '',
        email = doc.data()?['email'] ?? '';
        // location = doc.data()?['location'] ?? '';

  static fromSnapshot(QueryDocumentSnapshot<Object?> doc) {}

  map(Function(dynamic e) param0) {}
}
