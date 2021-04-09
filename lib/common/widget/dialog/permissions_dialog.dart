import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/common/utils/index.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionsDialog extends Dialog{

  final List<Permission> list;
  PermissionsDialog({this.list,Key key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    // return super.build(context);
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            //设置四周圆角 角度
            borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
          width: ScreenUtil().screenWidth * 0.82,
          height: ScreenUtil().screenHeight * 0.34,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 20),
                child: Text('权限申请',style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'FZFWQingYinTiJWL',
                ),),
              ),
              Expanded(child: Container(
                margin: EdgeInsets.only(left: 20,top: 20,right: 20),
                child: SingleChildScrollView(
                  child: Text('内容内容内容内容内容内容内容内容内容内容内容',style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.black87,
                    // fontWeight: FontWeight.bold,
                    fontFamily: 'FZFWQingYinTiJWL',
                  ),),
                ),
              ),flex: 1,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 1,
                      child: TextButton(onPressed: () async{
                        Navigator.of(context).pop();
                        //关闭应用
                        await PermissionUtil.popApp();
                      }, child: Text('不同意',style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'FZFWQingYinTiJWL',
                      ),)),
                    ),
                    Container(height: 22,width: 1,color: Colors.black12,margin: EdgeInsets.symmetric(horizontal: 8),),
                    Expanded(
                      flex: 1,
                      child: TextButton(onPressed: () async{
                        final res = await PermissionUtil.openSetting();
                        LogUtils.GGQ('setting ->${res}');
                        if(res){
                          Navigator.of(context).pop();
                        }
                      }, child: Text('前往设置',style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'FZFWQingYinTiJWL',
                      ),)),
                    )
                  ],
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}
