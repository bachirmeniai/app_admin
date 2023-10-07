import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/middleware/mymiddleware.dart';
import 'package:ecommercecourse/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:ecommercecourse/view/screen/auth/login.dart';
import 'package:ecommercecourse/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:ecommercecourse/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:ecommercecourse/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:ecommercecourse/view/screen/categories/categoriesAdd.dart';
import 'package:ecommercecourse/view/screen/categories/categoriesEdit.dart';
import 'package:ecommercecourse/view/screen/categories/categoriview.dart';
import 'package:ecommercecourse/view/screen/home.dart';
import 'package:ecommercecourse/view/screen/items/itemAdd.dart';
import 'package:ecommercecourse/view/screen/items/itemEdit.dart';
import 'package:ecommercecourse/view/screen/items/itemview.dart';
import 'package:ecommercecourse/view/screen/orders/archive.dart';
import 'package:ecommercecourse/view/screen/orders/screen.dart';
import 'package:ecommercecourse/view/screen/language.dart';
import 'package:ecommercecourse/view/screen/orders/details.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),

  // GetPage(name: "/", page: () => const Language()),

//  Auth
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VerfiyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoute.successResetpassword,
      page: () => const SuccessResetPassword()),

//cat

  GetPage(name: AppRoute.catview, page: () => const CategoriView()),
  GetPage(name: AppRoute.catadd, page: () => const CategoriAdd()),
  GetPage(name: AppRoute.catedit, page: () => const CategoriEdit()),
  //items
  GetPage(name: AppRoute.itemview, page: () => const ItemsiView()),
  GetPage(name: AppRoute.itemadd, page: () => const ItemsAdd()),
  GetPage(name: AppRoute.itemedit, page: () => const ItemsEdit()),

  //orders
  GetPage(name: AppRoute.ordershome, page: () => const OrderScreen()),
  GetPage(name: AppRoute.ordersdetails, page: () => const OrdersDetails()),
  GetPage(name: AppRoute.ordersarchive, page: () => const OrdersArchiveView()),
  GetPage(name: AppRoute.homepage, page: () => const HomePage()),
];
