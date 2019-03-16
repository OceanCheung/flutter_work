import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key, this.title, this.other}) : super(key: key);
  String title;
  String other;

  @override
  _SearchPageState createState() {
    return _SearchPageState();
  }
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Center(
          child: Text("搜索界面"),
        ),
      ),
    );
  }
}
