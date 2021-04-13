import 'package:flutter/material.dart';
import 'package:flutter_ui/common/utils/index.dart';

class TitleBar extends StatelessWidget implements PreferredSizeWidget{
  String title;
  bool isBack = true;
  Function onBack;
  TitleBar({@required String title,bool isBack,Function onBack}){
    this.title = title == null ? '' : title;
    this.isBack = isBack == null ? false : isBack;
    this.onBack = onBack == null ? null : onBack;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: duSetHeight(72),
      child: SafeArea(
        top: true,
        child: Stack(
          children: [
            Offstage(
              offstage: !this.isBack,
              child: IconButton(icon: Icon(Icons.arrow_back_ios_sharp,size: 14,), onPressed: this.onBack),
            ),
            Center(
              child: Text(this.title,style:  TextStyle(
                fontSize: 14,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontFamily: 'FZFWQingYinTiJWL',
              ),),
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(duSetHeight(42));
}
