import 'package:flutter/material.dart';
import './splash.dart';
import '../router/route_handle.dart';
import '../router/router.dart';
import '../utils/bugly.dart';
import '../utils/http.dart';
import '../utils/oktoast.dart';
import '../utils/provider.dart';
import '../utils/push.dart';
import '../utils/shared_preferences.dart';
import '../utils/sql_helper.dart';
import '../utils/umeng.dart';
import 'package:provider/provider.dart';

//普通App的启动
class NormalApp {
  //运行app
  static void run() {
    WidgetsFlutterBinding.ensureInitialized();
    SPUtils.init().then((value) => runApp(Store.init(MyApp())));
    initApp();
  }

  //程序初始化操作
  static void initApp() {
    Http.init();
    FRouter.init();
    SQLHelper.init();
    // Push.init();
    // Bugly.init();
    // UMeng.init();
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer2<AppTheme, LocaleModel>(
        builder: (context, appTheme, localeModel, _) {
      return ToastUtils.init(
        MaterialApp(
        title: 'Flutter Learn',
        theme: ThemeData(
          primarySwatch: appTheme.themeColor,
          buttonColor: appTheme.themeColor,
        ),
        home: SplashPage(),
        onGenerateRoute: FRouter.router.generator,
        // routes: RouteMap.routes,
        // locale: localeModel.getLocale(),
        // supportedLocales: <Locale>[
        //   const Locale('en', 'US'), // 美国英语
        //   const Locale('zh', 'CN'), // 中文简体
        // ],
        // localizationsDelegates: [
        //   PickerLocalizationsDelegate.delegate, // 如果要使用本地化，请添加此行，则可以显示中文按钮
        //   GlobalEasyRefreshLocalizations.delegate,
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalWidgetsLocalizations.delegate,
        //   GlobalCupertinoLocalizations.delegate,
        //   AppLocalizationsDelegate.delegate
        // ],
        // localeResolutionCallback:
        //     (Locale _locale, Iterable<Locale> supportedLocales) {
        //   if (localeModel.getLocale() != null) {
        //     //如果已经选定语言，则不跟随系统
        //     return localeModel.getLocale();
        //   } else {
        //     //跟随系统
        //     Locale locale;
        //     if (supportedLocales.contains(_locale)) {
        //       locale = _locale;
        //     } else {
        //       //如果系统语言不是中文简体或美国英语，则默认使用英语
        //       locale = Locale('en', 'US');
        //     }
        //     return locale;
        //   }
        // },
      ));
    });
  }
}
