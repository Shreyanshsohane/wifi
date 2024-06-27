import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:wifi/views/homeScreen.dart';

class WebviewScreen extends StatefulWidget {
  const WebviewScreen({super.key});

  @override
  State<WebviewScreen> createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  late final WebViewController _controller;

  String? username = "";
  String? password = "";
  String? link = "";

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    await _loadUsername();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // print the loading progress to the console
            // you can use this value to show a progress bar if you want
            debugPrint("Loading: $progress%");
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            // Inject JavaScript to set the input values and click the button once the page has finished loading
            _controller.runJavaScript('''
              document.getElementById("username").value = "$username";
              document.getElementById("password").value = "$password";
              document.querySelector("button[name='login']").click();
            ''').then((value) {
              // Delay the pop to allow the JavaScript to execute
              Future.delayed(const Duration(seconds: 2), () {
                if (mounted) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Homescreen(),
                    ),
                  );
                }
              });
            });
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(link ?? "http://172.16.0.1/0/up"));
  }

  Future<void> _loadUsername() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('userName') ?? "";
      password = prefs.getString('password') ?? "";
      link = prefs.getString('link') ?? "http://172.16.0.1/0/up";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Webview Example'),
      ),
      body: SizedBox(
        width: double.infinity,
        // the most important part of this example
        child: WebViewWidget(
          controller: _controller,
        ),
      ),
    );
  }
}
