import 'package:ecommercecourse/view/screen/orders/accepted.dart';
import 'package:ecommercecourse/view/screen/orders/archive.dart';
import 'package:ecommercecourse/view/screen/orders/pending.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OrderScreenController extends GetxController {
  changePage(int currentpage);
}

class OrderScreenControllerImp extends OrderScreenController {
  int currentpage = 0;

  List<Widget> listPage = [
    const OrdersPending(),
    const OrdersAccepted(),
    const OrdersArchiveView(),

    // const HomePage(),
  ];

  List bottomappbar = [
    {"title": "Pending", "icon": Icons.home},
    {"title": "Accepted", "icon": Icons.add_shopping_cart_outlined},
    {"title": "Archive", "icon": Icons.archive_outlined},
  ];

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}
