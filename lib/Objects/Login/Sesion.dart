import 'ObInicioSesion.dart';

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

  Sesion(ObInicioSesion res) {
    this.catalogos = res.lcCatalogos;
    this.codError = res.loResultado?.lsCodError;
    this.idOficina = res.lsIdOficina;
    this.idSesion = res.liIdSesion;
    this.mensaje = res.loResultado?.lsMensaje;
    this.usuario = res.lsIdUsuario;
  }

  Sesion.fromJson(Map<String, dynamic> json) {
    if (json['catalogos'] != null) {
      catalogos = <Catalogo>[];
      for (final catalogoJson in json['catalogos']) {
        catalogos!.add(Catalogo.fromJson(catalogoJson));
      }
    }
    funciones = json['funciones'];
    idOficina = json['idOficina'];
    idSesion = json['idSesion'];
    codError = json['codError'];
    usuario = json['usuario'];
    mensaje = json['mensaje'];
    agente = json['agente'];
    empresa = json['agente'];
    dispositivo = json['dispositivo'];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    if (this.catalogos != null) {
      data['catalogos'] = this.catalogos!.map((v) => v.toJson()).toList();
    }
    data['funciones'] = this.funciones;
    data['idOficina'] = this.idOficina;
    data['idSesion'] = this.idSesion;
    data['codError'] = this.codError;
    data['usuario'] = this.usuario;
    data['mensaje'] = this.mensaje;
    data['agente'] = this.agente;
    data['empresa'] = this.empresa;
    data['dispositivo'] = this.dispositivo;
    return data;
  }
}

class Empresa {}

class Agente {}

class Dispositivo {}

class Funcion {}
