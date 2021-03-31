import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {

          },
          icon: Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          TextButton(
              onPressed: () {},
              child: Text('帮助',
                  style: TextStyle(color: Colors.black, fontSize: 14.0)))
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

        ],
      ),
    );
  }
}
