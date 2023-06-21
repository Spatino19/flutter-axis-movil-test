import 'dart:convert' as convert;
import 'dart:convert';

import 'package:flutter_axis_movil/Constants/Constants.dart';
import 'package:flutter_axis_movil/Objects/Login/ObInicioSesion.dart';
import 'package:http/http.dart' as http;

Future<ObInicioSesion> fetchLogin(String psIdUsuario, String psClave) async {
  var url = Uri.http(Constants.ipLogin, '/apiAppInfracciones/api/validarLogin', {'q': '{http}'});
  var body = convert.jsonEncode({"psIdUsuario": psIdUsuario, "psClave": psClave});
  Map<String, String> headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  // Await the http get response, then decode the json-formatted response.
  final response = await http.post(url, headers: headers, body: body);

  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
    ObInicioSesion res = ObInicioSesion.fromJson(jsonResponse);
    return res;
  } else {
    throw Exception('No se ha podido iniciar sesión.\n\nEstado: ${response.statusCode}.');
  }
}

void main() async {
  try {
    print((await fetchLogin("***REMOVED***", "***REMOVED***")).lsNombres);
  } on Exception catch (e) {
    print(e);
  }
}
