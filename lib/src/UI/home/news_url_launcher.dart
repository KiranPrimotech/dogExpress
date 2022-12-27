

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class NewsUrlLauncher extends StatefulWidget{
  

  @override
  State<NewsUrlLauncher> createState() => _NewsUrlLauncherState();
}

class _NewsUrlLauncherState extends State<NewsUrlLauncher> {
  late WebViewController controller;
  void initializeController(){
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://flutter.dev'));
  }

   @override
  void initState() {
    initializeController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  WebViewWidget(controller: controller);
  }
}