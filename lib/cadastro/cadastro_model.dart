import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'cadastro_widget.dart' show CadastroWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CadastroModel extends FlutterFlowModel<CadastroWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for nome widget.
  TextEditingController? nomeController;
  String? Function(BuildContext, String?)? nomeControllerValidator;
  // State field(s) for apelido widget.
  TextEditingController? apelidoController;
  String? Function(BuildContext, String?)? apelidoControllerValidator;
  // State field(s) for email widget.
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  // State field(s) for senha widget.
  TextEditingController? senhaController;
  late bool senhaVisibility;
  String? Function(BuildContext, String?)? senhaControllerValidator;
  // State field(s) for senha2 widget.
  TextEditingController? senha2Controller;
  late bool senha2Visibility;
  String? Function(BuildContext, String?)? senha2ControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    senhaVisibility = false;
    senha2Visibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    nomeController?.dispose();
    apelidoController?.dispose();
    emailController?.dispose();
    senhaController?.dispose();
    senha2Controller?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
