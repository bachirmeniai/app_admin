import 'dart:io';

import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:ecommercecourse/controller/items/itemview_controller.dart';
import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/functions/handingdatacontroller.dart';
import 'package:ecommercecourse/core/functions/uplodfile.dart';
import 'package:ecommercecourse/data/datasource/remote/items_data.dart';
import 'package:ecommercecourse/data/model/itemsmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ItemsEditController extends GetxController {
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
  String? active;
  ItemsModel? itemsModel;
  changesStatusActive(val) {
    active = val;
    update();
  }

  chooseImage() async {
    file = await FileUploadgallery(false);
    update();
  }

  editData() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      Map data = {
        "active": active,
        "imageold": itemsModel!.itemsImage,
        "id": itemsModel!.itemsId,
        "name": name.text,
        "namear": namear.text,
        " desc ": desc.text,
        " descar ": descar.text,
        " price ": price.text,
        "count": count.text,
        "discount": discount.text,
        "catid": catid!.text,
        "datenow": DateTime.now().toString()
      };

      var response = await itemsData.edit(data, file);

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

  @override
  void onInit() {
    itemsModel = Get.arguments['itemsModel'];
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
    name.text = itemsModel!.itemsName!;
    namear.text = itemsModel!.itemsNameAr!;

    desc.text = itemsModel!.itemsDesc!;
    descar.text = itemsModel!.itemsDescAr!;
    price.text = itemsModel!.itemsPrice!;
    count.text = itemsModel!.itemsCount!;
    discount.text = itemsModel!.itemsDiscount!;
    catid!.text = itemsModel!.categoriesId!;
    catname!.text = itemsModel!.categoriesName!;
    active = itemsModel!.itemsActive!;

    super.onInit();
  }
}
