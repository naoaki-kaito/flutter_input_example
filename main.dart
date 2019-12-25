import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Input Example',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController _scrollController;
  ScrollNotification _scrollNotification;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('入力テスト'),
      ),
      body: NotificationListener(
          child: SingleChildScrollView(
              dragStartBehavior: DragStartBehavior.down,
              child: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: Column(children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('XXXXXを入力してください。'),
                          Text('XXXXXはあとからマイページにて変更することも可能です。'),
                          Container(
                            height: 500,
                            color: Colors.green,
                          ),
                        ],
                      ),
                    ),
                    TextField(),
                    Padding(
                      padding: EdgeInsets.only(top: 50, bottom: 50),
                      child: RaisedButton(child: Text('次へ進む')),
                    )
                  ]))),
          onNotification: (ScrollNotification scrollInfo) {
            FocusScope.of(context).unfocus();
          }),
      resizeToAvoidBottomInset: false,
    );
  }
}
