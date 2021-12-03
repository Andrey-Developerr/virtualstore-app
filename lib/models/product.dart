import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  Product({
    this.id,
    this.name,
    this.image,
  });

  Product.fromDocument(DocumentSnapshot document) {
    id = document.id;
    name = document['name'] as String;
    price = document['price'] as String;
    image = document['image'] as String;
  }

  String? id;
  String? name;
  String? price;
  String? image;
}
