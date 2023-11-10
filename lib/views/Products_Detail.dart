import 'package:baitap_flutter_luutru/models/product.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DetailProduct extends StatelessWidget {
  const DetailProduct({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    Product pro = Product.GetId(Product.products, this.id);
    return Scaffold(
        appBar: AppBar(title: Text("Detail")),
        body: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network(
                pro.url,
                fit: BoxFit.cover,
                width: 100,
                height: 100,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: Text(
                      pro.name,
                    ),
                  ),
                  Text(
                    pro.price.toString(),
                    style: const TextStyle(color: Colors.red),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
