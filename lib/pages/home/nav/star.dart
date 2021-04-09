import 'package:flutter/material.dart';
import 'package:flutter_ui/common/http/http_utils.dart';
import 'package:flutter_ui/common/http/index.dart';
import 'package:flutter_ui/common/utils/index.dart';
import 'package:flutter_ui/common/widget/dialog/permissions_dialog.dart';
import 'package:flutter_ui/global.dart';

class PageStar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: TextButton(
        child: Text('star',style: TextStyle(color: Colors.blue),),
        onPressed: () async{
          // EasyLoading.show(status: 'loading...');
          // final permissionList  = await PermissionUtil.applyPermissions();
          // if(permissionList.isEmpty){
          //    LogUtils.GGQ('全部通过');
          // }else{
          //   //PermissionsDialog.show(context, permissionList);
          //   showDialog(context: context, builder: (context) => PermissionsDialog(list: permissionList));
          // }
          
          HttpUtils.get(Apis.test,params: {'uid': Global.userInfo.userId},success: (data) async{
            LogUtils.GGQ(data);
          },fail: (e){
            LogUtils.GGQ(e);
          });
        },
      ),
    );
  }
}
