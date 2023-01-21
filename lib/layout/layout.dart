import 'package:flutter/material.dart';
import 'package:lecrecorder/layout/side_panel.dart';

class Layout extends StatelessWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const Flexible(
            flex: 7,
            child: SidePanel()
          ),
          Flexible(
            flex: 20,
            child: Container(color:Colors.blue)
          )
        ],
      ),
    );
  }
}
