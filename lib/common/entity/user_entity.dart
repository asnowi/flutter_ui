/// loginType : 1
/// code : 200
/// account : {"id":468787165,"userName":"1_13717591366","type":1,"status":0,"whitelistAuthority":0,"createTime":1484361129266,"salt":"[B@2e84f4e2","tokenVersion":1,"ban":0,"baoyueVersion":0,"donateVersion":0,"vipType":0,"viptypeVersion":0,"anonimousUser":false}
/// token : "e4977b88d82cef63887fed31ef429644985c9cb4debfee79ed586ed39270bf910931c3a9fbfe3df2"
/// profile : {"description":"","backgroundImgIdStr":"109951162868126486","avatarImgIdStr":"18979769718754963","followed":false,"backgroundUrl":"https://p4.music.126.net/_f8R60U9mZ42sSNvdPn2sQ==/109951162868126486.jpg","detailDescription":"","userType":0,"userId":468787165,"vipType":0,"gender":1,"accountStatus":0,"avatarImgId":18979769718754964,"birthday":-2209017600000,"nickname":"����Ҳһ��","city":110101,"backgroundImgId":109951162868126480,"defaultAvatar":false,"avatarUrl":"https://p4.music.126.net/GE2kVDwdVQyoNJC8k31mEA==/18979769718754963.jpg","province":110000,"djStatus":0,"experts":{},"mutual":false,"remarkName":null,"expertTags":null,"authStatus":0,"signature":"","authority":0,"avatarImgId_str":"18979769718754963","followeds":0,"follows":2,"eventCount":0,"avatarDetail":null,"playlistCount":1,"playlistBeSubscribedCount":0}
/// bindings : [{"expired":false,"refreshTime":1492357586,"bindingTime":1492357586552,"userId":468787165,"url":"","tokenJsonStr":"{\"countrycode\":\"\",\"cellphone\":\"13717591366\",\"hasPassword\":true}","expiresIn":2147483647,"id":3108215954,"type":1},{"expired":true,"refreshTime":1529860508,"bindingTime":1484361129428,"userId":468787165,"url":"","tokenJsonStr":"{\"access_token\":\"191495B18EB17BA5C46976B8E9BB5DFF\",\"openid\":\"B698A3C4199AFE1ECF4C9A4447CC09C8\",\"nickname\":\"������ˮ\",\"partnerType\":\"0\",\"expires_in\":7776000,\"bind_time\":1.529860507188634E9}","expiresIn":7776000,"id":3108215955,"type":5}]
/// cookie : "__remember_me=true; Max-Age=1296000; Expires=Sat, 17 Apr 2021 09:14:03 GMT; Path=/;;MUSIC_U=e4977b88d82cef63887fed31ef429644985c9cb4debfee79ed586ed39270bf910931c3a9fbfe3df2; Max-Age=1296000; Expires=Sat, 17 Apr 2021 09:14:03 GMT; Path=/;;NMTID=00OAxeGl6TU70P5VEpEuh_rHmFSGq8AAAF4kdxjmw; Max-Age=315360000; Expires=Mon, 31 Mar 2031 09:14:03 GMT; Path=/;;__csrf=890d057a5b49c78eb4a19889702aa0ed; Max-Age=1296010; Expires=Sat, 17 Apr 2021 09:14:13 GMT; Path=/;"

class UserEntity {
  int loginType;
  int code;
  String message;
  AccountBean account;
  String token;
  ProfileBean profile;
  List<BindingsBean> bindings;
  String cookie;

  static UserEntity fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    UserEntity userEntityBean = UserEntity();
    userEntityBean.loginType = map['loginType'];
    userEntityBean.code = map['code'];
    userEntityBean.message = map['message'];
    userEntityBean.account = AccountBean.fromMap(map['account']);
    userEntityBean.token = map['token'];
    userEntityBean.profile = ProfileBean.fromMap(map['profile']);
    userEntityBean.bindings = List()..addAll(
      (map['bindings'] as List ?? []).map((o) => BindingsBean.fromMap(o))
    );
    userEntityBean.cookie = map['cookie'];
    return userEntityBean;
  }

  Map toJson() => {
    "loginType": loginType,
    "code": code,
    "message": message,
    "account": account,
    "token": token,
    "profile": profile,
    "bindings": bindings,
    "cookie": cookie,
  };
}

