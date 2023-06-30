import 'consultas_rest/Resultado.dart';

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
    return Dispositivo(
        requiereApn: json['lsRequiereApn'],
        urlApn: json['lsUrlApn'],
        codError: resultado?.lsCodError,
        mensaje: resultado?.lsMensaje,
        wifi: json['lsWifi']);
  }
}
