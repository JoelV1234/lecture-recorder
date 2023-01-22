import 'package:flutter/material.dart';
import 'package:lecrecorder/providers/lec_data_provider.dart';
import 'package:lecrecorder/utils/getters.dart';

class Controls extends StatelessWidget {
  const Controls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LecDataProvider lecDataProvider = getLecDataProvider(context);
    return Column(
      children: [
        Expanded(
          child: InkWell(
            onTap: () => lecDataProvider.previousSlide(),
            child: Container(
              color: Colors.red,
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: () => lecDataProvider.nextSlide(),
            child: Container(
              color: Colors.yellow,
            ),
          ),
        )
      ],
    );
  }
}
