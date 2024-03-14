import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatelessWidget {
  final String url;
  WebViewPage(this.url);
  final controlar=WebViewController()
  ..setJavaScriptMode(JavaScriptMode.disabled);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text("Education"),),
      body:

          WebViewWidget(
            controller: controlar ..loadRequest(Uri.parse(url))
          )


    );
  }
}