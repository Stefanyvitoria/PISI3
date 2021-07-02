import 'dart:convert';

import 'package:animecom/models/api_model.dart';

class DataBaseModel {
  select(Map send, String server, String path) async {
    var data = await apiRest.call(
      path: path,
      server: server,
      params: {"params": jsonEncode(send)},
    );

    return data['result'];
  }
}
