/// level : 2
/// listenSongs : 68
/// userPoint : {"userId":468787165,"balance":13,"updateTime":1617957078399,"version":10,"status":0,"blockBalance":0}
/// mobileSign : false
/// pcSign : false
/// profile : {"avatarDetail":null,"avatarImgIdStr":"18979769718754963","backgroundImgIdStr":"109951162868126486","nickname":"maple±ù¶ù","avatarUrl":"http://p1.music.126.net/GE2kVDwdVQyoNJC8k31mEA==/18979769718754963.jpg","province":110000,"city":110101,"defaultAvatar":false,"avatarImgId":18979769718754964,"backgroundImgId":109951162868126480,"backgroundUrl":"http://p1.music.126.net/_f8R60U9mZ42sSNvdPn2sQ==/109951162868126486.jpg","mutual":false,"followed":false,"remarkName":null,"authStatus":0,"detailDescription":"","experts":{},"expertTags":null,"djStatus":0,"accountStatus":0,"birthday":-2209017600000,"gender":1,"vipType":0,"userType":0,"createTime":1492357586817,"description":"","userId":468787165,"signature":"","authority":0,"followeds":0,"follows":2,"blacklist":false,"eventCount":0,"allSubscribedCount":0,"playlistBeSubscribedCount":0,"avatarImgId_str":"18979769718754963","followTime":null,"followMe":false,"artistIdentity":[],"cCount":0,"sDJPCount":0,"playlistCount":1,"sCount":0,"newFollows":2}
/// peopleCanSeeMyPlayRecord : true
/// bindings : [{"tokenJsonStr":null,"expired":false,"expiresIn":2147483647,"refreshTime":1492357586,"bindingTime":1492357586552,"url":"","userId":468787165,"id":3108215954,"type":1},{"tokenJsonStr":null,"expired":true,"expiresIn":7776000,"refreshTime":1529860508,"bindingTime":1484361129428,"url":"","userId":468787165,"id":3108215955,"type":5}]
/// adValid : true
/// code : 200
/// createTime : 1492357586817
/// createDays : 1454

class AccountEntity {
  int level;
  int listenSongs;
  UserPointBean userPoint;
  bool mobileSign;
  bool pcSign;
  ProfileBean profile;
  bool peopleCanSeeMyPlayRecord;
  List<BindingsBean> bindings;
  bool adValid;
  int code;
  int createTime;
  int createDays;

  static AccountEntity fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    AccountEntity accountEntityBean = AccountEntity();
    accountEntityBean.level = map['level'];
    accountEntityBean.listenSongs = map['listenSongs'];
    accountEntityBean.userPoint = UserPointBean.fromMap(map['userPoint']);
    accountEntityBean.mobileSign = map['mobileSign'];
    accountEntityBean.pcSign = map['pcSign'];
    accountEntityBean.profile = ProfileBean.fromMap(map['profile']);
    accountEntityBean.peopleCanSeeMyPlayRecord = map['peopleCanSeeMyPlayRecord'];
    accountEntityBean.bindings = List()..addAll(
      (map['bindings'] as List ?? []).map((o) => BindingsBean.fromMap(o))
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

/// tokenJsonStr : null
/// expired : false
/// expiresIn : 2147483647
/// refreshTime : 1492357586
/// bindingTime : 1492357586552
/// url : ""
/// userId : 468787165
/// id : 3108215954
/// type : 1

class BindingsBean {
  dynamic tokenJsonStr;
  bool expired;
  int expiresIn;
  int refreshTime;
  int bindingTime;
  String url;
  int userId;
  int id;
  int type;

  static BindingsBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    BindingsBean bindingsBean = BindingsBean();
    bindingsBean.tokenJsonStr = map['tokenJsonStr'];
    bindingsBean.expired = map['expired'];
    bindingsBean.expiresIn = map['expiresIn'];
    bindingsBean.refreshTime = map['refreshTime'];
    bindingsBean.bindingTime = map['bindingTime'];
    bindingsBean.url = map['url'];
    bindingsBean.userId = map['userId'];
    bindingsBean.id = map['id'];
    bindingsBean.type = map['type'];
    return bindingsBean;
  }

  Map toJson() => {
    "tokenJsonStr": tokenJsonStr,
    "expired": expired,
    "expiresIn": expiresIn,
    "refreshTime": refreshTime,
    "bindingTime": bindingTime,
    "url": url,
    "userId": userId,
    "id": id,
    "type": type,
  };
}

/// avatarDetail : null
/// avatarImgIdStr : "18979769718754963"
/// backgroundImgIdStr : "109951162868126486"
/// nickname : "maple±ù¶ù"
/// avatarUrl : "http://p1.music.126.net/GE2kVDwdVQyoNJC8k31mEA==/18979769718754963.jpg"
/// province : 110000
/// city : 110101
/// defaultAvatar : false
/// avatarImgId : 18979769718754964
/// backgroundImgId : 109951162868126480
/// backgroundUrl : "http://p1.music.126.net/_f8R60U9mZ42sSNvdPn2sQ==/109951162868126486.jpg"
/// mutual : false
/// followed : false
/// remarkName : null
/// authStatus : 0
/// detailDescription : ""
/// experts : {}
/// expertTags : null
/// djStatus : 0
/// accountStatus : 0
/// birthday : -2209017600000
/// gender : 1
/// vipType : 0
/// userType : 0
/// createTime : 1492357586817
/// description : ""
/// userId : 468787165
/// signature : ""
/// authority : 0
/// followeds : 0
/// follows : 2
/// blacklist : false
/// eventCount : 0
/// allSubscribedCount : 0
/// playlistBeSubscribedCount : 0
/// avatarImgId_str : "18979769718754963"
/// followTime : null
/// followMe : false
/// artistIdentity : []
/// cCount : 0
/// sDJPCount : 0
/// playlistCount : 1
/// sCount : 0
/// newFollows : 2

class ProfileBean {
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
  ExpertsBean experts;
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

  static ProfileBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    ProfileBean profileBean = ProfileBean();
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
    profileBean.experts = ExpertsBean.fromMap(map['experts']);
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


class ExpertsBean {

  static ExpertsBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    ExpertsBean expertsBean = ExpertsBean();
    return expertsBean;
  }

  Map toJson() => {
  };
}

/// userId : 468787165
/// balance : 13
/// updateTime : 1617957078399
/// version : 10
/// status : 0
/// blockBalance : 0

class UserPointBean {
  int userId;
  int balance;
  int updateTime;
  int version;
  int status;
  int blockBalance;

  static UserPointBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    UserPointBean userPointBean = UserPointBean();
    userPointBean.userId = map['userId'];
    userPointBean.balance = map['balance'];
    userPointBean.updateTime = map['updateTime'];
    userPointBean.version = map['version'];
    userPointBean.status = map['status'];
    userPointBean.blockBalance = map['blockBalance'];
    return userPointBean;
  }

  Map toJson() => {
    "userId": userId,
    "balance": balance,
    "updateTime": updateTime,
    "version": version,
    "status": status,
    "blockBalance": blockBalance,
  };
}