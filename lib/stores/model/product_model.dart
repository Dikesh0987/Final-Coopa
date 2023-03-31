import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  Product({
    // required this.sid,
    required this.uniqueId,
    required this.title,
    required this.price,
    required this.image,
    required this.discount,
    required this.isAvailable,
    required this.registerAt,
    required this.quantity,
    required this.modifyAt,
    required this.description,
  });

  // late String sid;
  late String uniqueId;
  late String title;
  late String price;
  late String image;
  late String discount;
  late bool isAvailable;
  late String registerAt;
  late String quantity;
  late String modifyAt;
  late String description;

  Product.fromJson(Map<String, dynamic> json)
      : 
        uniqueId = json['uniqueId'] ?? '',
        title = json['title'] ?? '',
        price = json['price'] ?? '',
        image = json['image'] ?? ' ',
        discount = json['discount'] ?? '',
        isAvailable = json['isAvailable'] ?? false,
        registerAt = json['registerAt'] ?? '',
        quantity = json['quantity'] ?? 0,
        modifyAt = json['modifyAt'] ?? '',
        description = json['description'] ?? '';

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    // data['sid'] = sid;
    data['uniqueId'] = uniqueId;
    data['title'] = title;
    data['price'] = price;
    data['image'] = image;
    data['discount'] = discount;
    data['isAvailable'] = isAvailable;
    data['registerAt'] = registerAt;
    data['quantity'] = quantity;
    data['modifyAt'] = modifyAt;
    data['description'] = description;
    return data;
  }

  static fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> doc) {}

  map(Function(dynamic e) param0) {}
}
