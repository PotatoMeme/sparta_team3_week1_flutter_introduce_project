import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatelessWidget {
  //WebViewPage입니다
  const WebViewPage({super.key, required this.url}); //생성자로 url을 받아 옵니다

  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("웹뷰 페이지"),
      ),
      body: WebView(initialUrl: url), //webView에 url을 집어넣어 해당링크의 페이지를 보여줍니다.
    );
  }
}
