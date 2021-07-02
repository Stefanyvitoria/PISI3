import 'dart:convert';

import 'package:animecom/controllers/app_controller.dart';
import 'package:animecom/models/api_model.dart';

class DataBaseModel {
  Future<List> select(Map send, String path) async {
    var data = await apiRest.call(
      path: path,
      server: appController.getServer,
      params: {"params": jsonEncode(send)},
    );

    return data['result'];
  }

  call(String path, Map send) async {
    await apiRest.call(
      path: path,
      server: appController.getServer,
      params: {"params": jsonEncode(send)},
    );
  }
}
