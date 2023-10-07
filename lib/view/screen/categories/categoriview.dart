import 'package:ecommercecourse/controller/categories/catview_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/linkapi.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CategoriView extends StatelessWidget {
  const CategoriView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("categories"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoute.catadd);
        },
        child: Icon(Icons.add),
      ),
      body: GetBuilder<CategoriesController>(
          builder: ((controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          controller.goToPageEdit(controller.data[index]);
                        },
                        child: Card(
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: Container(
                                    padding: EdgeInsets.all(4),
                                    child: Image.network(
                                        height: 80,
                                        "${AppLink.imagestCategories}/${controller.data[index].categoriesImage}"),
                                  )),
                              Expanded(
                                  flex: 3,
                                  child: ListTile(
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.delete_outline),
                                          onPressed: () {
                                            Get.defaultDialog(
                                                title: "تحذير",
                                                middleText:
                                                    "هل انت متأكد من عملية الحذف ",
                                                onCancel: () {},
                                                onConfirm: () {
                                                  controller.deleteCategory(
                                                      controller.data[index]
                                                          .categoriesId!,
                                                      controller.data[index]
                                                          .categoriesImage!);
                                                  Get.back();
                                                });
                                          },
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              controller.goToPageEdit(
                                                  controller.data[index]);
                                            },
                                            icon: Icon(Icons.edit))
                                      ],
                                    ),
                                    subtitle: Text(controller
                                        .data[index].categoriesDatetime!),
                                    title: Text(
                                        controller.data[index].categoriesName!),
                                  ))
                            ],
                          ),
                        ),
                      );
                    }),
              )))),
    );
  }
}
