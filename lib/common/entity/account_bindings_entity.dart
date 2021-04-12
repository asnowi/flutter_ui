class AccountBindingsEntity{
  dynamic tokenJsonStr;
  bool expired;
  int expiresIn;
  int refreshTime;
  int bindingTime;
  String url;
  int userId;
  int id;
  int type;

  static AccountBindingsEntity fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    AccountBindingsEntity bindingsBean = AccountBindingsEntity();
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