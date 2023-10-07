import 'package:ecommercecourse/view/widget/home/cardadmin.dart';
import 'package:ecommercecourse/view/widget/home/customtitlehome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class setting extends StatelessWidget {
  const setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      const CustomTitleHome(title: "hhhhhhhhhhhhh"),
      //  CustomCardHome(title: "A summer surprise", body: "Cashback 20%")
    ]);
  }
}
// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Get.put(HomeControllerImp());

//     return GetBuilder<HomeControllerImp>(
//         builder: (controller) => Container(
//             padding: const EdgeInsets.symmetric(horizontal: 15),
//             child: ListView(
//               children: [
//                 const CustomTitleHome(title: "Offer"),
//                 CustomCardHome(title: "A summer surprise", body: "Cashback 20%")
//               ],
//             )));
//   }
// }