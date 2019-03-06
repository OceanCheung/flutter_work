import 'package:flutter/material.dart';
import '../pages/project.dart';
import '../pages/chart.dart';
import '../pages/map.dart';
import '../pages/setting.dart';

///主页面
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  //所有的页面
  List<StatefulWidget> pageList;
  //所有的底部导航栏
  List<BottomNavigationBarItem> bottomNavigationBarItemList;
  //当前页面
  StatefulWidget currentPage;
  //当前下标
  int currentIndex = 0;
  //初始化
  @override
  void initState() {
    super.initState();
    //初始化所有的界面
    pageList = <StatefulWidget>[
      ProjectPage(),
      ChartPage(),
      MapPage(),
      SettingPage(),
    ];
    //初始化底部导航栏
    bottomNavigationBarItemList = <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('项目')),
      BottomNavigationBarItem(
          icon: Icon(Icons.insert_chart), title: Text('报表')),
      BottomNavigationBarItem(icon: Icon(Icons.map), title: Text('地图')),
      BottomNavigationBarItem(icon: Icon(Icons.message), title: Text('设置')),
    ];
    //初始化当前下标
    currentIndex = 0;
    //初始化当前页面
    currentPage = pageList[currentIndex];
  }

  //销毁
  @override
  void dispose() {
    super.dispose();
  }

  //方法
  _changeIndexPage(index) {
    setState(() {
      currentIndex = index;
      currentPage = pageList[currentIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        //此处表示无状态的底部tab栏
        length: pageList.length, //tab栏的个数
        child: Scaffold(
          body: currentPage,
          bottomNavigationBar: getBottomNavigationBar(),
        ));
  }

  //底部的tabbar
  Widget getBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(color: Colors.blue),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        items: bottomNavigationBarItemList,
        onTap: (index) {
          _changeIndexPage(index);
        },
      ),
    );
  }
}
