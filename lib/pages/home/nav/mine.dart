import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/home/view/unlogin.dart';

class PageMine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyan,
      alignment: Alignment.center,
      // child: EmptyPage(),
      child: UnLogin(),
    );
  }
}
