import 'package:flutter/material.dart';
import '../utils/shared_preferences.dart';
import '../router/router.dart';
//类似广告启动页
class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    countDown();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Center(
            child: Image(
          image:NetworkImage('http://img.zangzhihong.com/background1.jpg'),
          height: 96,
          width: 96,
        )));
  }

  //倒计时
  void countDown() {
    var _duration = Duration(seconds: 2);
    new Future.delayed(_duration, goHomePage);
  }

  //页面跳转
  void goHomePage() {
    String nickName = SPUtils.getNickName();
    if (nickName != null && nickName.isNotEmpty) {
      Navigator.of(context).pushReplacementNamed('/home');
    } else {
      FRouter.router.navigateTo(context, '/home',replace: true);
      // Navigator.of(context).pushReplacementNamed('/home');
    }
  }
}
