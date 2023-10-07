import 'package:ecommercecourse/controller/categories/catedit_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/functions/validinput.dart';
import 'package:ecommercecourse/core/shared/custombutton.dart';
import 'package:ecommercecourse/core/shared/customtextform.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CategoriEdit extends StatelessWidget {
  const CategoriEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CategoriesEditController controller = Get.put(CategoriesEditController());

    return Scaffold(
      appBar: AppBar(title: const Text("Edit categories")),
      body: GetBuilder<CategoriesEditController>(
          builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest!,
                widget: Container(
                    padding: EdgeInsets.all(10),
                    child: Form(
                      key: controller.formState,
                      child: ListView(
                        children: [
                          CustomTextFormGlobal(
                            hinttext: 'category name',
                            labeltext: 'category name',
                            iconData: Icons.category,
                            mycontroller: controller.name,
                            valid: (val) {
                              return validInput(val!, 1, 35, "");
                            },
                            isNumber: false,
                          ),
                          CustomTextFormGlobal(
                            hinttext: 'category name (arabic)',
                            labeltext: 'category name (arabic)',
                            iconData: Icons.category,
                            mycontroller: controller.namear,
                            valid: (val) {
                              return validInput(val!, 1, 35, "");
                            },
                            isNumber: false,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: MaterialButton(
                              color: AppColor.thirdColor,
                              textColor: AppColor.secondColor,
                              onPressed: () {
                                controller.chooseImage();
                              },
                              child: Text("choose category image"),
                            ),
                          ),
                          if (controller.file != null)
                            Image.file(controller.file!),
                          CustomButton(
                            text: "Save",
                            onPressed: () {
                              controller.editData();
                            },
                          )
                        ],
                      ),
                    )),
              )),
    );
  }
}
