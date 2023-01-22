// ignore_for_file: avoid_print
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfView extends StatefulWidget {
  final File file;
  final int currentPage;
  const PdfView({Key? key, required this.file, this.currentPage = 0})
      : super(key: key);

  @override
  PdfViewState createState() => PdfViewState();
}

class PdfViewState extends State<PdfView> {

  PdfViewerController pdfViewerController = PdfViewerController();

  @override
  void didUpdateWidget(covariant PdfView oldWidget) {
    super.didUpdateWidget(oldWidget);
    pdfViewerController.jumpToPage(widget.currentPage);
  }

  @override
  Widget build(BuildContext context) {
    print(widget.currentPage);
    return SfPdfViewer.file(
      widget.file,
      controller: pdfViewerController
    );
  }
}
