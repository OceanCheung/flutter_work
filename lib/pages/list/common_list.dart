import 'package:flutter/material.dart';

class CommonListPage extends StatefulWidget {
  //初始化参数
  CommonListPage({Key key, this.type}) : super(key: key);
  String type;

  @override
  _CommonListPage createState() {
    return _CommonListPage();
  }
}

class _CommonListPage extends State<CommonListPage> {
  List<String> _list;

  Widget getListView() {
    return ListView.builder(
      itemCount: _list.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(_list[index]),
          leading: Icon(Icons.favorite),
          trailing: Icon(Icons.check_box),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("普通长列表"),
      ),
      body: Container(
        child: getListView(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _list = List();
    //循环添加50个数
    for (var i = 0; i < 50; i++) {
      _list.add("item" + (i + 1).toString());
    }
  }

  @override
  void dispose() {
    super.dispose();
    _list = null;
  }
}
