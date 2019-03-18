import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewPage extends StatefulWidget {
  @override
  _WebViewPageState createState() {
    return _WebViewPageState();
  }
}

class _WebViewPageState extends State<WebViewPage> {
  final flutterWebviewPlugin = new FlutterWebviewPlugin();

  @override
  void initState() {
    super.initState();
    flutterWebviewPlugin.onUrlChanged.listen((String url) {
      print(url);
    });
    flutterWebviewPlugin.onScrollYChanged.listen((double offsetY) {
      print('yyyyy');
    });

    flutterWebviewPlugin.onScrollXChanged.listen((double offsetX) {
      print('xxxxx');
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
      url: "https://www.baidu.com/",
      appBar: AppBar(
        title: Text('WebView'),
      ),
      // withZoom: true,
      // withLocalStorage: true,
      // hidden: true,
      initialChild: Container(
        color: Colors.redAccent,
        child: const Center(
          child: Text('加载中.....'),
        ),
      ),
    );
  }
}
