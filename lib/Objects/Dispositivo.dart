import 'dart:developer';

import 'consultas_rest/resultado.dart';

///Los datos del dispositivo donde está instalado AxisMovil.
class Dispositivo {
  String? requiereApn;
  String? urlApn;
  String? codError;
  String? mensaje;
  String? wifi;

  Dispositivo({this.requiereApn, this.urlApn, this.codError, this.mensaje, this.wifi});

  factory Dispositivo.fromJson(Map<String, dynamic> json) {
    var resultado = json['loResultado'] != null ? Resultado.fromJson(json['loResultado']) : null;
    print(resultado?.lsCodError);
    return Dispositivo(
        requiereApn: json['lsRequiereApn'],
        urlApn: json['lsUrlApn'],
        codError: resultado?.lsCodError ?? json['lsCodError'],
        mensaje: resultado?.lsMensaje ?? json['lsMensaje'],
        wifi: json['lsWifi']);
  }

  Map<String, dynamic> toJson() => {
        'lsRequiereApn': requiereApn,
        'lsUrlApn': urlApn,
        'lsCodError': codError,
        'lsMensaje': mensaje,
        'lsWifi': wifi,
      };
}
