import 'package:flutter/material.dart';

String url =
    "https://us04web.zoom.us/j/,https://teams.microsoft.com/l/meetup-join/";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Webview Example',
      theme: ThemeData.dark(),
      routes: {
        "/": (_) => Home(),
        "/webview": (_) => WebviewScaffold(
              url: url,
              appBar: AppBar(
                title: Text("WebView"),
              ),
              withJavascript: true,
              withLocalStorage: true,
              withZoom: true,
              withMicrosoftTeams: true,
            )
      },
    );
  }

  // ignore: non_constant_identifier_names
  WebviewScaffold(
      {String url,
      AppBar appBar,
      bool withJavascript,
      bool withLocalStorage,
      bool withZoom,
      bool withMicrosoftTeams}) {}
}

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  final webView = FlutterWebviewPlugin();
  TextEditingController controller = TextEditingController(text: url);

  @override
  void initState() {
    super.initState();

    webView.close();
    controller.addListener(() {
      url = controller.text;
    });
  }

  @override
  void dispose() {
    webView.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("WebView"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  controller: controller,
                ),
              ),
              RaisedButton(
                child: Text("Open Webview"),
                onPressed: () {
                  Navigator.of(context).pushNamed("/webview");
                },
              )
            ],
          ),
        ));
  }

  static FlutterWebviewPlugin() {}
}
