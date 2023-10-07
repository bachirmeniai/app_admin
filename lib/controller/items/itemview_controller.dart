import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/functions/handingdatacontroller.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/data/datasource/remote/items_data.dart';
import 'package:ecommercecourse/data/model/itemsmodel.dart';
import 'package:get/get.dart';

class ItemsController extends GetxController {
  ItemsData itemsData = ItemsData(Get.find());

  List<ItemsModel> data = [];

  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response =
        await itemsData.getData(myServices.sharedPreferences.getString("id")!);

    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List datalist = response['data'];
        data.addAll(datalist.map((e) => ItemsModel.fromJson(e)));

        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteItems(String id, String imagename) {
    itemsData.delete({"id": id, "imagename": imagename});
    data.removeWhere((element) => element.itemsId == id);
    update();
  }

  goToPageEdit(ItemsModel itemsModel) {
    Get.toNamed(AppRoute.itemedit, arguments: {"itemsModel": itemsModel});
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  myback() {
    Get.offAllNamed(AppRoute.homepage);
    return Future.value(false);
  }
}
