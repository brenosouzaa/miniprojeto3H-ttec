import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'avaliacaoempresa_model.dart';
export 'avaliacaoempresa_model.dart';

class AvaliacaoempresaWidget extends StatefulWidget {
  const AvaliacaoempresaWidget({Key? key}) : super(key: key);

  @override
  _AvaliacaoempresaWidgetState createState() => _AvaliacaoempresaWidgetState();
}

class _AvaliacaoempresaWidgetState extends State<AvaliacaoempresaWidget> {
  late AvaliacaoempresaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AvaliacaoempresaModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryBtnText,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'aqm3c17p' /* Avalie a Empresa */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w900,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    '3e1khfx8' /* Por favor, avalie a empresa ab... */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).secondaryText,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlutterFlowIconButton(
                      borderRadius: 30.0,
                      buttonSize: 60.0,
                      icon: Icon(
                        Icons.star_border_rounded,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 40.0,
                      ),
                      onPressed: () {
                        print('IconButton pressed ...');
                      },
                    ),
                    FlutterFlowIconButton(
                      borderRadius: 30.0,
                      buttonSize: 60.0,
                      icon: Icon(
                        Icons.star_border_rounded,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 40.0,
                      ),
                      onPressed: () {
                        print('IconButton pressed ...');
                      },
                    ),
                    FlutterFlowIconButton(
                      borderRadius: 30.0,
                      buttonSize: 60.0,
                      icon: Icon(
                        Icons.star_border_rounded,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 40.0,
                      ),
                      onPressed: () {
                        print('IconButton pressed ...');
                      },
                    ),
                    FlutterFlowIconButton(
                      borderRadius: 30.0,
                      buttonSize: 60.0,
                      icon: Icon(
                        Icons.star_border_rounded,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 40.0,
                      ),
                      onPressed: () {
                        print('IconButton pressed ...');
                      },
                    ),
                    FlutterFlowIconButton(
                      borderRadius: 30.0,
                      buttonSize: 60.0,
                      icon: Icon(
                        Icons.star_border_rounded,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 40.0,
                      ),
                      onPressed: () {
                        print('IconButton pressed ...');
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                child: FFButtonWidget(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  text: FFLocalizations.of(context).getText(
                    'umvk590f' /* Enviar Avaliação */,
                  ),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 50.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle:
                        FlutterFlowTheme.of(context).titleMedium.override(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                            ),
                    elevation: 2.0,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
