import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GenericWebViewPage extends StatefulWidget {
  final String url;
  final String title;

  const GenericWebViewPage({super.key, required this.url, required this.title});

  @override
  State<GenericWebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<GenericWebViewPage> {
  late WebViewController webViewController;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    // Initialize the WebViewController
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
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
          onHttpError: (HttpResponseError error) {
            debugPrint("HTTP error: ${error.response}");
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint("Web resource error: ${error.description}");
          },
          onNavigationRequest: (NavigationRequest request) {
            if (!request.url.startsWith('https')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Colors.white,
          title: Text(widget.title),
        ),
        body: WillPopScope(
          onWillPop: () async {
            if (await webViewController.canGoBack()) {
              webViewController.goBack();
              return false;
            }
            return true;
          },
          child: OrientationBuilder(
            builder: (context, orientation) {
              double containerWidth;
              double containerHeight;

              // Determine the dimensions based on orientation
              if (orientation == Orientation.portrait) {
                containerWidth = screenwidth(context);
                containerHeight = screenheight(context);
              } else {
                containerWidth = screenwidth(context) * 2;
                containerHeight = screenheight(context);
              }
              return SizedBox(
                width: containerWidth,
                height: containerHeight,
                child: Stack(
                  children: [
                    WebViewWidget(controller: webViewController),
                    if (isLoading)
                      const Center(child: CircularProgressIndicator()),
                  ],
                ),
              );
            },
          ),
        ),

      ),
    );
  }
  double screenheight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  double screenwidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}
