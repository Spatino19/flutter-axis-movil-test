class Catalogo {
  int? idCatalogo;
  String? descripcion;
  int? orden;
  String? fechaUltModificacion;
  String? obligatorio;
  String? wifi;
  int? registros;

  Catalogo(
      {required this.idCatalogo,
      required this.descripcion,
      required this.orden,
      required this.fechaUltModificacion,
      required this.obligatorio,
      required this.wifi,
      required this.registros});

  factory Catalogo.fromJson(Map<String, dynamic> json) {
    return Catalogo(
        idCatalogo: json['liIdCatalogo'],
        descripcion: json['lsDescripcion'],
        orden: json['liOrden'],
        fechaUltModificacion: json['lsFechaUltModificacion'],
        obligatorio: json['lsObligatorio'],
        wifi: json['lsWifi'],
        registros: json['liRegistros']);
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['liIdCatalogo'] = this.idCatalogo;
    data['lsDescripcion'] = this.descripcion;
    data['liOrden'] = this.orden;
    data['lsFechaUltModificacion'] = this.fechaUltModificacion;
    data['lsObligatorio'] = this.obligatorio;
    data['lsWifi'] = this.wifi;
    data['liRegistros'] = this.registros;
    return data;
  }
}
