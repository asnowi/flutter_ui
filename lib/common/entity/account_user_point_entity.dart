class AccountUserPointEntity {

  int userId;
  int balance;
  int updateTime;
  int version;
  int status;
  int blockBalance;

  static AccountUserPointEntity fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    AccountUserPointEntity userPointBean = AccountUserPointEntity();
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