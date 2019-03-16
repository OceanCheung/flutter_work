import 'package:flutter/material.dart';
import './search.dart';
import '../assets/network/net_image.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import '../api/api.dart';
import '../model/user.dart';
import './webview.dart';

class ProjectPage extends StatefulWidget {
  @override
  _ProjectPageState createState() {
    return _ProjectPageState();
  }
}

class _ProjectPageState extends State<ProjectPage> {
  String _userName = "";
  String _email = "";

  //初始化
  @override
  void initState() {
    super.initState();
    _getUserInfoHttp();
  }

  //销毁
  @override
  void dispose() {
    super.dispose();
  }

  //请求个人基本信息
  void _getUserInfoHttp() async {
    try {
      Response response = await Dio().get(API.getUserInfo);
      Map userMap = json.decode(response.data);
      User _user = User.fromJson(userMap);
      setState(() {
        _userName = _user.userName;
        _email = _user.email;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      drawer: getDrawer(),
      body: Container(
        child: Center(
          child: Text('项目'),
        ),
      ),
    );
  }

  ///抽离出来的小部件AppBar
  Widget getAppBar() {
    return AppBar(
      centerTitle: true, //标题居中
      //appbar标题部件
      title: Text(
        "项目",
        style: TextStyle(color: Colors.white),
      ),
      //appbar右侧按钮组
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.search,
          ),
          onPressed: () {
            //动态跳转到新页面
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => SearchPage(
                          title: "搜索",
                          other: "",
                        )));
          },
        ),
        IconButton(
          icon: Icon(
            Icons.share,
          ),
          onPressed: () {},
        )
      ],
    );
  }

  ///抽离出来的drawer
  Widget getDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(_userName), //用户名
            accountEmail: Text(_email), //邮箱
            currentAccountPicture: GestureDetector(
              child: CircleAvatar(
                backgroundImage: NetworkImage(NetImgae.USER_AVATAR),
              ),
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(NetImgae.USER_ACCOUNT_IMAGE),
                    fit: BoxFit.cover)),
          ),
          ListTile(
            title: Text('我是01'),
            contentPadding: EdgeInsets.all(5),
            leading: IconButton(
              icon: Icon(Icons.access_time),
              onPressed: () {},
            ),
            onTap: () {
              // Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => SearchPage(
                            title: "搜索",
                            other: "",
                          )));
            },
          ),
          ListTile(
            title: Text('跳转到webview页面'),
            contentPadding: EdgeInsets.all(5),
            leading: IconButton(
              icon: Icon(Icons.access_time),
              onPressed: () {},
            ),
            onTap: () {
              // Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => WebViewPage()));
            },
          )
        ],
      ),
    );
  }
}
