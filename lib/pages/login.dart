import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            alignment: Alignment.center,
            color: Colors.lightBlue, //背景色
            child: Column(
              //主轴
              mainAxisAlignment: MainAxisAlignment.center,
              //纵轴
              crossAxisAlignment: CrossAxisAlignment.center,
              //方向 自上而下
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                Container(
                  child: Text('123'),
                ),
                Container(child: Text('456')),
                Container(
                  child: Text('789'),
                ),
                Container(
                  child: Text('123'),
                )
              ],
            )));
  }
}