/// expired : false
/// refreshTime : 1492357586
/// bindingTime : 1492357586552
/// userId : 468787165
/// url : ""
/// tokenJsonStr : "{\"countrycode\":\"\",\"cellphone\":\"13717591366\",\"hasPassword\":true}"
/// expiresIn : 2147483647
/// id : 3108215954
/// type : 1

class BindingsBean {
  bool expired;
  int refreshTime;
  int bindingTime;
  int userId;
  String url;
  String tokenJsonStr;
  int expiresIn;
  int id;
  int type;

  static BindingsBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    BindingsBean bindingsBean = BindingsBean();
    bindingsBean.expired = map['expired'];
    bindingsBean.refreshTime = map['refreshTime'];
    bindingsBean.bindingTime = map['bindingTime'];
    bindingsBean.userId = map['userId'];
    bindingsBean.url = map['url'];
    bindingsBean.tokenJsonStr = map['tokenJsonStr'];
    bindingsBean.expiresIn = map['expiresIn'];
    bindingsBean.id = map['id'];
    bindingsBean.type = map['type'];
    return bindingsBean;
  }

  Map toJson() => {
    "expired": expired,
    "refreshTime": refreshTime,
    "bindingTime": bindingTime,
    "userId": userId,
    "url": url,
    "tokenJsonStr": tokenJsonStr,
    "expiresIn": expiresIn,
    "id": id,
    "type": type,
  };
}

/// description : ""
/// backgroundImgIdStr : "109951162868126486"
/// avatarImgIdStr : "18979769718754963"
/// followed : false
/// backgroundUrl : "https://p4.music.126.net/_f8R60U9mZ42sSNvdPn2sQ==/109951162868126486.jpg"
/// detailDescription : ""
/// userType : 0
/// userId : 468787165
/// vipType : 0
/// gender : 1
/// accountStatus : 0
/// avatarImgId : 18979769718754964
/// birthday : -2209017600000
/// nickname : "����Ҳһ��"
/// city : 110101
/// backgroundImgId : 109951162868126480
/// defaultAvatar : false
/// avatarUrl : "https://p4.music.126.net/GE2kVDwdVQyoNJC8k31mEA==/18979769718754963.jpg"
/// province : 110000
/// djStatus : 0
/// experts : {}
/// mutual : false
/// remarkName : null
/// expertTags : null
/// authStatus : 0
/// signature : ""
/// authority : 0
/// avatarImgId_str : "18979769718754963"
/// followeds : 0
/// follows : 2
/// eventCount : 0
/// avatarDetail : null
/// playlistCount : 1
/// playlistBeSubscribedCount : 0

class ProfileBean {
  String description;
  String backgroundImgIdStr;
  String avatarImgIdStr;
  bool followed;
  String backgroundUrl;
  String detailDescription;
  int userType;
  int userId;
  int vipType;
  int gender;
  int accountStatus;
  int avatarImgId;
  int birthday;
  String nickname;
  int city;
  int backgroundImgId;
  bool defaultAvatar;
  String avatarUrl;
  int province;
  int djStatus;
  ExpertsBean experts;
  bool mutual;
  dynamic remarkName;
  dynamic expertTags;
  int authStatus;
  String signature;
  int authority;
  int followeds;
  int follows;
  int eventCount;
  dynamic avatarDetail;
  int playlistCount;
  int playlistBeSubscribedCount;

