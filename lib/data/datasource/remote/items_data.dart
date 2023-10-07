import 'dart:io';

import 'package:ecommercecourse/core/class/crud.dart';
import 'package:ecommercecourse/linkapi.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);
  getData(String id) async {
    var response = await crud.postData(AppLink.itemview, {"id": id});
    return response.fold((l) => l, (r) => r);
  }

  add(Map data, File file) async {
    var response =
        await crud.addRequestWithImageOne(AppLink.itemadd, data, file);
    return response.fold((l) => l, (r) => r);
  }

  edit(Map data, [File? file]) async {
    var response;
    if (file == null) {
      response = await crud.postData(AppLink.itemedit, data);
    } else {
      response =
          await crud.addRequestWithImageOne(AppLink.itemedit, data, file);
    }

    return response.fold((l) => l, (r) => r);
  }

  delete(Map data) async {
    var response = await crud.postData(AppLink.itemdelete, data);
    return response.fold((l) => l, (r) => r);
  }
}
