import 'package:flutter/material.dart';
import 'package:flutter_ui/common/widget/state/empty_page.dart';
import 'package:flutter_ui/common/widget/state/error_page.dart';

class PageMine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyan,
      alignment: Alignment.center,
      // child: EmptyPage(),
      child: ErrorPage(),
    );
  }
}
