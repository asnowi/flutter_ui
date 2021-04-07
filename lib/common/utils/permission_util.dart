import 'package:permission_handler/permission_handler.dart';

class PermissionUtil{

  // static Future<bool> applyPermissions(List<Permission> permissions, Function onGranted, Function onDenied,{ Function onNever(List<Permission> ps) }) async{
  //   List<Permission> ps = [];
  //   List<Permission> not = [];
  //
  //   if(permissions == null || permissions.isEmpty){
  //     if(onDenied != null){
  //       onDenied();
  //     }
  //     return false;
  //   }
  //   permissions.forEach((element) async{
  //     if(await element.status.isGranted){
  //       ps.add(element);
  //     }else{
  //       if(await element.request().isGranted){
  //         ps.add(element);
  //       }else{
  //         not.add(element);
  //       }
  //     }
  //   });
  //
  //   if(ps.isEmpty){
  //     if(onDenied != null){
  //       onDenied();
  //     }
  //     return false;
  //   }
  //
  //   if(onNever != null && not.isNotEmpty){
  //     onNever(not);
  //     return false;
  //   }
  //
  //   if(permissions.length != ps.length){
  //     if(onDenied != null){
  //       onDenied();
  //     }
  //     return false;
  //   }
  //
  //   if(onGranted != null){
  //       onGranted();
  //     return true;
  //   }
  // }


  static Future<bool> applyPermissions(Function onGranted, Function onDenied(List<Permission> not)) async{
    List<Permission> notList = [];

    if(await Permission.storage.status.isGranted && await Permission.location.status.isGranted){
      if(onGranted != null){
        onGranted();
      }
      return true;
    }else{
      final PermissionStatus storageStatus = await Permission.storage.request();
      if(!storageStatus.isGranted){
        notList.add(Permission.storage);
      }

      final PermissionStatus locationStatus = await Permission.location.request();
      if(!locationStatus.isGranted){
        notList.add(Permission.location);
      }

      if(notList.isNotEmpty){
        if(onDenied != null){
          onDenied(notList);
        }
        return false;
      }else{
        if(onGranted != null){
          onGranted();
        }
        return true;
      }
    }
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

  static Future<bool> opentSetting() async{
    return await openAppSettings();
  }
}
