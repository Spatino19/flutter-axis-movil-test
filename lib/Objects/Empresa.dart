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

  Empresa(this.idEmpresa);

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
