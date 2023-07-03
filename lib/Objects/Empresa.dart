import 'Oficina.dart';

class Empresa {
  String? idEmpresa;
  String? nombreEmpresa;
  String? mensaje1;
  String? mensaje2;
  String? mensajeOrd1;
  String? mensajeOrd2;
  String? logo;
  String? logoBn;
  String? logoAscii;
  String? etiquetaCoip;
  String? etiquetaOrd;
  Oficina? oficinas;

  Empresa(
      {required this.idEmpresa,
      this.nombreEmpresa,
      this.mensaje1,
      this.mensaje2,
      this.mensajeOrd1,
      this.mensajeOrd2,
      this.logo,
      this.logoBn,
      this.logoAscii,
      this.etiquetaCoip,
      this.etiquetaOrd,
      this.oficinas});

  factory Empresa.fromJson(Map<String, dynamic> json) => Empresa(
      idEmpresa: json['idEmpresa'],
      nombreEmpresa: json['nombreEmpresa'],
      mensaje1: json['mensaje1'],
      mensaje2: json['mensaje2'],
      mensajeOrd1: json['mensajeOrd1'],
      mensajeOrd2: json['mensajeOrd2'],
      logo: json['logo'],
      logoBn: json['logoBn'],
      logoAscii: json['logoAscii'],
      etiquetaCoip: json['etiquetaCoip'],
      etiquetaOrd: json['etiquetaOrd'],
      oficinas: json['oficinas']);

  Map<String, dynamic> toJson() => {
        'idEmpresa': idEmpresa,
        'nombreEmpresa': nombreEmpresa,
        'mensaje1': mensaje1,
        'mensaje2': mensaje2,
        'mensajeOrd1': mensajeOrd1,
        'mensajeOrd2': mensajeOrd2,
        'logo': logo,
        'logoBn': logoBn,
        'logoAscii': logoAscii,
        'etiquetaCoip': etiquetaCoip,
        'etiquetaOrd': etiquetaOrd,
        'oficinas': oficinas
      };
}
