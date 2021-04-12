import 'package:flutter_ui/common/entity/account_bindings_entity.dart';
import 'package:flutter_ui/common/entity/account_profile_entity.dart';
import 'package:flutter_ui/common/entity/account_user_point_entity.dart';


class AccountEntity {
  int level;
  int listenSongs;
  AccountUserPointEntity userPoint;
  bool mobileSign;
  bool pcSign;
  AccountProfileEntity profile;
  bool peopleCanSeeMyPlayRecord;
  List<AccountBindingsEntity> bindings;
  bool adValid;
  int code;
  int createTime;
  int createDays;

  static AccountEntity fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    AccountEntity accountEntityBean = AccountEntity();
    accountEntityBean.level = map['level'];
    accountEntityBean.listenSongs = map['listenSongs'];
    accountEntityBean.userPoint = AccountUserPointEntity.fromMap(map['userPoint']);
    accountEntityBean.mobileSign = map['mobileSign'];
    accountEntityBean.pcSign = map['pcSign'];
    accountEntityBean.profile = AccountProfileEntity.fromMap(map['profile']);
    accountEntityBean.peopleCanSeeMyPlayRecord = map['peopleCanSeeMyPlayRecord'];
    accountEntityBean.bindings = List()..addAll(
      (map['bindings'] as List ?? []).map((o) => AccountBindingsEntity.fromMap(o))
    );
    accountEntityBean.adValid = map['adValid'];
    accountEntityBean.code = map['code'];
    accountEntityBean.createTime = map['createTime'];
    accountEntityBean.createDays = map['createDays'];
    return accountEntityBean;
  }

  Map toJson() => {
    "level": level,
    "listenSongs": listenSongs,
    "userPoint": userPoint,
    "mobileSign": mobileSign,
    "pcSign": pcSign,
    "profile": profile,
    "peopleCanSeeMyPlayRecord": peopleCanSeeMyPlayRecord,
    "bindings": bindings,
    "adValid": adValid,
    "code": code,
    "createTime": createTime,
    "createDays": createDays,
  };
}
