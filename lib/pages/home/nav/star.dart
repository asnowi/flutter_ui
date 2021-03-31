import 'package:flutter/material.dart';
import 'package:flutter_ui/common/router/routes.dart';
import 'package:get/get.dart';

class PageStar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lime,
      alignment: Alignment.center,
      child: TextButton(
        child: Text('star'),
        onPressed: (){
          Get.toNamed(Routes.agreement);
        },
      ),
    );
  }
}
