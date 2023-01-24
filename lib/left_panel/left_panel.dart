import 'package:flutter/material.dart';
import 'package:lecrecorder/providers/lec_data_provider.dart';
import 'package:lecrecorder/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class LeftPanel extends StatefulWidget {
  const LeftPanel({Key? key}) : super(key: key);

  @override
  State<LeftPanel> createState() => _LeftPanelState();
}

class _LeftPanelState extends State<LeftPanel> {
  late LecDataProvider lecDataProvider;

  void close() {
    lecDataProvider.exit();
    Navigator.pop(context);
  }

  void finishRecording() {
    lecDataProvider.finishaAndUpload();
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    lecDataProvider = Provider.of<LecDataProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
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
                  const SizedBox(height: 10),
                  TextButton(
                      onPressed: () => finishRecording(),
                      child: const CustomText('STOP',
                          size: 20, color: Colors.white)),
                  const SizedBox(height: 80),
                  TextButton(
                      onPressed: () => close(),
                      child: const CustomText('EXIT',
                          size: 20, color: Colors.white))
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
