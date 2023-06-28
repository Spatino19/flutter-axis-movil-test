import '../Catalogo.dart';

class RepuestaSesion {
  String? lsIdEmpresa;
  String? lsIdOficina;
  int? liIdAgente;
  String? lsNombres;
  int? liIdSesion;
  List<Catalogo>? lcCatalogos;
  LoResultado? loResultado;
  String? lsIdUsuario;

  RepuestaSesion(
      {this.lsIdEmpresa,
      this.lsIdOficina,
      this.liIdAgente,
      this.lsNombres,
      this.liIdSesion,
      this.lcCatalogos,
      this.loResultado,
      this.lsIdUsuario});

  RepuestaSesion.fromJson(Map<String, dynamic> json) {
    lsIdEmpresa = json['lsIdEmpresa'];
    lsIdOficina = json['lsIdOficina'];
    liIdAgente = json['liIdAgente'];
    lsNombres = json['lsNombres'];
    liIdSesion = json['liIdSesion'];
    if (json['lcCatalogos'] != null) {
      lcCatalogos = <Catalogo>[];
      for (final catalogoJson in json['lcCatalogos']) {
        lcCatalogos!.add(Catalogo.fromJson(catalogoJson));
      }
    }
    loResultado = json['loResultado'] != null ? LoResultado.fromJson(json['loResultado']) : null;
    lsIdUsuario = json['lsIdUsuario'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['lsIdEmpresa'] = this.lsIdEmpresa;
    data['lsIdOficina'] = this.lsIdOficina;
    data['liIdAgente'] = this.liIdAgente;
    data['lsNombres'] = this.lsNombres;
    data['liIdSesion'] = this.liIdSesion;
    if (this.lcCatalogos != null) {
      data['lcCatalogos'] = this.lcCatalogos!.map((v) => v.toJson()).toList();
    }
    if (this.loResultado != null) {
      data['loResultado'] = this.loResultado!.toJson();
    }
    data['lsIdUsuario'] = this.lsIdUsuario;
    return data;
  }
}

class LoResultado {
  String? lsCodError;
  String? lsMensaje;

  LoResultado({this.lsCodError, this.lsMensaje});

  LoResultado.fromJson(Map<String, dynamic> json) {
    lsCodError = json['lsCodError'];
    lsMensaje = json['lsMensaje'];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['lsCodError'] = this.lsCodError;
    if (this.lsMensaje != null) {
      data['lsMensaje'] = this.lsMensaje;
    }
    return data;
  }
}
