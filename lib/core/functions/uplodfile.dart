import 'dart:io';

import 'package:ecommercecourse/core/constant/color.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:path/path.dart';

ImageUploadcamera() async {
  final PickedFile? file = await ImagePicker()
      .getImage(source: ImageSource.camera, imageQuality: 90);

  if (file != null) {
    return File(file.path);
  } else {
    return null;
  }
}

FileUploadgallery([issvg = false]) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: issvg
          ? ["svg", "SVG"]
          : ["png", "PNG", "jpg", "jpeg", "gif", "HEIC"]);
  if (result != null) {
    return File(result.files.single.path!);
  } else {
    return null;
  }
}

showbottommenu(ImageUploadcamera(), FileUploadgallery()) {
  Get.bottomSheet(Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(10),
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text(
                "إختار صورة",
                style: TextStyle(
                    fontSize: 22,
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            ListTile(
              onTap: () {
                ImageUploadcamera();
                Get.back();
              },
              leading: const Icon(
                Icons.camera_alt,
                size: 40,
              ),
              title:
                  const Text("صورة من الكميرا", style: TextStyle(fontSize: 20)),
            ),
            ListTile(
              onTap: () {
                FileUploadgallery();
                Get.back();
              },
              leading: const Icon(
                Icons.image,
                size: 40,
              ),
              title: const Text("صورة من الأستديو",
                  style: TextStyle(fontSize: 20)),
            )
          ],
        ),
      )));
}
