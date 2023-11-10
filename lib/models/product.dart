import 'dart:convert';

import 'package:baitap_flutter_luutru/models/db_reader.dart';



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
    List<dynamic> lst = jsonDecode(data);
    for (var entry in lst) {
      products.add(Product.fromJson(entry));
    }
  }
  static GetId(List<Product> products, int id) {
    for (var item in products) {
      if (item.id == id) {
        return item;
      }
    }
    return null;
  }
}
