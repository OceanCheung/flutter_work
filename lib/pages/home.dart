import 'package:flutter/material.dart';
import '../pages/project.dart';
import '../pages/chart.dart';
import '../pages/map.dart';
import '../pages/setting.dart';
import '../pages/list.dart';
import '../pages/common.dart';

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
  int currentIndex;
  //初始化
  @override
  void initState() {
    super.initState();
    //初始化下标
    currentIndex = 0;
    //初始化所有的界面
    pageList = <StatefulWidget>[
      ProjectPage(),
      ChartPage(),
      MapPage(),
      SettingPage(),
      CommonPage(),
      ListPage()
    ];
    //初始化底部导航栏
    bottomNavigationBarItemList = <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('项目')),
      BottomNavigationBarItem(
          icon: Icon(Icons.insert_chart), title: Text('报表')),
      BottomNavigationBarItem(icon: Icon(Icons.map), title: Text('地图')),
      BottomNavigationBarItem(icon: Icon(Icons.message), title: Text('设置')),
      BottomNavigationBarItem(icon: Icon(Icons.widgets), title: Text('组件')),
      BottomNavigationBarItem(icon: Icon(Icons.list), title: Text('列表'))
    ];
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
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: currentPage,
      bottomNavigationBar: getBottomNavigationBar(),
    );
  }

  //底部的tabbar
  Widget getBottomNavigationBar() {
    return Container(
      // decoration: BoxDecoration(color: Colors.white),
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
