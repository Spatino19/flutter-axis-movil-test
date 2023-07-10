import 'dart:convert' as convert;
import 'dart:convert';

import 'package:flutter_axis_movil/utils/constants.dart';
import 'package:flutter_axis_movil/objects/dispositivo.dart';
import 'package:flutter_axis_movil/objects/login/repuesta_sesion.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_axis_movil/pages/login/login_widget.dart';

///Una recopilacion de metodos para hacer una llamada REST por http.
///
///Arroja una Excepción si el statusCode de la respuesta no es 200.
class RESTRequest {
  static Uri? _url;
  static const Map<String, String> _headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };
  static String? _body;
  static http.Response? _response;

  static Future<Map<String, dynamic>> _consultaRest(Uri url, String body,
      {String descripcion = "hacer la consulta", Map<String, String> headers = _headers}) async {
    //Usa los headers por defecto
    _response = await http.post(url, headers: headers, body: body);

    if (_response?.statusCode == 200) {
      return convert.jsonDecode(utf8.decode(_response!.bodyBytes)) as Map<String, dynamic>;
    } else {
      throw Exception('No se ha podido $descripcion.\n\nEstado: ${_response?.statusCode}.');
    }
  }

  ///Valida el inicio de sesion en la pantalla de [LoginWidget] por este [RESTRequest].
  static Future<RepuestaSesion> validarLogin(String psIdUsuario, String psClave) async {
    _url = Uri.http(Constants.apiIp, Constants.apiPath + 'validarLogin');
    _body = convert.jsonEncode({"psIdUsuario": psIdUsuario, "psClave": psClave});

    var jsonResponse = _consultaRest(_url!, _body!, descripcion: "iniciar sesion");
    RepuestaSesion res = RepuestaSesion.fromJson(await jsonResponse);
    res.lsFecha = _response?.headers['date'];
    return res;
  }

  ///Devuelve los datos del dispositivo actual en [Dispositivo] por este [RESTRequest].
  ///
  ///Requiere el id de la empresa y del dispositivo.
  static Future<Dispositivo> retornarDatosDispositivo({required String? psIdEmpresa, required psIdDispositivo}) async {
    _url = Uri.http(Constants.apiIp, Constants.apiPath + 'retornarDatosDispositivo');
    _body = convert.jsonEncode({"psIdEmpresa": psIdEmpresa, "psIdDispositivo": psIdDispositivo});

    var jsonResponse = _consultaRest(_url!, _body!, descripcion: "retornar los datos del usuario");
    Dispositivo res = Dispositivo.fromJson(await jsonResponse);
    return res;
  }
}

void main() async {
  try {
    print((await RESTRequest.validarLogin("***REMOVED***", "***REMOVED***")).lsNombres);
  } on Exception catch (e) {
    print(e);
  }
}
