import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_axis_movil/Requests/fetchLogin.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '../../Objects/Login/Sesion.dart';
import 'login_model.dart';

export 'login_model.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  late LoginModel _model;
  String? _deviceId;
  String? _version;

  void _getInfo() async {
    // Get device id
    String? _deviceId = await PlatformDeviceId.getDeviceId;
    String? _version = (await PackageInfo.fromPlatform()).version;

    // Update the UI
    setState(() {
      this._deviceId = _deviceId;
      this._version = _version;
    });
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _getInfo();
    _model = createModel(context, () => LoginModel());

    _model.usuarioFieldController ??= TextEditingController();
    _model.passwordFieldController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFF9FBFC),
        body: Material(
          color: FlutterFlowTheme.of(context).primaryBackground,
          child: Align(
            alignment: AlignmentDirectional(0, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).secondaryBackground,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.asset(
                                'assets/images/AXIS-logo-768x578.png',
                              ).image,
                            ),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 8,
                                color: Color(0x1917171C),
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ],
                            borderRadius: BorderRadius.circular(12),
                            shape: BoxShape.rectangle,
                          ),
                          alignment: AlignmentDirectional(0, 0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 32, 0, 0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 8,
                            color: Color(0x1917171C),
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          )
                        ],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Form(
                                key: _model.formKey,
                                autovalidateMode: AutovalidateMode.disabled,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        TextFormField(
                                          controller: _model.usuarioFieldController,
                                          onFieldSubmitted: (_) async {
                                            if (_model.formKey.currentState == null ||
                                                !_model.formKey.currentState!.validate()) {
                                              return;
                                            }
                                          },
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.normal,
                                                  lineHeight: 1.5,
                                                ),
                                            hintText: 'Usuario',
                                            hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                  fontFamily: 'Readex Pro',
                                                  color: Color(0xFF696E7C),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w300,
                                                  lineHeight: 1.5,
                                                ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: FlutterFlowTheme.of(context).alternate,
                                                width: 1,
                                              ),
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1,
                                              ),
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFFDA29B),
                                                width: 1,
                                              ),
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            focusedErrorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFFDA29B),
                                                width: 1,
                                              ),
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            contentPadding: EdgeInsetsDirectional.fromSTEB(14, 10, 14, 10),
                                          ),
                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                fontFamily: 'Readex Pro',
                                                color: FlutterFlowTheme.of(context).primaryText,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w300,
                                                lineHeight: 1.5,
                                              ),
                                          validator: _model.usuarioFieldControllerValidator.asValidator(context),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                                      child: TextFormField(
                                        controller: _model.passwordFieldController,
                                        obscureText: !_model.passwordFieldVisibility,
                                        decoration: InputDecoration(
                                          labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                fontFamily: 'Readex Pro',
                                                color: FlutterFlowTheme.of(context).primaryText,
                                                fontSize: 16,
                                                lineHeight: 1.5,
                                              ),
                                          hintText: 'Contraseña',
                                          hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                fontFamily: 'Readex Pro',
                                                color: Color(0xFF696E7C),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w300,
                                                lineHeight: 1.5,
                                              ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context).alternate,
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFFDA29B),
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFFDA29B),
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          contentPadding: EdgeInsetsDirectional.fromSTEB(14, 10, 14, 10),
                                          suffixIcon: InkWell(
                                            onTap: () => setState(
                                              () => _model.passwordFieldVisibility = !_model.passwordFieldVisibility,
                                            ),
                                            focusNode: FocusNode(skipTraversal: true),
                                            child: Icon(
                                              _model.passwordFieldVisibility
                                                  ? Icons.visibility_outlined
                                                  : Icons.visibility_off_outlined,
                                              color: FlutterFlowTheme.of(context).secondaryText,
                                              size: 16,
                                            ),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                              fontFamily: 'Readex Pro',
                                              color: FlutterFlowTheme.of(context).primaryText,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w300,
                                              lineHeight: 1.5,
                                            ),
                                        validator: _model.passwordFieldControllerValidator.asValidator(context),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          if (_model.formKey.currentState == null ||
                                              !_model.formKey.currentState!.validate()) {
                                            return;
                                          }
                                          try {
                                            var res = await fetchLogin(_model.usuarioFieldController.text,
                                                _model.passwordFieldController.text);

                                            if (res.loResultado!.lsCodError == '0') {
                                              SharedPreferences prefs = await SharedPreferences.getInstance();
                                              prefs.setString('DEVICE_ID', _deviceId!);
                                              prefs.setString('VERSION', _version!);
                                              prefs.setString('USUARIO', _model.usuarioFieldController.text);

                                              Sesion sesionActual = Sesion(res);
                                              prefs.setString('SESION', jsonEncode(sesionActual.toJson()));
                                              print(prefs.get("SESION"));

                                              //debug
                                              inspect(sesionActual);
                                              inspect(Sesion.fromJson(jsonDecode(prefs.get("SESION").toString())));

                                              context.pushNamed('HomePage');
                                            } else {
                                              throw Exception("${res.loResultado!.lsMensaje}.\n\n"
                                                  "Código de error: ${res.loResultado!.lsCodError}.");
                                            }
                                          } on Exception catch (e) {
                                            showDialog<String>(
                                              context: context,
                                              builder: (BuildContext context) => AlertDialog(
                                                title: const Text('Error de Inicio de Sesión'),
                                                content: Text(e.runtimeType.toString() == "_Exception"
                                                    ? e.toString().substring(11)
                                                    : e.toString()),
                                                actions: <Widget>[
                                                  TextButton(
                                                    onPressed: () => Navigator.pop(context, 'OK'),
                                                    child: const Text('OK'),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }
                                        },
                                        text: 'Ingresar',
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 44,
                                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                          iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                          color: Color(0xFF07539D),
                                          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                fontFamily: 'Readex Pro',
                                                color: Colors.white,
                                              ),
                                          elevation: 2,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                                child: SelectionArea(
                                    child: Text(
                                  'CAMBIAR CONTRASEÑA',
                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context).primary,
                                        fontWeight: FontWeight.w600,
                                      ),
                                  // TODO: Añadir funcionalidad a cambiar contraseña
                                )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.8, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                      child: Text(
                        'ID: $_deviceId\nVersion: $_version',
                        textAlign: TextAlign.right,
                        style: FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Outfit',
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
