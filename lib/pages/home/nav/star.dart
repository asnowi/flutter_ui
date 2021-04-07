import 'package:flutter/material.dart';
import 'package:flutter_ui/common/utils/index.dart';

class PageStar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: TextButton(
        child: Text('star',style: TextStyle(color: Colors.blue),),
        onPressed: (){
          PermissionUtil.applyStoragePermission((){},(){},onNever: (){});
        },
      ),
    );
  }
}
