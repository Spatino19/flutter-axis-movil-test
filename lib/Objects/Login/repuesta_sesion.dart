import '../catalogo.dart';
import '../consultas_rest/resultado.dart';

class RepuestaSesion {
  String? lsIdEmpresa;
  String? lsIdOficina;
  int? liIdAgente;
  String? lsNombres;
  int? liIdSesion;
  List<Catalogo>? lcCatalogos;
  Resultado? loResultado;
  String? lsIdUsuario;
  String? lsFecha;

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
    loResultado = json['loResultado'] != null ? Resultado.fromJson(json['loResultado']) : null;
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
