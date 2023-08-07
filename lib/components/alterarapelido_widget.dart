import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'alterarapelido_model.dart';
export 'alterarapelido_model.dart';

class AlterarapelidoWidget extends StatefulWidget {
  const AlterarapelidoWidget({Key? key}) : super(key: key);

  @override
  _AlterarapelidoWidgetState createState() => _AlterarapelidoWidgetState();
}

class _AlterarapelidoWidgetState extends State<AlterarapelidoWidget> {
  late AlterarapelidoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AlterarapelidoModel());

    _model.textController ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          setState(() {
            FFAppState().Aleterarnome = false;
          });
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 30.0),
                child: TextFormField(
                  controller: _model.textController,
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: FFLocalizations.of(context).getText(
                      'vgrubc74' /* Alterar seu apelido: */,
                    ),
                    hintStyle: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'Poppins',
                          fontSize: 18.0,
                          fontWeight: FontWeight.w800,
                        ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Poppins',
                        fontSize: 18.0,
                        fontWeight: FontWeight.w800,
                      ),
                  validator:
                      _model.textControllerValidator.asValidator(context),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        setState(() {
                          FFAppState().Aleterarnome = true;
                        });

                        context.pushNamed('conta01');
                      },
                      text: FFLocalizations.of(context).getText(
                        'i39e4tp2' /* Cancelar */,
                      ),
                      options: FFButtonOptions(
                        width: 150.0,
                        height: 60.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).lineColor,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF551A8B),
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w800,
                                ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        await currentUserReference!
                            .update(createUsersRecordData(
                          apelido: '',
                        ));

                        context.pushNamed('conta01');
                      },
                      text: FFLocalizations.of(context).getText(
                        'nvo6y0w8' /* Confirmar */,
                      ),
                      options: FFButtonOptions(
                        width: 150.0,
                        height: 60.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w800,
                                ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
