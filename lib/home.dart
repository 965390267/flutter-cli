import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import './router/route.dart';
import './utils/click.dart';
import './utils/xupdate.dart';
// import 'package:flutter_learn/view/gridview_page.dart';
// import 'package:flutter_learn/view/home/home_drawer.dart';
import './page/index/index.dart';
class MainHomePage extends StatefulWidget {
  MainHomePage({Key key}) : super(key: key);
  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage>
    with SingleTickerProviderStateMixin {
  List<Widget> getTabs(BuildContext context) => [
        Home(),
        Tab(text:'22'),
        Tab(text:'55')
      ];
PageController _pageController;
  List<Widget> getTabViews(BuildContext context) => <Widget>[
        // GridViewPage(items: RouteMap.getWidgetItems(context)),
        // GridViewPage(items: RouteMap.getUtilsItems(context)),
        // GridViewPage(items: RouteMap.getExpandItems(context)),
      ];

  TabController _tabController;
void tapIndex(int index){
   print(index);
setState((){
 _pageController.jumpToPage(index);
  });
 }
  int _selectedIndex=0;
  @override
  void initState() {
    super.initState();
        _pageController=new PageController(initialPage: 0);
    _tabController = TabController(vsync: this, length: 4);

    XUpdate.initAndCheck();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
    _tabController.dispose();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return WillPopScope(
        child: Scaffold(
          key: _scaffoldKey,
          // appBar: AppBar(
          //   title: Text('ttt'),
          //   bottom: TabBar(
          //     controller: _tabController,
          //     tabs: getTabs(context),
          //   ),
          // ),
          // drawer: HomeDrawer(),
          body: PageView(
            // physics: NeverScrollableScrollPhysics(),
            controller: _pageController,
            children:<Widget>[Text('data'), Home(),Text('data'),Text('data')],
             onPageChanged: (int index){
           setState(() {
            _selectedIndex=index; 
           });
         },
          ),
           bottomNavigationBar:  BottomNavigationBar( // 底部导航
        type: BottomNavigationBarType.fixed,
        iconSize: 16.0,
        selectedFontSize: 11.0,
        unselectedFontSize: 10.0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.message), title: Text('消息')),
          BottomNavigationBarItem(icon: Icon(Icons.contact_phone), title: Text('联系人')),
          BottomNavigationBarItem(icon: Icon(Icons.looks), title: Text('看点')),
          BottomNavigationBarItem(icon: Icon(Icons.access_time), title: Text('动态')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: tapIndex,
      ),
        ),
        //监听导航栏返回,类似onKeyEvent
        onWillPop: () =>
            ClickUtils.exitBy2Click(status: _scaffoldKey.currentState));
  }
}
