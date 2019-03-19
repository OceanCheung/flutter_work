import 'package:flutter/material.dart';

class CommonListPage extends StatefulWidget {
  //初始化参数
  CommonListPage({Key key, this.type}) : super(key: key);
  final String type;

  @override
  _CommonListPageState createState() {
    return _CommonListPageState();
  }
}

class _CommonListPageState extends State<CommonListPage> {
  //列表集合
  List<String> _list;

  Widget getListView() {
    return ListView.builder(
      itemCount: _list.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(_list[index]),
          leading: Text((index + 1).toString()),
          trailing: IconButton(
            color: index % 2 == 1 ? Colors.red : Colors.grey,
            icon: Icon(Icons.favorite),
            onPressed: () {
              setState(() {});
            },
          ),
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
