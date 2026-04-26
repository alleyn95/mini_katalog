

import 'package:flutter/material.dart';
import '../model/product.dart';

class DetailPage extends StatelessWidget {
  final Product product;

  DetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Column(
        children: [
          Image.network(product.image),
          Text(product.description),
          Text("${product.price} TL"),
        ],
      ),
    );
  }
}