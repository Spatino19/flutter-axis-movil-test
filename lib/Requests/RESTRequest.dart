import 'dart:convert' as convert;
import 'dart:convert';

import 'package:flutter_axis_movil/utils/Constants.dart';
import 'package:flutter_axis_movil/Objects/Dispositivo.dart';
import 'package:flutter_axis_movil/Objects/Login/RepuestaSesion.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_axis_movil/pages/login/login_widget.dart';

///Una recopilacion de metodos para hacer una llamada REST por http.
class RESTRequest {
  Uri? _url;
  Map<String, String> _headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };
  String? _body;

  Future<Map<String, dynamic>> _consultaRest(Uri url, String body,
      {String descripcion = "hacer la consulta", Map<String, String>? headers}) async {
    // Await the http get response, then decode the json-formatted response.
    final response = await http.post(url, headers: headers ?? this._headers, body: body);

    if (response.statusCode == 200) {
      return convert.jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
    } else {
      throw Exception('No se ha podido $descripcion.\n\nEstado: ${response.statusCode}.');
    }
  }

  ///Valida el inicio de sesion en la pantalla de [LoginWidget] por este [RESTRequest].
  ///
  ///Arroja una Excepción si el statusCode de la respuesta es 200.
  Future<RepuestaSesion> validarLogin(String psIdUsuario, String psClave) async {
    _url = Uri.http(Constants.apiIp, Constants.apiPath + 'validarLogin', {'q': '{http}'});
    _body = convert.jsonEncode({"psIdUsuario": psIdUsuario, "psClave": psClave});

    var jsonResponse = _consultaRest(_url!, _body!, descripcion: "iniciar sesion");
    RepuestaSesion res = RepuestaSesion.fromJson(await jsonResponse);
    return res;
  }

  Future<Dispositivo> retornarDatosDispositivo({required String? psIdEmpresa, required psIdDispositivo}) async {
    _url = Uri.http(Constants.apiIp, Constants.apiPath + 'retornarDatosDispositivo', {'q': '{http}'});
    _body = convert.jsonEncode({"psIdEmpresa": psIdEmpresa, "psIdDispositivo": psIdDispositivo});

    var jsonResponse = _consultaRest(_url!, _body!, descripcion: "retornar los datos del usuario");
    Dispositivo res = Dispositivo.fromJson(await jsonResponse);
    return res;
  }
}

void main() async {
  try {
    print((await RESTRequest().validarLogin("***REMOVED***", "***REMOVED***")).lsNombres);
  } on Exception catch (e) {
    print(e);
  }
}
