import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../widget/rounded_widget.dart';
import '../../controller/image_picker_controller.dart';


class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  File? isImage;
  final ImagePickerController _imagePickerController = ImagePickerController();
  String situationTextNotifier = 'Upload Your Document';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  const BoxDecoration(
       gradient: LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        stops: [0.0, 1.0],
        colors: [
          Color.fromARGB(255, 27, 26, 26),
          Colors.white,
        ],
      ),
    ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  height: 100,
                  width: 100,
                  margin: const EdgeInsets.all(10),
                  child: isImage == null ? const Icon(
                    Icons.upload_file_outlined,
                    size: 100,
                    color: Colors.white,
                  ) : Image.file(isImage!,),
                ),
              ),
                Text(situationTextNotifier),
              RoundedButtonWidget(
                onpressed: () { 
                  _imagePickerController.pickImage(ImageSource.gallery).then((value) {
                    setState(() {
                      isImage = value;
                      situationTextNotifier = 'Image Selected';
                    });
                  });
                },
              
                width: MediaQuery.of(context).size.width * 0.8,
                buttonText: 'Slected',
                // child: const Text('Select'),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}