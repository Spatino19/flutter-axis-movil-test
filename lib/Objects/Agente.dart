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
