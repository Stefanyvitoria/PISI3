import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

const defaultServer = ''; // insert server

const defaultHeaders = {
  HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
};

final APIRest apiRest = APIRest._();

class APIRest {
  APIRest._();

  bool isOk(http.Response response) {
    return response.statusCode >= 200 && response.statusCode < 300;
  }

  bool isFail(http.Response response) {
    return !isOk(response);
  }

  Future call(
      {String server = defaultServer,
      String path,
      Map<String, dynamic> params,
      Map<String, String> headers = defaultHeaders,
      Future process(json)
      }) async {
    var uri = Uri.https(server, path, params);
    var response = http.get(uri, headers: headers);

    var res = await response;
    if (isOk(res)) {
      return jsonDecode(res.body);
    } else {
      throw Exception('Failed to call the REST api.');
    }
  }
}
