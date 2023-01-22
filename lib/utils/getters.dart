import 'package:flutter/material.dart';
import 'package:lecrecorder/providers/lec_data_provider.dart';
import 'package:provider/provider.dart';

LecDataProvider getLecDataProvider(BuildContext context) {
  return Provider.of<LecDataProvider>(context, listen: false);
}
