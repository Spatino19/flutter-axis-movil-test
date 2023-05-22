import 'dart:convert' as convert;
import 'package:flutter_axis_movil/Constants/Constants.dart';
import 'package:flutter_axis_movil/Objects/Login/ObValidarUsuario.dart';
import 'package:http/http.dart' as http;

Future<ObValidarUsuario> fetchLogin() async {
  var url = Uri.http(Constants.ipLogin, '/apiAppInfracciones/api/validarLogin',
      {'q': '{http}'});
  var body =
      convert.jsonEncode({"psIdUsuario": "***REMOVED***", "psClave": "***REMOVED***"});
  Map<String, String> headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };
  // Await the http get response, then decode the json-formatted response.
  var response = await http.post(url, headers: headers, body: body);

  if (response.statusCode == 200) {
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    ObValidarUsuario res = ObValidarUsuario.fromJson(jsonResponse);
    return res;
  } else {
    throw Exception('Request failed with status: ${response.statusCode}.');
  }
}

void main() {
  print(fetchLogin());
}
