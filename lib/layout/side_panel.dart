import 'package:flutter/material.dart';
import 'package:lecrecorder/slides/widgets/controls.dart';

class SidePanel extends StatelessWidget {
const SidePanel({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      color: Colors.red,
      child: Column(
        children: const [
          SizedBox(height: 50),
          Controls()
        ],
      ),
    );
  }
}