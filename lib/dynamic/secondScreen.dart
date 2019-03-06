import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('第二个页面')),
        body: Container(
          child: Center(
            child: RaisedButton(
              onPressed: () {
                // Navigator.pop(context);
                Navigator.pushNamed(context, '/third');
              },
              // child: Text('返回第一个'),
              child: Text('到第三'),
            ),
          ),
        ));
  }
}
