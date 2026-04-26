import 'package:flutter/material.dart';
import 'data/products.dart';
import 'screen/detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List cart = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mini Katalog")),
      body: GridView.builder(
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          final p = products[index];

          return Card(
            child: Column(
              children: [
                Image.network(p.image, height: 80),
                Text(p.name),
                Text("${p.price} TL"),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      cart.add(p);
                    });
                  },
                  child: Text("Sepete Ekle"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailPage(product: p),
                      ),
                    );
                  },
                  child: Text("Detay"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}