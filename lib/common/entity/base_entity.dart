class BaseEntity{
  int code = -1;
  dynamic data;
  String message = '未知错误！';


  BaseEntity({this.code, this.data, this.message});

  BaseEntity.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'];
    message = json['message'];
  }
}