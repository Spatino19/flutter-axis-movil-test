class Resultado {
  String? lsCodError;
  String? lsMensaje;

  Resultado({this.lsCodError, this.lsMensaje});

  Resultado.fromJson(Map<String, dynamic> json) {
    lsCodError = json['lsCodError'];
    lsMensaje = json['lsMensaje'] ?? json['lsError'];
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
