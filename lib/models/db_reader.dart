import 'package:flutter/services.dart';

class InfoReader {
  Future<String> getInfo() async {
    String s = "";
    try {
      s = await rootBundle.loadString("data/products.json");
      return s;
    } catch (e) {
      return e.toString();
    }
  }
}
