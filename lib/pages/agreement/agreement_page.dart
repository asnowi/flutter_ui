import 'package:flutter/material.dart';

class AgreementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('标题'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text('内容'),
      ),
    );
  }
}
