import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for UsuarioField widget.
  TextEditingController? usuarioFieldController;
  String? Function(BuildContext, String?)? usuarioFieldControllerValidator;
  String? _usuarioFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Usuario Requerido';
    }

    if (!RegExp(kTextValidatorUsernameRegex).hasMatch(val)) {
      return 'Debe empezar por una letra y sólo puede contener letras, dígitos y "-" o "_".';
    }
    return null;
  }

  // State field(s) for PasswordField widget.
  TextEditingController? passwordFieldController;
  late bool passwordFieldVisibility;
  String? Function(BuildContext, String?)? passwordFieldControllerValidator;
  String? _passwordFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Contraseña requerida';
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    usuarioFieldControllerValidator = _usuarioFieldControllerValidator;
    passwordFieldVisibility = false;
    passwordFieldControllerValidator = _passwordFieldControllerValidator;
  }

  void dispose() {
    usuarioFieldController?.dispose();
    passwordFieldController?.dispose();
  }

  /// Additional helper methods are added here.
}
