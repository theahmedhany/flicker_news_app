import 'package:flicker_news_app/models/article_model.dart';
import 'package:flicker_news_app/services/circular_indicator.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebController extends StatefulWidget {
  const WebController({
    Key? key,
    required this.article,
    required this.controller,
  }) : super(key: key);

  final ArticleModel article;
  final WebViewController controller;

  @override
  State<WebController> createState() => _WebControllerState();
}

class _WebControllerState extends State<WebController> {
  bool isLoading = true;
  bool isError = false;

  @override
  void initState() {
    super.initState();
    widget.controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0xffF8DFD4))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            setState(() {});
          },
          onPageStarted: (String url) {
            setState(() {
              isLoading = true;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              isLoading = false;
            });
          },
          onWebResourceError: (WebResourceError error) {
            isError = true;
            throw Exception(error.description);
          },
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.article.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFEFE8),
      appBar: AppBar(
        title: Text(
          'Details',
          style: TextStyle(
            fontSize: 28,
            color: Color(0xffF8DFD4),
            fontWeight: FontWeight.bold,
          ),
        ),
        surfaceTintColor: Colors.transparent,
        backgroundColor: Color(0xffC69774),
        iconTheme: IconThemeData(
          size: 30,
          color: Color(0xffF8DFD4),
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularIndicator(),
            )
          : isError
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      height: 450,
                      decoration: BoxDecoration(
                        color: Color(0xffDDBEA9),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/error.png'),
                          Text(
                            'Oops, There was an error.',
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffC69774)),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : WebViewWidget(
                  controller: widget.controller,
                ),
    );
  }
}
