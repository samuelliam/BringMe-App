// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom widgets

import 'dart:io';

class ImageViewWithPathWidget extends StatefulWidget {
  const ImageViewWithPathWidget({
    Key? key,
    this.width,
    this.height,
    this.imagePath,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? imagePath;

  @override
  _ImageViewWithPathWidgetState createState() =>
      _ImageViewWithPathWidgetState();
}

class _ImageViewWithPathWidgetState extends State<ImageViewWithPathWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.imagePath == null
        ? Container(height: 0, width: 0)
        : Container(
            child: Image.file(File(widget.imagePath ?? ''), fit: BoxFit.cover),
            width: widget.width,
            height: widget.height,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(10.0)));
  }
}
