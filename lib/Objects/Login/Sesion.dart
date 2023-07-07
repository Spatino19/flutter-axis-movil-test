import '../agente.dart';
import '../catalogo.dart';
import '../dispositivo.dart';
import '../empresa.dart';
import '../funcion.dart';
import 'repuesta_sesion.dart';

/// Los datos de una sesión en concreto desde que se inició sesión.
class Sesion {
  List<Catalogo>? catalogos;
  List<Funcion>? funciones;

  String? idOficina;
  int? idSesion;
  String? codError;
  String? usuario;
  String? mensaje;

  Agente? agente;
  Empresa? empresa;
  Dispositivo? dispositivo;

  late final DateTime? fecha;

  Sesion(RepuestaSesion res) {
    catalogos = res.lcCatalogos;
    codError = res.loResultado?.lsCodError;
    idOficina = res.lsIdOficina;
    idSesion = res.liIdSesion;
    mensaje = res.loResultado?.lsMensaje;
    empresa = Empresa(idEmpresa: res.lsIdEmpresa);
    agente = Agente(idAgente: res.liIdAgente, nombre: res.lsNombres, idUsuario: res.lsIdUsuario);
    fecha = DateTime.now();
  }

  ///Transfiere los datos de un JSON decodificado a esta [Sesion].
  Sesion.fromJson(Map<String, dynamic> json) {
    if (json['lcCatalogos'] != null) {
      catalogos = <Catalogo>[];
      for (final catalogoJson in json['lcCatalogos']) {
        catalogos?.add(Catalogo.fromJson(catalogoJson));
      }
    }
    funciones = json['lcFunciones'];
    idOficina = json['lsIdOficina'];
    idSesion = json['liIdSesion'];
    codError = json['lsCodError'];
    usuario = json['lsUsuario'];
    mensaje = json['lsMensaje'];
    agente = json['loAgente'] != null ? Agente.fromJson(json['loAgente']) : null;
    empresa = json['loEmpresa'] != null ? Empresa.fromJson(json['loEmpresa']) : null;
    dispositivo = json['loDispositivo'] != null ? Dispositivo.fromJson(json['loDispositivo']) : null;
    fecha = DateTime.parse(json['loFecha']);
  }

  ///Una representación JSON (decodificado) de esta [Sesion].
  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    if (this.catalogos != null) {
      data['lcCatalogos'] = this.catalogos!.map((catalogo) => catalogo.toJson()).toList();
    }
    data['lcFunciones'] = this.funciones;
    data['lsIdOficina'] = this.idOficina;
    data['liIdSesion'] = this.idSesion;
    data['lsCodError'] = this.codError;
    data['lsUsuario'] = this.usuario;
    data['lsMensaje'] = this.mensaje;
    data['loAgente'] = this.agente?.toJson();
    data['loEmpresa'] = this.empresa?.toJson();
    data['loDispositivo'] = this.dispositivo?.toJson();
    data['loFecha'] = this.fecha.toString();
    return data;
  }
}
