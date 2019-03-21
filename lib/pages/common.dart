import 'package:flutter/material.dart';
import './common/input.dart';

class CommonPage extends StatefulWidget {
  @override
  _CommonPageState createState() {
    return _CommonPageState();
  }
}

class _CommonPageState extends State<CommonPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('常规'),
          automaticallyImplyLeading: false,
          bottom: TabBar(
            tabs: <Widget>[
              Text(
                '输入',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                '其他',
                style: TextStyle(fontSize: 18),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[InputPage(), Text('2')],
        ),
      ),
    );
  }
}
