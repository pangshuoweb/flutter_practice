import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  final Widget child;

  CartPage({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('购物车'),
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: Text('购物车'),
      ),
    );
  }
}