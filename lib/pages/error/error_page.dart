import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {

  final String errorMessage;
  final FlutterErrorDetails details;

  ErrorPage(this.errorMessage, this.details);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Container(
            child: Text(this.errorMessage),
          ),
        ),
    );
  }
}
