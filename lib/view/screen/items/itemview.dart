import 'package:ecommercecourse/controller/items/itemview_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/linkapi.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ItemsiView extends StatelessWidget {
  const ItemsiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Items"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoute.itemadd);
        },
        child: Icon(Icons.add),
      ),
      body: GetBuilder<ItemsController>(
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
                                        "${AppLink.imagestItems}/${controller.data[index].itemsImage}"),
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
                                                  controller.deleteItems(
                                                      controller
                                                          .data[index].itemsId!,
                                                      controller.data[index]
                                                          .itemsImage!);
                                                  Get.back();
                                                });
                                          },
                                        ),
                                      ],
                                    ),
                                    //subtitle: Text(
                                    // controller.data[index].categoriesName!),
                                    title:
                                        Text(controller.data[index].itemsName!),
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
