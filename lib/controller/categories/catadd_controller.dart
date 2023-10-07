import 'dart:io';

import 'package:ecommercecourse/controller/categories/catview_controller.dart';
import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/functions/handingdatacontroller.dart';
import 'package:ecommercecourse/core/functions/uplodfile.dart';
import 'package:ecommercecourse/data/datasource/remote/categorise_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CategoriesAddController extends GetxController {
  CategoriesData categoriesData = CategoriesData(Get.find());

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController name;
  late TextEditingController namear;

  late StatusRequest? statusRequest = StatusRequest.none;

  File? file;

  chooseImage() async {
    file = await FileUploadgallery(false);
    update();
  }

  addData() async {
    if (formState.currentState!.validate()) {
      if (file == null) Get.snackbar("warning", "please choose image");
      statusRequest = StatusRequest.loading;
      Map data = {"name": name.text, "namear": namear.text};

      var response = await categoriesData.add(data, file!);

      print("=============================== Controller $response ");

      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        //backend

        if (response['status'] == "success") {
          Get.offNamed(AppRoute.catview);
          CategoriesController c = Get.find();
          c.getData();
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    name = TextEditingController();
    namear = TextEditingController();
    super.onInit();
  }
}
