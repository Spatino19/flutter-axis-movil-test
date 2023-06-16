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
}

class Empresa {}

class Agente {}

class Dispositivo {}

class Funcion {}
