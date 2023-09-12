import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'conecteseans_model.dart';
export 'conecteseans_model.dart';

class ConecteseansWidget extends StatefulWidget {
  const ConecteseansWidget({Key? key}) : super(key: key);

  @override
  _ConecteseansWidgetState createState() => _ConecteseansWidgetState();
}

class _ConecteseansWidgetState extends State<ConecteseansWidget> {
  late ConecteseansModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConecteseansModel());

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
              'v9qslonz' /*  */,
            ),
            style: FlutterFlowTheme.of(context).titleMedium,
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
                child: Image.network(
                  'https://images.unsplash.com/photo-1671523435843-e3cd426c24e4?w=1280&h=720',
                  width: double.infinity,
                  height: 240.0,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 16.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'ezlo0eat' /* Conecte-se a nós */,
                  ),
                  style: FlutterFlowTheme.of(context).headlineLarge.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 0.0, 16.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'wqdpfsg6' /* Estamos aqui para ajudar. Entr... */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).secondaryText,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 16.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'pjifxxjb' /* Telefone: (XX) XXXX-XXXX */,
                  ),
                  style: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 16.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'fskcnl55' /* Email: suporte@exemplo.com */,
                  ),
                  style: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).primaryText,
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
