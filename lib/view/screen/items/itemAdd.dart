import 'package:ecommercecourse/controller/items/itemadd_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/functions/validinput.dart';
import 'package:ecommercecourse/core/shared/CustomDropdownSearch.dart';
import 'package:ecommercecourse/core/shared/custombutton.dart';
import 'package:ecommercecourse/core/shared/customtextform.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ItemsAdd extends StatelessWidget {
  const ItemsAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ItemsAddController controller = Get.put(ItemsAddController());

    return Scaffold(
      appBar: AppBar(title: const Text("Add Items")),
      body: GetBuilder<ItemsAddController>(
          builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest!,
                widget: Container(
                    padding: EdgeInsets.all(10),
                    child: Form(
                      key: controller.formState,
                      child: ListView(
                        children: [
                          CustomTextFormGlobal(
                            hinttext: 'item name',
                            labeltext: 'item name',
                            iconData: Icons.category,
                            mycontroller: controller.name,
                            valid: (val) {
                              return validInput(val!, 1, 35, "");
                            },
                            isNumber: false,
                          ),
                          CustomTextFormGlobal(
                            hinttext: 'item name (arabic)',
                            labeltext: 'item name (arabic)',
                            iconData: Icons.category,
                            mycontroller: controller.namear,
                            valid: (val) {
                              return validInput(val!, 1, 35, "");
                            },
                            isNumber: false,
                          ),
                          CustomTextFormGlobal(
                            hinttext: 'item desc',
                            labeltext: 'item desc',
                            iconData: Icons.category,
                            mycontroller: controller.desc,
                            valid: (val) {
                              return validInput(val!, 1, 35, "");
                            },
                            isNumber: false,
                          ),
                          CustomTextFormGlobal(
                            hinttext: 'item desc (arabic)',
                            labeltext: 'item desc (arabic)',
                            iconData: Icons.category,
                            mycontroller: controller.descar,
                            valid: (val) {
                              return validInput(val!, 1, 35, "");
                            },
                            isNumber: false,
                          ),
                          CustomTextFormGlobal(
                            hinttext: 'price',
                            labeltext: 'price',
                            iconData: Icons.category,
                            mycontroller: controller.price,
                            valid: (val) {
                              return validInput(val!, 1, 35, "");
                            },
                            isNumber: true,
                          ),
                          CustomTextFormGlobal(
                            hinttext: 'count',
                            labeltext: 'count',
                            iconData: Icons.category,
                            mycontroller: controller.count,
                            valid: (val) {
                              return validInput(val!, 1, 35, "");
                            },
                            isNumber: true,
                          ),
                          CustomTextFormGlobal(
                            hinttext: 'discount',
                            labeltext: 'discount',
                            iconData: Icons.category,
                            mycontroller: controller.discount,
                            valid: (val) {
                              return validInput(val!, 1, 35, "");
                            },
                            isNumber: true,
                          ),
                          CustomDropdownSearch(
                              title: "choose category",
                              listdata: controller.dropdownlist,
                              dropdownselectname: controller.catname!,
                              dropdownselectid: controller.catid!),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: MaterialButton(
                              color: AppColor.thirdColor,
                              textColor: AppColor.secondColor,
                              onPressed: () {
                                //controller.showOptionImage();
                                controller.chooseImage();
                              },
                              child: Text("choose category image"),
                            ),
                          ),
                          if (controller.file != null)
                            Image.file(
                              controller.file!,
                              width: 100,
                              height: 100,
                            ),
                          CustomButton(
                            text: "Save",
                            onPressed: () {
                              controller.addData();
                            },
                          )
                        ],
                      ),
                    )),
              )),
    );
  }
}
