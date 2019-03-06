import 'package:flutter/material.dart';

class ChartPage extends StatefulWidget {
  @override
  _ChartPageState createState() {
    return _ChartPageState();
  }
}

class _ChartPageState extends State<ChartPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
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
                children: <Widget>[Text('统计报表'), Text('统计图表')],
              ),
            )));
  }
}
