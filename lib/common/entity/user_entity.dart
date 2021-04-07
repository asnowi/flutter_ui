class UserEntity {
  int loginType;
  int code;
  String message;
  Account account;
  String token;
  Profile profile;
  String cookie;

  UserEntity(
      {this.loginType,
        this.code,
        this.message,
        this.account,
        this.token,
        this.profile,
        this.cookie});

  UserEntity.fromJson(Map<String, dynamic> json) {
    loginType = json['loginType'];
    code = json['code'];
    message = json['message'];
    account =
    json['account'] != null ? new Account.fromJson(json['account']) : null;
    token = json['token'];
    profile =
    json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
    cookie = json['cookie'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['loginType'] = this.loginType;
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.account != null) {
      data['account'] = this.account.toJson();
    }
    data['token'] = this.token;
    if (this.profile != null) {
      data['profile'] = this.profile.toJson();
    }
    data['cookie'] = this.cookie;
    return data;
  }
}

class Account {
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

  Account(
      {this.id,
        this.userName,
        this.type,
        this.status,
        this.whitelistAuthority,
        this.createTime,
        this.salt,
        this.tokenVersion,
        this.ban,
        this.baoyueVersion,
        this.donateVersion,
        this.vipType,
        this.viptypeVersion,
        this.anonimousUser});

  Account.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    type = json['type'];
    status = json['status'];
    whitelistAuthority = json['whitelistAuthority'];
    createTime = json['createTime'];
    salt = json['salt'];
    tokenVersion = json['tokenVersion'];
    ban = json['ban'];
    baoyueVersion = json['baoyueVersion'];
    donateVersion = json['donateVersion'];
    vipType = json['vipType'];
    viptypeVersion = json['viptypeVersion'];
    anonimousUser = json['anonimousUser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['type'] = this.type;
    data['status'] = this.status;
    data['whitelistAuthority'] = this.whitelistAuthority;
    data['createTime'] = this.createTime;
    data['salt'] = this.salt;
    data['tokenVersion'] = this.tokenVersion;
    data['ban'] = this.ban;
    data['baoyueVersion'] = this.baoyueVersion;
    data['donateVersion'] = this.donateVersion;
    data['vipType'] = this.vipType;
    data['viptypeVersion'] = this.viptypeVersion;
    data['anonimousUser'] = this.anonimousUser;
    return data;
  }
}

class Profile {
  String description;
  int city;
  int vipType;
  int gender;
  int accountStatus;
  int avatarImgId;
  int birthday;
  String nickname;
  int djStatus;
  bool defaultAvatar;
  int province;
  int backgroundImgId;
  String avatarUrl;
  bool mutual;
  int authStatus;
  int userId;
  bool followed;
  String backgroundUrl;
  String detailDescription;
  String avatarImgIdStr;
  String backgroundImgIdStr;
  int userType;
  String signature;
  int authority;
  int followeds;
  int follows;
  int eventCount;
  int playlistCount;
  int playlistBeSubscribedCount;

  Profile(
      {this.description,
        this.city,
        this.vipType,
        this.gender,
        this.accountStatus,
        this.avatarImgId,
        this.birthday,
        this.nickname,
        this.djStatus,
        this.defaultAvatar,
        this.province,
        this.backgroundImgId,
        this.avatarUrl,
        this.mutual,
        this.authStatus,
        this.userId,
        this.followed,
        this.backgroundUrl,
        this.detailDescription,
        this.avatarImgIdStr,
        this.backgroundImgIdStr,
        this.userType,
        this.signature,
        this.authority,
        this.followeds,
        this.follows,
        this.eventCount,
        this.playlistCount,
        this.playlistBeSubscribedCount});

  Profile.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    city = json['city'];
    vipType = json['vipType'];
    gender = json['gender'];
    accountStatus = json['accountStatus'];
    avatarImgId = json['avatarImgId'];
    birthday = json['birthday'];
    nickname = json['nickname'];
    djStatus = json['djStatus'];
    defaultAvatar = json['defaultAvatar'];
    province = json['province'];
    backgroundImgId = json['backgroundImgId'];
    avatarUrl = json['avatarUrl'];
    mutual = json['mutual'];
    authStatus = json['authStatus'];
    userId = json['userId'];
    followed = json['followed'];
    backgroundUrl = json['backgroundUrl'];
    detailDescription = json['detailDescription'];
    avatarImgIdStr = json['avatarImgIdStr'];
    backgroundImgIdStr = json['backgroundImgIdStr'];
    userType = json['userType'];
    signature = json['signature'];
    authority = json['authority'];
    followeds = json['followeds'];
    follows = json['follows'];
    eventCount = json['eventCount'];
    playlistCount = json['playlistCount'];
    playlistBeSubscribedCount = json['playlistBeSubscribedCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['city'] = this.city;
    data['vipType'] = this.vipType;
    data['gender'] = this.gender;
    data['accountStatus'] = this.accountStatus;
    data['avatarImgId'] = this.avatarImgId;
    data['birthday'] = this.birthday;
    data['nickname'] = this.nickname;
    data['djStatus'] = this.djStatus;
    data['defaultAvatar'] = this.defaultAvatar;
    data['province'] = this.province;
    data['backgroundImgId'] = this.backgroundImgId;
    data['avatarUrl'] = this.avatarUrl;
    data['mutual'] = this.mutual;
    data['authStatus'] = this.authStatus;
    data['userId'] = this.userId;
    data['followed'] = this.followed;
    data['backgroundUrl'] = this.backgroundUrl;
    data['detailDescription'] = this.detailDescription;
    data['avatarImgIdStr'] = this.avatarImgIdStr;
    data['backgroundImgIdStr'] = this.backgroundImgIdStr;
    data['userType'] = this.userType;
    data['signature'] = this.signature;
    data['authority'] = this.authority;
    data['followeds'] = this.followeds;
    data['follows'] = this.follows;
    data['eventCount'] = this.eventCount;
    data['playlistCount'] = this.playlistCount;
    data['playlistBeSubscribedCount'] = this.playlistBeSubscribedCount;
    return data;
  }
}