///Los datos del dispositivo donde está instalado AxisMovil.
class Dispositivo {
  String? requiereApn;
  String? urlApn;
  String? codError = '0';
  String? mensaje;
  String? wifi;

  Dispositivo(this.requiereApn, this.urlApn, this.codError, this.mensaje, this.wifi);
}
