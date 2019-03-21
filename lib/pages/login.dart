import 'package:flutter/material.dart';
import './home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  //用户名
  String _userName;
  //密码
  String _password;
  //用户名验证信息
  String _userNameValidate;
  //用户名验证信息显示隐藏
  bool _userNameDisplay;
  //密码验证信息
  String _passwordValidate;
  //密码验证信息显示隐藏
  bool _passwordDisplay;
  //监听用户名
  TextEditingController _userNameEditingController;
  //监听密码
  TextEditingController _passwordEditingController;

  //初始化
  @override
  void initState() {
    super.initState();
    _userNameDisplay = true;
    _passwordDisplay = true;
    _userNameEditingController = TextEditingController();
    _passwordEditingController = TextEditingController();
    //添加监听
    _userNameEditingController.addListener(() {
      // print('用户名:' + _userNameEditingController.text);
    });
    //添加监听
    _passwordEditingController.addListener(() {
      // print('密码:' + _passwordEditingController.text);
    });
  }

  //销毁
  @override
  void dispose() {
    super.dispose();
    //释放资源
    _userNameEditingController.dispose();
    _passwordEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Image.asset(
              "lib/assets/images/local/login/logo.png",
              fit: BoxFit.cover,
              width: double.infinity,
              height: 240,
            ),
          ),
          // Container(
          //   padding: EdgeInsets.all(10),
          //   alignment: Alignment.center,
          //   child: Text('欢迎来到天宁区重点项目',
          //       style: TextStyle(fontSize: 24, color: Colors.grey)),
          // ),
          Container(
            padding: EdgeInsets.all(30),
            child: TextField(
              onChanged: (text) {
                setState(() {
                  _userName = text;
                });
              },
              controller: _userNameEditingController,
              decoration: InputDecoration(
                  hintText: "用户名", prefixIcon: Icon(Icons.person)),
            ),
          ),
          Container(
              padding: EdgeInsets.only(left: 40),
              child: Offstage(
                offstage: _userNameDisplay, //true表示隐藏，false表示显示
                child: Text("$_userNameValidate",
                    style: TextStyle(color: Colors.red)),
              )),
          Container(
            padding: EdgeInsets.all(30),
            child: TextField(
              onChanged: (text) {
                setState(() {
                  _password = text;
                });
              },
              controller: _passwordEditingController,
              obscureText: true,
              decoration:
                  InputDecoration(hintText: "密码", prefixIcon: Icon(Icons.lock)),
            ),
          ),
          Container(
              alignment: Alignment.center,
              child: Material(
                color: Colors.blue,
                child: Ink(
                  child: InkWell(
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 40.0, top: 10.0, right: 40.0, bottom: 10.0),
                      child: Text(
                        '登录',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    onTap: () {
                      //进行验证
                      if (_userName.isNotEmpty) {
                        setState(() {
                          _userNameDisplay = true; //隐藏
                        });
                      } else {
                        print('显示');
                        setState(() {
                          _userNameValidate = "用户名不能为空";
                          _userNameDisplay = false; //显示
                        });
                        return;
                      }
                      //判空
                      if (_password.isNotEmpty) {
                        print("密码");
                      } else {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('提示'),
                                content: Text('密码不能为空'),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text('确定'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  )
                                ],
                              );
                            });
                        return;
                      }
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => HomePage()));
                    },
                  ),
                ),
              ))
        ],
      )),
    );
  }
}
