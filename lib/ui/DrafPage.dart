import 'package:flutter/material.dart';


class DraftPage extends StatelessWidget {
  final Color bgC;
  final Widget content;

  DraftPage({this.content, this.bgC = Colors.purple});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Multi Bloc"), backgroundColor: bgC,),
      body: content,
    );
  }
}
