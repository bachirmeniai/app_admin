import 'dart:io';

import 'package:ecommercecourse/controller/categories/catview_controller.dart';
import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/functions/handingdatacontroller.dart';
import 'package:ecommercecourse/core/functions/uplodfile.dart';
import 'package:ecommercecourse/data/datasource/remote/categorise_data.dart';
import 'package:ecommercecourse/data/model/categoriesmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CategoriesEditController extends GetxController {
  CategoriesData categoriesData = CategoriesData(Get.find());

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController name;
  late TextEditingController namear;
  CategoriesModel? categoriesModel;

  late StatusRequest? statusRequest = StatusRequest.none;

  File? file;

  chooseImage() async {
    file = await FileUploadgallery(false);
    update();
  }

  editData() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      Map data = {
        "name": name.text,
        "namear": namear.text,
        "imageold": categoriesModel!.categoriesImage!,
        "id": categoriesModel!.categoriesId!.toString()
      };

      var response = await categoriesData.edit(data, file);

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
    categoriesModel = Get.arguments['categoriesModel'];
    name = TextEditingController();
    namear = TextEditingController();
    name.text = categoriesModel!.categoriesName!;
    namear.text = categoriesModel!.categoriesNamaAr!;

    super.onInit();
  }
}
