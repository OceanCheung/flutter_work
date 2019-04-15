import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ChartPage extends StatefulWidget {
  @override
  _ChartPageState createState() {
    return _ChartPageState();
  }
}

class _ChartPageState extends State<ChartPage> {
  final flutterWebviewPlugin = new FlutterWebviewPlugin();

  @override
  void initState() {
    super.initState();
    flutterWebviewPlugin.onUrlChanged.listen((String url) {
      // print(url);
    });
    flutterWebviewPlugin.onScrollYChanged.listen((double offsetY) {
      // print('yyyyy');
    });

    flutterWebviewPlugin.onScrollXChanged.listen((double offsetX) {
      // print('xxxxx');
    });
  }

  @override
  void dispose() {
    super.dispose();
    flutterWebviewPlugin.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      // url: "https://www.baidu.com/",
      url: "http://58.216.140.179:8183/chart/index.html",
      appBar: AppBar(
        title: Text('图表'),
        automaticallyImplyLeading: false,
      ),
      // withZoom: false,
      // withLocalStorage: true,
      // hidden: true,
      initialChild: Container(
        color: Colors.white,
        child: Center(
          child: Text('加载中.....'),
        ),
      ),
    );
  }
}
