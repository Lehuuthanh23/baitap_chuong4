import 'package:baitap_flutter_luutru/models/product.dart';
import 'package:baitap_flutter_luutru/views/Products_Detail.dart';
import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  const Item({super.key, required this.pro});
  final Product pro;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      width: MediaQuery.of(context).size.width / 2 - 15,
      child: Column(
        children: [
          TextButton(
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailProduct(id: pro.id)));
            },
            child: Image.network(
              pro.url,
              fit: BoxFit.cover,
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailProduct(id: pro.id)));
              },
              child: Text(pro.name)),
          TextButton(
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailProduct(id: pro.id)));
            },
            child: Text(
              '${pro.price}',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.red[400]),
            ),
          )
        ],
      ),
    );
  }
}
