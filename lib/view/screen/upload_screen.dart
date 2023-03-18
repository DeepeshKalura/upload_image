import 'dart:io';

import 'package:flutter/material.dart';


class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  File? isImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: isImage == null ? const Icon(
              Icons.upload_file_outlined,
              size: 100,
            ) : Image.file(isImage!),
          )
        ],
      ),
    );
  }
}