import 'package:flutter/material.dart';
import '../config/custom_icon.dart';
import './list/common_list.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() {
    return _ListPageState();
  }
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('列表展示'), automaticallyImplyLeading: false),
        body: ListView(
          padding: EdgeInsets.all(30),
          children: <Widget>[
            ListTile(
              title: Text('普通长列表'),
              leading: Icon(Icons.computer),
              trailing:
                  IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward)),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => CommonListPage(
                              type: "1",
                            )));
              },
            ),
            Divider(),
            ListTile(
              title: Text('可勾选列表'),
              leading: Icon(Icons.check_box),
              trailing:
                  IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward)),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              title: Text('动态分页列表'),
              leading: Icon(CustomIcon.favorite),
              trailing:
                  IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward)),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              title: Text('电影列表'),
              leading: Icon(Icons.movie),
              trailing:
                  IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward)),
              onTap: () {},
            ),
            Divider(),
          ],
        ));
  }
}
