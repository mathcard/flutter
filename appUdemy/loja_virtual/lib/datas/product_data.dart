import 'package:cloud_firestore/cloud_firestore.dart';

class ProductData{
  String category;
  String id;
  String title;
  String description;
  double price;
  List images;
  List sizes;

  ProductData.fromDocument(DocumentSnapshot snapshot){
    id = snapshot.documentID;
    title = snapshot.data["title"];
    description = snapshot.data["description"];
    //price = snapshot.data["price"];
    price = snapshot.data["price"] + 0.0; //Orientação para pegar o 0.0, mas acho que não vai funcionar ex: 19.50
    images = snapshot.data["images"];
    sizes = snapshot.data["size"];
  }

}