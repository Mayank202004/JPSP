import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jpss/utils/env.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

import '../widets/confirmDialog.dart';



void showSnackBar(String title,String message){
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,
    colorText: Colors.white,
    backgroundColor: const Color(0xff252526),
    padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
    snackStyle: SnackStyle.GROUNDED,
    margin:  const EdgeInsets.all(0.0),

  );
}

// Open confirm dialog box
void confirmDialog(String title,String text,VoidCallback voidCallback){
  Get.dialog(DialogFb1(title: title,text: text,voidCallback: voidCallback));
}


// pick immage from gallary
Future<File?> pickImageFromGallary() async {
  const uuid = Uuid();
  final ImagePicker picker = ImagePicker();

  final XFile? file = await picker.pickImage(source: ImageSource.gallery);
  if(file == null) return null;
  final dir = Directory.systemTemp;
  final targetPath = "${dir.absolute.path}/${uuid.v4()}.jpg";
  File image = await compressImage(File(file.path), targetPath);

  return image;
}

// compress image file

Future<File> compressImage(File file, String targetPath) async {
  var result = await FlutterImageCompress.compressAndGetFile(file.path, targetPath, quality: 70);
  return File(result!.path);
}


void profileCompleteDialog() {
  Get.defaultDialog(
    title: "",
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.check_circle_outline, color: Colors.green, size: 60),
        const SizedBox(height: 10),
        const Text(
          "All Set!",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const Text(
          "All your form sections are filled.",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () => Get.back(),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
          child: const Text("Okay"),
        ),
      ],
    ),
  );
}
