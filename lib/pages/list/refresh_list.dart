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
    return SafeArea(
        child: Refresh(
      onFooterRefresh: onFooterRefresh,
      onHeaderRefresh: onHeaderRefresh,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            key: Key(index.toString()),
            padding: EdgeInsets.all(10.0),
            child: Text(
              "item:" + (index + 1).toString(),
              style: TextStyle(fontSize: 14.0),
            ),
          );
        },
        itemCount: _itemCount,
      ),
    ));
  }

  Future<Null> onFooterRefresh() {
    return Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _itemCount += 10;
      });
    });
  }

  Future<Null> onHeaderRefresh() {
    return Future.delayed(Duration(seconds: 2), () {
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
