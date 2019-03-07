import 'package:flutter/material.dart';

class MemberPage extends StatelessWidget {
  final Widget child;

  MemberPage({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('会员中心'),
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: Text('会员中心'),
      ),
    );
  }
}