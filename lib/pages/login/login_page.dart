import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/common/router/app_pages.dart';
import 'package:flutter_ui/common/router/index.dart';
import 'package:flutter_ui/common/utils/index.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
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
        actions: <Widget>[
          TextButton(
              onPressed: () {
                Toast.show('帮助');
              },
              child: Text('帮助',
                  style: TextStyle(color: Colors.black, fontSize: 14.0)))
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    BoxController boxController = Get.put(BoxController());

    return Container(
      color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: ScreenUtil().screenWidth * 0.8,
            child: Obx(() => ElevatedButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 12)),
                  backgroundColor: MaterialStateProperty.resolveWith((states){
                    if(states.contains(MaterialState.disabled)){
                      return Colors.red[100];
                    }
                    return Colors.redAccent;
                  })
              ),
              onPressed: boxController.boxValue.value? (){
                Get.offAndToNamed(Routes.account);
              }: null,
              child: Text('手机号登录',style: TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'FZFWQingYinTiJWL',
              ),),
            )),
          ),
          Container(
            width: ScreenUtil().screenWidth * 0.8,
            child: Obx(() => OutlinedButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 12)),
                  backgroundColor: MaterialStateProperty.all(Colors.grey[100])
              ),
              onPressed: boxController.boxValue.value? (){
                Get.back();
              }: null,
              child: Text('立即体验',style: TextStyle(
                fontSize: 12,
                color: boxController.boxValue.value? Colors.redAccent: Colors.red[200],
                fontWeight: FontWeight.bold,
                fontFamily: 'FZFWQingYinTiJWL',
              ),),
            )),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(() => Checkbox(value: boxController.boxValue.value, onChanged: (value){
                  boxController.onChangeBox(value);
                })),
                RichText(
                  text: TextSpan(
                      text: '我已认真阅读并同意',
                      style: TextStyle(color: Colors.black, fontSize: 10),
                      children: [
                        TextSpan(
                            text: "《用户使用协议》",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 10,
                                fontStyle: FontStyle.italic,
                                decoration: TextDecoration.underline),
                                recognizer: TapGestureRecognizer() ..onTap = () async {
                                  Toast.show('用户使用协议');
                                }
                        ),
                        TextSpan(
                            text: "及",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontStyle: FontStyle.italic)),
                        TextSpan(
                            text: "《隐私条款》",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 12,
                                fontStyle: FontStyle.italic,
                                decoration: TextDecoration.underline),
                                recognizer: TapGestureRecognizer() ..onTap = () async {
                                  Toast.show('隐私条款');
                                }
                        ),
                      ]
                  ),
                )
              ],
            )
          )
        ],
      ),
    );
  }
}

class BoxController extends GetxController{
  var boxValue = true.obs;

  void onChangeBox(bool b){
    this.boxValue.value = b;
  }
}

