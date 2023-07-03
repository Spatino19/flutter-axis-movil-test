///Los datos de un agente (usuario).
class Agente {
  int? idAgente;
  String? idUsuario;
  String? cedula;
  String? nombre;
  String? firma;
  String? firmaAscii;
  String? etiquetaRrhh;
  String? idTipoRrhh;
  String? tipoRubro;
  String? codigoAgente;

  Agente(
      {this.idAgente,
      this.idUsuario,
      this.cedula,
      this.nombre,
      this.firma,
      this.etiquetaRrhh,
      this.idTipoRrhh,
      this.tipoRubro,
      this.codigoAgente});

  factory Agente.fromJson(Map<String, dynamic> json) => Agente(
      idAgente: json['idAgente'],
      idUsuario: json['idUsuario'],
      cedula: json['cedula'],
      nombre: json['nombre'],
      firma: json['firma'],
      etiquetaRrhh: json['etiquetaRrhh'],
      idTipoRrhh: json['idTipoRrhh'],
      tipoRubro: json['tipoRubro'],
      codigoAgente: json['codigoAgente']);

  Map<String, dynamic> toJson() => {
        'idAgente': idAgente,
        'idUsuario': idUsuario,
        'cedula': cedula,
        'nombre': nombre,
        'firma': firma,
        'firmaAscii': firmaAscii,
        'etiquetaRrhh': etiquetaRrhh,
        'idTipoRrhh': idTipoRrhh,
        'tipoRubro': tipoRubro,
        'codigoAgente': codigoAgente
      };
}