  static ProfileBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    ProfileBean profileBean = ProfileBean();
    profileBean.description = map['description'];
    profileBean.backgroundImgIdStr = map['backgroundImgIdStr'];
    profileBean.avatarImgIdStr = map['avatarImgIdStr'];
    profileBean.followed = map['followed'];
    profileBean.backgroundUrl = map['backgroundUrl'];
    profileBean.detailDescription = map['detailDescription'];
    profileBean.userType = map['userType'];
    profileBean.userId = map['userId'];
    profileBean.vipType = map['vipType'];
    profileBean.gender = map['gender'];
    profileBean.accountStatus = map['accountStatus'];
    profileBean.avatarImgId = map['avatarImgId'];
    profileBean.birthday = map['birthday'];
    profileBean.nickname = map['nickname'];
    profileBean.city = map['city'];
    profileBean.backgroundImgId = map['backgroundImgId'];
    profileBean.defaultAvatar = map['defaultAvatar'];
    profileBean.avatarUrl = map['avatarUrl'];
    profileBean.province = map['province'];
    profileBean.djStatus = map['djStatus'];
    profileBean.experts = ExpertsBean.fromMap(map['experts']);
    profileBean.mutual = map['mutual'];
    profileBean.remarkName = map['remarkName'];
    profileBean.expertTags = map['expertTags'];
    profileBean.authStatus = map['authStatus'];
    profileBean.signature = map['signature'];
    profileBean.authority = map['authority'];
    profileBean.followeds = map['followeds'];
    profileBean.follows = map['follows'];
    profileBean.eventCount = map['eventCount'];
    profileBean.avatarDetail = map['avatarDetail'];
    profileBean.playlistCount = map['playlistCount'];
    profileBean.playlistBeSubscribedCount = map['playlistBeSubscribedCount'];
    return profileBean;
  }

  Map toJson() => {
    "description": description,
    "backgroundImgIdStr": backgroundImgIdStr,
    "avatarImgIdStr": avatarImgIdStr,
    "followed": followed,
    "backgroundUrl": backgroundUrl,
    "detailDescription": detailDescription,
    "userType": userType,
    "userId": userId,
    "vipType": vipType,
    "gender": gender,
    "accountStatus": accountStatus,
    "avatarImgId": avatarImgId,
    "birthday": birthday,
    "nickname": nickname,
    "city": city,
    "backgroundImgId": backgroundImgId,
    "defaultAvatar": defaultAvatar,
    "avatarUrl": avatarUrl,
    "province": province,
    "djStatus": djStatus,
    "experts": experts,
    "mutual": mutual,
    "remarkName": remarkName,
    "expertTags": expertTags,
    "authStatus": authStatus,
    "signature": signature,
    "authority": authority,
    "followeds": followeds,
    "follows": follows,
    "eventCount": eventCount,
    "avatarDetail": avatarDetail,
    "playlistCount": playlistCount,
    "playlistBeSubscribedCount": playlistBeSubscribedCount,
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

/// id : 468787165
/// userName : "1_13717591366"
/// type : 1
/// status : 0
/// whitelistAuthority : 0
/// createTime : 1484361129266
/// salt : "[B@2e84f4e2"
/// tokenVersion : 1
/// ban : 0
/// baoyueVersion : 0
/// donateVersion : 0
/// vipType : 0
/// viptypeVersion : 0
/// anonimousUser : false

class AccountBean {
  int id;
  String userName;
  int type;
  int status;
  int whitelistAuthority;
  int createTime;
  String salt;
  int tokenVersion;
  int ban;
  int baoyueVersion;
  int donateVersion;
  int vipType;
  int viptypeVersion;
  bool anonimousUser;

  static AccountBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    AccountBean accountBean = AccountBean();
    accountBean.id = map['id'];
    accountBean.userName = map['userName'];
    accountBean.type = map['type'];
    accountBean.status = map['status'];
    accountBean.whitelistAuthority = map['whitelistAuthority'];
    accountBean.createTime = map['createTime'];
    accountBean.salt = map['salt'];
    accountBean.tokenVersion = map['tokenVersion'];
    accountBean.ban = map['ban'];
    accountBean.baoyueVersion = map['baoyueVersion'];
    accountBean.donateVersion = map['donateVersion'];
    accountBean.vipType = map['vipType'];
    accountBean.viptypeVersion = map['viptypeVersion'];
    accountBean.anonimousUser = map['anonimousUser'];
    return accountBean;
  }

  Map toJson() => {
    "id": id,
    "userName": userName,
    "type": type,
    "status": status,
    "whitelistAuthority": whitelistAuthority,
    "createTime": createTime,
    "salt": salt,
    "tokenVersion": tokenVersion,
    "ban": ban,
    "baoyueVersion": baoyueVersion,
    "donateVersion": donateVersion,
    "vipType": vipType,
    "viptypeVersion": viptypeVersion,
    "anonimousUser": anonimousUser,
  };
}