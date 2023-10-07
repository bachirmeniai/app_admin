import 'package:ecommercecourse/core/class/crud.dart';
import 'package:ecommercecourse/linkapi.dart';

class OrdersAcceptedData {
  Crud crud;
  OrdersAcceptedData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.viewacceptedOrders, {});
    return response.fold((l) => l, (r) => r);
  }

  donePreper(String ordersid, String userid, String orderstype) async {
    var response = await crud.postData(AppLink.prepare,
        {"ordersid": ordersid, "usersid": userid, "orderstype": orderstype});
    return response.fold((l) => l, (r) => r);
  }
}
