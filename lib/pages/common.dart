import 'package:flutter/material.dart';
import './common/input.dart';
import './common/animation/animation.dart';
import './common/chip.dart';

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
      length: 3,
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
                  '动画',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  'Chip',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          body: Container(
            child: TabBarView(
              children: <Widget>[InputPage(), AnimationPage(), ChipPage()],
            ),
          )),
    );
  }
}
