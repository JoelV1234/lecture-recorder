import 'package:flutter/material.dart';
import 'package:lecrecorder/recorder_page/widgets/center_panel.dart';
import 'package:lecrecorder/left_panel/left_panel.dart';
import 'package:lecrecorder/recorder_page/widgets/right_panel.dart';


class RecorderPageLayout extends StatelessWidget {
  const RecorderPageLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: const [
          Flexible(
            flex: 7,
            child: LeftPanel()
          ),
          Flexible(
            flex: 20,
            child: CenterPanel()
          ),
          Flexible(
            flex: 4,
            child: RightPanel()
          )     
        ],
      ),
    );
  }
}
