import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lecrecorder/pdf_viewer/widgets/pdf_view.dart';
import 'package:lecrecorder/providers/lec_data_provider.dart';
import 'package:provider/provider.dart';

class CenterPanel extends StatelessWidget {
  const CenterPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LecDataProvider lecDataProvider = Provider.of<LecDataProvider>(context);
    File pdfFile = lecDataProvider.slideFile!;
    int currentSlide = lecDataProvider.currentSlide;
    return PdfView(file: pdfFile , currentPage: currentSlide);
  }
}
