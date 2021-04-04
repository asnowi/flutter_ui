import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconText extends StatelessWidget {

  final String txt;
  final Icon icon;
  final bool isNext;
  final Function onClick;

  IconText({@required this.txt, @required this.icon,@required this.onClick,this.isNext = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: this.onClick,
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white)
          ),
          child: Container(
              width: ScreenUtil().screenWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  this.icon,
                  Padding(padding: EdgeInsets.only(left: 4)),
                  Expanded(
                    child: Text(this.txt,style: TextStyle(fontSize: 12,color: Colors.black),)
                    ,flex: 1,),
                    Offstage(
                      offstage: !this.isNext,
                      child: Icon(Icons.arrow_forward_ios_sharp,size: 12,color:Colors.grey),
                    )
                ],
              )
          ),
        ),
      ],
    );
  }
}
