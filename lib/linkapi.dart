class AppLink {
  static const String server = "http://fisaaaaaa.com/yemen";
  static const String imageststatic = "http://fisaaaaaa.com/ecommerce/upload";
//========================== Image ============================
  static const String imagestCategories = "$imageststatic/categories";
  static const String imagestItems = "$imageststatic/items";
// =============================================================
//
  static const String test = "$server/test.php";
  static const String notification = "$server/notification.php";

// ================================= Auth ========================== //

  static const String signUp = "$server/admin/auth/signup.php";
  static const String login = "$server/admin/auth/login.php";
  //static const String login = "$server/admin/auth/s.php";

  static const String verifycodessignup = "$server/admin/auth/verfiycode.php";

// ================================= ForgetPassword ========================== //

  static const String checkEmail =
      "$server/admin/forgetpassword/checkemail.php";
  static const String resetPassword =
      "$server/admin/forgetpassword/resetpassword.php";
  static const String verifycodeforgetpassword =
      "$server/admin/forgetpassword/verifycode.php";

// =================================home orders========================== //

  static const String prepare = "$server/admin/orders/prepare.php";
  static const String ordersarchive = "$server/admin/orders/archive.php";
  static const String viewacceptedOrders =
      "$server/admin/orders/viewaccepted.php";
  static const String ordersdetails = "$server/admin/orders/details.php";

  static const String approveOrder = "$server/admin/orders/approve.php";

  static const String viewpendingOrders =
      "$server/admin/orders/viewpending.php";

  //Category

  static const String catview = "$server/admin/categories/view.php";
  static const String catadd = "$server/admin/categories/add.php";
  static const String catedit = "$server/admin/categories/edit.php";
  static const String catdelite = "$server/admin/categories/delete.php";

  //items

  static const String itemadd = "$server/admin/items/add.php";
  static const String itemview = "$server/admin/items/view.php";
  static const String itemedit = "$server/admin/items/edit.php";
  static const String itemdelete = "$server/admin/items/delete.php";
}
