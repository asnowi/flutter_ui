import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/common/config/config.dart';
import 'package:flutter_ui/common/config/index.dart';
import 'package:flutter_ui/common/db/index.dart';
import 'package:flutter_ui/common/entity/user_entity.dart';
import 'package:flutter_ui/common/http/http_utils.dart';
import 'package:flutter_ui/common/http/index.dart';
import 'package:flutter_ui/common/utils/index.dart';
import 'package:flutter_ui/global.dart';
import 'package:get/get.dart';

class AccountPage extends StatelessWidget {

  final AccountController accountController = Get.put(AccountController());
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildUserNameTextField(accountController,userNameController),
         SizedBox(height: 20),
         _buildPasswordTextField(accountController,passwordController),
          SizedBox(height: 30),
          _buildLogin(accountController,userNameController,passwordController),
        ],
      ),
    );
  }
}

Widget _buildLogin (AccountController accountController,TextEditingController userNameController, TextEditingController passwordController) {
  return Container(
    width: ScreenUtil().screenWidth * 0.82,
    child: Obx(() => ElevatedButton(onPressed: accountController.hasLogin.value? (){
      LogUtils.GGQ(userNameController.text);
      LogUtils.GGQ(passwordController.text);
      if(!RegexUtils.isPhone(userNameController.text)){
        Toast.show('????????????????????????????????????');
        return;
      }
      _onLogin(accountController,userNameController.text,passwordController.text);
    }:null,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states){
              if(states.contains(MaterialState.disabled)){
                return Colors.red[100];
              }
              return Colors.redAccent;
            })
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: duSetHeight(14)),
          child: Text('??????',style: TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'FZFWQingYinTiJWL',
          ),),
        )
    )),
  );
}

void _onLogin(AccountController accountController,String phone, String password){
  HttpUtils.get(
      Apis.login,
      params: {'phone':phone,'password':password},
      success: (data) async{
        LogUtils.GGQ(data);
        final userEntity = UserEntity.fromJson(data);
        if(userEntity != null){
          if(userEntity.code == Config.SUCCESS_CODE){
              //????????????
            final token = userEntity.token;

            final user = User()
            ..token = token
            ..phone = phone
            ..userId = userEntity.account.id.toString()
            ..userName = userEntity.profile.nickname
            ..avatarImg = userEntity.profile.avatarUrl;

            final res = await Global.dbUtil.userBox.add(user);
            Global.userInfo = user;

            LogUtils.GGQ('value:${res}');
            LogUtils.GGQ('userName:${user.userName}');
            LogUtils.GGQ('avatarImg:${user.avatarImg}');
            LogUtils.GGQ('userId:${user.userId}');

            StorageUtil().setJSON('phone', phone);
            //????????????
            final event = CommonEvent(EventCode.EVENT_LOGIN,message: res.toString());
            EventBusUtils.send(event);
            //??????????????????
            Get.back();
          }else{
            var msg = userEntity.message;
            if(msg.isEmpty){
              msg = '?????????????????????';
            }
            Toast.show('??????????????????');
          }
        }else{
          Toast.show('??????????????????');
        }
      },
      fail: (e){
        Toast.show('???????????????');
      });
}


Widget _buildUserNameTextField(AccountController accountController,TextEditingController textController) {
  final String _phone = StorageUtil().getJSON('phone');
  if(_phone != null && _phone.isNotEmpty){
    textController.text = _phone;
    accountController.changeDel(true);
  }

  return ConstrainedBox(
    constraints: BoxConstraints(
        maxHeight: 42,
        maxWidth: ScreenUtil().screenWidth * 0.82
    ),
    child: Obx(() => TextField(
      controller: textController,
      maxLines: 1,
      autocorrect: true,//??????????????????
      autofocus: true,//??????????????????
      textAlign: TextAlign.start,//??????????????????
      style: TextStyle(
        fontSize: 14,
        color: Colors.black87,
      ),
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 4),
        hintText: '??????????????????',
        hintStyle: TextStyle(
          fontSize: 14,
          color: Colors.grey,
        ),
        prefixIcon: const Icon(Iconfont.phone,color: Colors.redAccent,size: 16),
        suffixIcon: accountController.hasDel.value? GestureDetector(
          child: Icon(Iconfont.close,color: Colors.redAccent,size: 18),
          onTap: (){
            textController.clear();
            accountController.changeDel(false);
          },
        ): null,
        // contentPadding: EdgeInsets.all(10),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide.none),
        filled: true,
        fillColor: Colors.grey[200],
      ),
      onChanged: (text) {//?????????????????????
        LogUtils.GGQ('phone onChanged:${text}');
        accountController.changeDel(text.isNotEmpty);
      },
      onSubmitted: (text) {//????????????(?????????)?????????
        LogUtils.GGQ('phone onSubmitted:${text}');
      },
    )),
  );
}

Widget _buildPasswordTextField(AccountController accountController,TextEditingController textController) {

  return ConstrainedBox(
    constraints: BoxConstraints(
        maxHeight: 42,
        maxWidth: ScreenUtil().screenWidth * 0.82
    ),
    child: Obx(()=>TextField(
      controller: textController,
      maxLines: 1,
      autocorrect: true,//??????????????????
      // autofocus: true,//??????????????????
      textAlign: TextAlign.start,//??????????????????
      obscureText: !accountController.eyeAction.value,//???????????????
      style: TextStyle(
        fontSize: 14,
        color: Colors.black87,
      ),
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 4),
        hintText: '???????????????',
        hintStyle: TextStyle(
          fontSize: 14,
          color: Colors.grey,
        ),
        prefixIcon: const Icon(Iconfont.pwd,color: Colors.redAccent,size: 16),
        // suffixIcon: accountController.hasEye.value? Icon(accountController.eyeShow.value? Iconfont.eye_show: Iconfont.eye_hide,color: Colors.redAccent,size: 18):null,
          suffixIcon: accountController.hasEye.value? GestureDetector(
            child: Icon(accountController.eyeAction.value? Iconfont.eye_show: Iconfont.eye_hide,color: Colors.redAccent,size: 18),
            onTap: (){
              accountController.onEyeAction();
            },
          ):null,
        // contentPadding: EdgeInsets.all(10),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide.none),
        filled: true,
        fillColor: Colors.grey[200],
      ),
      onChanged: (text) {//?????????????????????
        LogUtils.GGQ('pwd onChanged:${text}');
        accountController.changeEye(text.isNotEmpty);
      },
      onSubmitted: (text) {//????????????(?????????)?????????
        LogUtils.GGQ('pwd onSubmitted:${text}');
      },
    )),
  );
}

class AccountController extends GetxController{

  var hasEye = false.obs;

  void changeEye(bool b){
    this.hasEye.value = b;
    if(this.hasEye.value && this.hasDel.value){
      this.hasLogin.value = true;
    }else{
      this.hasLogin.value = false;
    }
  }

  var eyeAction = false.obs;

  void onEyeAction(){
    this.eyeAction.value = !this.eyeAction.value;
  }

  var hasDel = false.obs;

  void changeDel(bool b){
    this.hasDel.value = b;
    if(this.hasEye.value && this.hasDel.value){
      this.hasLogin.value = true;
    }else{
      this.hasLogin.value = false;
    }
  }

  var hasLogin = false.obs;

  void changeLogin(bool b){
    this.hasLogin.value = b;
  }

}