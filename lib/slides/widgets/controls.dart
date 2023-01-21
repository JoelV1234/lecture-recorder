import 'package:flutter/material.dart';
import 'package:lecrecorder/widgets/custom_text.dart';

class Controls extends StatelessWidget {
  const Controls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children:  [
        TextButton(
          onPressed: () {}, 
          child: const CustomText('Prev', color: Colors.white, size: 20)
        ),
        TextButton(
          onPressed: () {}, 
          child: const CustomText('Next', color: Colors.white, size: 20)
        ),
      ],
    );
  }
}
