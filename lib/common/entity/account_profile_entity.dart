import 'package:flutter_ui/common/entity/account_experts_entity.dart';

class AccountProfileEntity {
  dynamic avatarDetail;
  String avatarImgIdStr;
  String backgroundImgIdStr;
  String nickname;
  String avatarUrl;
  int province;
  int city;
  bool defaultAvatar;
  int avatarImgId;
  int backgroundImgId;
  String backgroundUrl;
  bool mutual;
  bool followed;
  dynamic remarkName;
  int authStatus;
  String detailDescription;
  AccountExpertsEntity experts;
  dynamic expertTags;
  int djStatus;
  int accountStatus;
  int birthday;
  int gender;
  int vipType;
  int userType;
  int createTime;
  String description;
  int userId;
  String signature;
  int authority;
  int followeds;
  int follows;
  bool blacklist;
  int eventCount;
  int allSubscribedCount;
  int playlistBeSubscribedCount;
  dynamic followTime;
  bool followMe;
  List<dynamic> artistIdentity;
  int cCount;
  int sDJPCount;
  int playlistCount;
  int sCount;
  int newFollows;

  static AccountProfileEntity fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    AccountProfileEntity profileBean = AccountProfileEntity();
    profileBean.avatarDetail = map['avatarDetail'];
    profileBean.avatarImgIdStr = map['avatarImgIdStr'];
    profileBean.backgroundImgIdStr = map['backgroundImgIdStr'];
    profileBean.nickname = map['nickname'];
    profileBean.avatarUrl = map['avatarUrl'];
    profileBean.province = map['province'];
    profileBean.city = map['city'];
    profileBean.defaultAvatar = map['defaultAvatar'];
    profileBean.avatarImgId = map['avatarImgId'];
    profileBean.backgroundImgId = map['backgroundImgId'];
    profileBean.backgroundUrl = map['backgroundUrl'];
    profileBean.mutual = map['mutual'];
    profileBean.followed = map['followed'];
    profileBean.remarkName = map['remarkName'];
    profileBean.authStatus = map['authStatus'];
    profileBean.detailDescription = map['detailDescription'];
    profileBean.experts = AccountExpertsEntity.fromMap(map['experts']);
    profileBean.expertTags = map['expertTags'];
    profileBean.djStatus = map['djStatus'];
    profileBean.accountStatus = map['accountStatus'];
    profileBean.birthday = map['birthday'];
    profileBean.gender = map['gender'];
    profileBean.vipType = map['vipType'];
    profileBean.userType = map['userType'];
    profileBean.createTime = map['createTime'];
    profileBean.description = map['description'];
    profileBean.userId = map['userId'];
    profileBean.signature = map['signature'];
    profileBean.authority = map['authority'];
    profileBean.followeds = map['followeds'];
    profileBean.follows = map['follows'];
    profileBean.blacklist = map['blacklist'];
    profileBean.eventCount = map['eventCount'];
    profileBean.allSubscribedCount = map['allSubscribedCount'];
    profileBean.playlistBeSubscribedCount = map['playlistBeSubscribedCount'];
    profileBean.followTime = map['followTime'];
    profileBean.followMe = map['followMe'];
    profileBean.artistIdentity = map['artistIdentity'];
    profileBean.cCount = map['cCount'];
    profileBean.sDJPCount = map['sDJPCount'];
    profileBean.playlistCount = map['playlistCount'];
    profileBean.sCount = map['sCount'];
    profileBean.newFollows = map['newFollows'];
    return profileBean;
  }

  Map toJson() => {
    "avatarDetail": avatarDetail,
    "avatarImgIdStr": avatarImgIdStr,
    "backgroundImgIdStr": backgroundImgIdStr,
    "nickname": nickname,
    "avatarUrl": avatarUrl,
    "province": province,
    "city": city,
    "defaultAvatar": defaultAvatar,
    "avatarImgId": avatarImgId,
    "backgroundImgId": backgroundImgId,
    "backgroundUrl": backgroundUrl,
    "mutual": mutual,
    "followed": followed,
    "remarkName": remarkName,
    "authStatus": authStatus,
    "detailDescription": detailDescription,
    "experts": experts,
    "expertTags": expertTags,
    "djStatus": djStatus,
    "accountStatus": accountStatus,
    "birthday": birthday,
    "gender": gender,
    "vipType": vipType,
    "userType": userType,
    "createTime": createTime,
    "description": description,
    "userId": userId,
    "signature": signature,
    "authority": authority,
    "followeds": followeds,
    "follows": follows,
    "blacklist": blacklist,
    "eventCount": eventCount,
    "allSubscribedCount": allSubscribedCount,
    "playlistBeSubscribedCount": playlistBeSubscribedCount,
    "followTime": followTime,
    "followMe": followMe,
    "artistIdentity": artistIdentity,
    "cCount": cCount,
    "sDJPCount": sDJPCount,
    "playlistCount": playlistCount,
    "sCount": sCount,
    "newFollows": newFollows,
  };
}