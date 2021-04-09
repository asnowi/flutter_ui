import 'package:flutter/services.dart';
import 'package:flutter_ui/common/utils/index.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionUtil{

  static Future<List<Permission>> applyPermissions() async {
    List<Permission> not = [];
    if(await Permission.storage.status.isGranted && await Permission.location.status.isGranted){
      return not;
    }

    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
      Permission.location,
    ].request();

    statuses.forEach((key, value) {
      if(!value.isGranted){
        not.add(key);
      }
    });
    LogUtils.GGQ('权限->${not.isEmpty}');
    return not;
  }

  static Future<bool> applyStoragePermission(Function onGranted, Function onDenied,{ Function onNever }) async{
    if(await Permission.storage.status.isGranted) {
      if(onGranted != null){
        onGranted();
      }
      return true;
    }else{
      final PermissionStatus status = await Permission.storage.request();
      if(status.isGranted){
        if(onGranted != null){
          onGranted();
        }
        return true;
      }else if(status.isDenied){
        if(onDenied != null){
          onDenied();
        }
      }else {
        if(onNever != null){
          onNever();
        }
      }
      return false;
    }
  }

  static Future<bool> openSetting() async{
    return await openAppSettings();
  }

  static Future<void> popApp() async {
    await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }
}
