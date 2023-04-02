import 'package:cloud_firestore/cloud_firestore.dart';

class Store {
  Store({
    required this.images,
    required this.name,
    required this.about,
    required this.password,
    required this.createdAt,
    required this.id,
    required this.lastActive,
    required this.isOnline,
    required this.pushToken,
    required this.email,
    // required this.location,
  });
  late String images;
  late String name;
  late String about;
  late String password;
  late String createdAt;
  late String id;
  late String lastActive;
  late bool isOnline;
  late String pushToken;
  late String email;
  // late String location;

  Store.fromJson(Map<String, dynamic> json) {
    images = json['images'] ?? '';
    name = json['name'] ?? '';
    about = json['about'] ?? '';
    password = json['password'] ?? '';
    createdAt = json['created_at'] ?? '';
    id = json['id'] ?? '';
    lastActive = json['last_active'] ?? '';
    isOnline = json["is_online"] ?? false;
    pushToken = json['push_token'] ?? '';
    email = json['email'] ?? '';
    // location = json['location'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['images'] = images;
    data['name'] = name;
    data['about'] = about;
    data['password'] = password;
    data['created_at'] = createdAt;
    data['id'] = id;
    data['last_active'] = lastActive;
    data['is_online'] = isOnline;
    data['push_token'] = pushToken;
    data['email'] = email;
    // data['location'] = location;
    return data;
  }

  static fromSnapshot(QueryDocumentSnapshot<Object?> doc) {}

  map(Function(dynamic e) param0) {}
}
