import 'dart:io';

import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:ecommercecourse/controller/items/itemview_controller.dart';
import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/functions/handingdatacontroller.dart';
import 'package:ecommercecourse/core/functions/uplodfile.dart';
import 'package:ecommercecourse/data/datasource/remote/categorise_data.dart';
import 'package:ecommercecourse/data/datasource/remote/items_data.dart';
import 'package:ecommercecourse/data/model/categoriesmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ItemsAddController extends GetxController {
  ItemsData itemsData = ItemsData(Get.find());
  List<SelectedListItem> dropdownlist = [];

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController dropdownname;
  late TextEditingController dropdownid;
  TextEditingController? catid;
  TextEditingController? catname;

  late TextEditingController name;
  late TextEditingController namear;
  late TextEditingController desc;
  late TextEditingController descar;
  late TextEditingController count;
  late TextEditingController price;
  late TextEditingController discount;
  // String? catid;

  StatusRequest? statusRequest = StatusRequest.none;

  File? file;

  chooseImage() async {
    file = await FileUploadgallery(false);
    update();
  }
  // showOptionImage() {
  //   showbottommenu(ImageUploadcamera, FileUploadgallery);
  // }

  // chooseImageCamera() async {
  //   file = await ImageUploadcamera();
  //   update();
  // }

  // chooseImageGallery() async {
  //   file = await FileUploadgallery(false);
  //   update();
  // }

  addData() async {
    if (formState.currentState!.validate()) {
      if (file == null) Get.snackbar("warning", "please choose image");
      statusRequest = StatusRequest.loading;
      update();
      Map data = {
        "name": name.text,
        "namear": namear.text,
        "desc": desc.text,
        "descar": descar.text,
        "price": price.text,
        "count": count.text,
        "discount": discount.text,
        "catid": catid!.text,
        "datenow": DateTime.now().toString()
      };
      print("gggggggggggol");

      var response = await itemsData.add(data, file!);

      print("=============================== Controller $response ");

      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        //backend

        if (response['status'] == "success") {
          Get.offNamed(AppRoute.itemview);
          ItemsController c = Get.find();
          c.getData();
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  getCategories() async {
    CategoriesData categoriesData = CategoriesData(Get.find());

    statusRequest = StatusRequest.loading;

    update();

    var response = await categoriesData.getData();
    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List<CategoriesModel> data = [];

        List datalist = response['data'];
        data.addAll(datalist.map((e) => CategoriesModel.fromJson(e)));
        for (int i = 0; i < data.length; i++) {
          dropdownlist.add(SelectedListItem(
              name: data[i].categoriesName!, value: data[i].categoriesId));
        }

        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getCategories();
    name = TextEditingController();
    namear = TextEditingController();
    desc = TextEditingController();
    descar = TextEditingController();
    price = TextEditingController();
    count = TextEditingController();
    discount = TextEditingController();

    catid = TextEditingController();
    catname = TextEditingController();
    dropdownname = TextEditingController();
    dropdownid = TextEditingController();

    super.onInit();
  }
}
