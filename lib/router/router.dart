import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:ys_teacher/page/index/index.dart';
import '../home.dart';
import './animation.dart';
import './route_handle.dart';
// import 'package:flutter_learn/view/web_view_page.dart';

class FRouter {
  static Router router;

  static void init() {
    router = Router();
    configureRoutes(router);
  }
   
  static void configureRoutes(Router router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("route is not find !");
      return null;
    });
    // RouteMap.routes.forEach((key, value) {
    //    router.define(key, handler: Handler(handlerFunc: value));
    // });
    router.define('/home', handler: Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) => MainHomePage()));

  }

  static void goto(BuildContext context, String pageName) {
    Navigator.push(context, SlidePageRoute(routeName: pageName));
  }

  static void gotoWidget(BuildContext context, Widget widget) {
    Navigator.push(context, SlidePageRoute(widget: widget));
  }
  static void fluoPush(BuildContext context,String pageName){
         var transition = (BuildContext context, Animation<double> animation,//自定义fluro转场动画
        Animation<double> secondaryAnimation, Widget child) {
        return  SlideTransition(
                position: Tween<Offset>(
                        //1.0为右进右出，-1.0为左进左出
                        begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
                    .animate(CurvedAnimation(
                        parent: animation, curve: Curves.fastOutSlowIn)),
                child: child,
              );
      // return new ScaleTransition(
      //   scale: animation,
      //   child: new RotationTransition(
      //     turns: animation,
      //     child: child,
      //   ),
      // );
    };
       router.navigateTo(context, pageName,transition: TransitionType.inFromRight);
  }
}

// Handler webViewPageHand = Handler(
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//   String title = params['title']?.first;
//   String url = params['url']?.first;
//   return WebViewPage(url, title);
// });
