import 'package:baitap_flutter_luutru/models/product.dart';
import 'package:baitap_flutter_luutru/views/item_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Product List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Product> _products =
      List.filled(0, Product(0, '', 0, ''), growable: true);
  void _LoadData() {
    Product.loadData().then((value) {
      setState(() {
        _products = Product.products;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    int count = (_products.length / 2).ceil();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: count,
          itemBuilder: (BuildContext context, int index) {
            if (_products.length % 2 != 0 && index == count - 1) {
              return Row(
                children: [Item(pro: _products[index * 2])],
              );
            } else {
              return Row(
                children: [
                  Item(pro: _products[index * 2]),
                  Item(pro: _products[index * 2 + 1])
                ],
              );
            }
          }),
    );
  }

  @override
  void initState() {
    super.initState();
    _LoadData();
  }
}
