import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/functions/handingdatacontroller.dart';
import 'package:ecommercecourse/data/datasource/remote/categorise_data.dart';
import 'package:ecommercecourse/data/model/categoriesmodel.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController {
  CategoriesData categoriesData = CategoriesData(Get.find());

  List<CategoriesModel> data = [];

  late StatusRequest statusRequest;

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await categoriesData.getData();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List datalist = response['data'];
        data.addAll(datalist.map((e) => CategoriesModel.fromJson(e)));

        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteCategory(String id, String imagename) {
    categoriesData.delete({"id": id, "imagename": imagename});
    data.removeWhere((element) => element.categoriesId == id);
    update();
  }

  goToPageEdit(CategoriesModel categoriesModel) {
    Get.toNamed(AppRoute.catedit,
        arguments: {"categoriesModel": categoriesModel});
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
