import 'package:flutter/material.dart';
import './chart/simple.dart';

class ChartPage extends StatefulWidget {
  @override
  _ChartPageState createState() {
    return _ChartPageState();
  }
}

class _ChartPageState extends State<ChartPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  List list = new List();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text('报表'),
          bottom: TabBar(
            tabs: <Widget>[
              Text(
                '统计报表',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                '统计图表',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        body: Container(
          child: TabBarView(
            children: <Widget>[Text('统计报表')],
          ),
        ),
      ),
    );
  }
}
