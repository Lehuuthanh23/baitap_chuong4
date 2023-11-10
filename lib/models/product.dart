import 'dart:convert';

import 'db_reader.dart';


class Product {
  int id;
  String name;
  int price;
  String url;
  Product(this.id, this.name, this.price, this.url);
  Product.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        price = json["price"],
        url = json["url_img"];
  static List<Product> products =
      List.filled(0, Product(0, '', 0, ''), growable: true);
  static Future<void> loadData() async {
    InfoReader reader = InfoReader();
    String data = await reader.getInfo();
    List<dynamic> list = jsonDecode(data);
    for (var entry in list) {
      products.add(Product.fromJson(entry));
    }
  }
}
