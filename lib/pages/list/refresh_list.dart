import 'package:flutter/material.dart';
import 'package:flutter_refresh/flutter_refresh.dart';

class RefreshListPage extends StatefulWidget {
  @override
  _RefreshListPageState createState() {
    return _RefreshListPageState();
  }
}

class _RefreshListPageState extends State<RefreshListPage> {
  int _itemCount;

  Widget getRefreshList() {
    return new SafeArea(
        child: new Refresh(
      onFooterRefresh: onFooterRefresh,
      onHeaderRefresh: onHeaderRefresh,
      child: new ListView.builder(
        itemBuilder: (context, index) {
          return new Padding(
            key: new Key(index.toString()),
            padding: new EdgeInsets.all(10.0),
            child: new Text(
              "item:" + (index + 1).toString(),
              style: new TextStyle(fontSize: 14.0),
            ),
          );
        },
        itemCount: _itemCount,
      ),
    ));
  }

  Future<Null> onFooterRefresh() {
    return new Future.delayed(new Duration(seconds: 2), () {
      setState(() {
        _itemCount += 10;
      });
    });
  }

  Future<Null> onHeaderRefresh() {
    return new Future.delayed(new Duration(seconds: 2), () {
      setState(() {
        _itemCount = 10;
      });
    });
  }

  @override
  void initState() {
    _itemCount = 10;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('上拉下拉动态列表'),
      ),
      body: getRefreshList(),
    );
  }
}
