import 'package:flutter/material.dart';
import 'package:lecrecorder/providers/lec_data_provider.dart';
import 'package:lecrecorder/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class LeftPanel extends StatelessWidget {
  const LeftPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LecDataProvider lecDataProvider = Provider.of<LecDataProvider>(context);
    return Column(
      children: [
        Expanded(
            child: Container(
              color: Colors.red,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomText(
                      'Slide #',
                      size: 25,
                      color: Colors.white,
                    ),
                    CustomText(
                      lecDataProvider.currentSlide.toString(),
                      size: 25,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
        )
      ],
    );
  }
}
