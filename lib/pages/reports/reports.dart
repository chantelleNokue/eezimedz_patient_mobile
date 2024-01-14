import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Reports extends StatefulWidget {
  const Reports({super.key});

  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {

  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..loadRequest(Uri.parse('https://app.powerbi.com/reportEmbed?reportId=bba4cc67-0b45-4dbe-a8c4-fda47883ffd3&autoAuth=true&ctid=478976bf-e229-4adb-bf89-9f02e0fc2473'));
  // https://flutter.dev
  //https://app.powerbi.com/reportEmbed?reportId=6ebf6b76-62b9-4a9f-acbd-2ce12973c4d1&autoAuth=true&ctid=478976bf-e229-4adb-bf89-9f02e0fc2473

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Simple Example')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: WebViewWidget(controller: controller),
      ),
    );
  }
}
