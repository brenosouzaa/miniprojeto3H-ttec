import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'login_model.dart';
export 'login_model.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  late LoginModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      GoRouter.of(context).prepareAuthEvent();

      final user = await authManager.signInWithEmail(
        context,
        _model.emailAddressController.text,
        _model.passwordController.text,
      );
      if (user == null) {
        return;
      }

      context.goNamedAuth('HomePage', context.mounted);
    });

    _model.emailAddressController ??= TextEditingController();
    _model.passwordController ??= TextEditingController();
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
        backgroundColor: FlutterFlowTheme.of(context).lineColor,
        appBar: AppBar(
          backgroundColor: Color(0xFF551A8B),
          automaticallyImplyLeading: true,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_outlined,
              color: FlutterFlowTheme.of(context).primaryBtnText,
              size: 30.0,
            ),
            onPressed: () async {
              GoRouter.of(context).prepareAuthEvent();
              final user = await authManager.signInAnonymously(context);
              if (user == null) {
                return;
              }

              context.goNamedAuth('HomePage', context.mounted);
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'gh5ylvzd' /* Login */,
            ),
            style: FlutterFlowTheme.of(context).displaySmall.override(
                  fontFamily: 'Poppins',
                  color: FlutterFlowTheme.of(context).primaryBtnText,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w900,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 4.0,
        ),
        body: ListView(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(-0.65, -0.6),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-0.15, -0.25),
                          child: Container(
                            width: 60.0,
                            height: 60.0,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              'assets/images/processed_24607d74-ab33-41c0-b939-3aaf432f5199_63466a07d9a93.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.15, 0.0),
                          child: AutoSizeText(
                            FFLocalizations.of(context).getText(
                              '74pic22d' /* TECH ZOOM */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .displaySmall
                                .override(
                                  fontFamily: 'Poppins',
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w900,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 0.0),
                        child: TextFormField(
                          controller: _model.emailAddressController,
                          onFieldSubmitted: (_) async {
                            GoRouter.of(context).prepareAuthEvent();

                            final user = await authManager.signInWithEmail(
                              context,
                              _model.emailAddressController.text,
                              _model.passwordController.text,
                            );
                            if (user == null) {
                              return;
                            }

                            context.goNamedAuth('HomePage', context.mounted);
                          },
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: FFLocalizations.of(context).getText(
                              'kkgnqdcg' /* Email: */,
                            ),
                            labelStyle: FlutterFlowTheme.of(context).bodySmall,
                            hintStyle: FlutterFlowTheme.of(context).bodySmall,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 24.0, 20.0, 24.0),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF0F1113),
                                    fontWeight: FontWeight.w800,
                                  ),
                          keyboardType: TextInputType.emailAddress,
                          validator: _model.emailAddressControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 12.0, 20.0, 0.0),
                        child: TextFormField(
                          controller: _model.passwordController,
                          onFieldSubmitted: (_) async {
                            GoRouter.of(context).prepareAuthEvent();

                            final user = await authManager.signInWithEmail(
                              context,
                              _model.emailAddressController.text,
                              _model.passwordController.text,
                            );
                            if (user == null) {
                              return;
                            }

                            context.goNamedAuth('HomePage', context.mounted);
                          },
                          obscureText: !_model.passwordVisibility,
                          decoration: InputDecoration(
                            labelText: FFLocalizations.of(context).getText(
                              'cwm8kwlu' /* Senha: */,
                            ),
                            labelStyle: FlutterFlowTheme.of(context).bodySmall,
                            hintStyle: FlutterFlowTheme.of(context).bodySmall,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 24.0, 20.0, 24.0),
                            suffixIcon: InkWell(
                              onTap: () => setState(
                                () => _model.passwordVisibility =
                                    !_model.passwordVisibility,
                              ),
                              focusNode: FocusNode(skipTraversal: true),
                              child: Icon(
                                _model.passwordVisibility
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 20.0,
                              ),
                            ),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF0F1113),
                                    fontWeight: FontWeight.w900,
                                  ),
                          keyboardType: TextInputType.visiblePassword,
                          validator: _model.passwordControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                30.0, 5.0, 0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                if (_model
                                    .emailAddressController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Email required!',
                                      ),
                                    ),
                                  );
                                  return;
                                }
                                await authManager.resetPassword(
                                  email: _model.emailAddressController.text,
                                  context: context,
                                );
                              },
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '7k6ilrrp' /* Esqueceu a senha? */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF551A8B),
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.w800,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            GoRouter.of(context).prepareAuthEvent();

                            final user = await authManager.signInWithEmail(
                              context,
                              _model.emailAddressController.text,
                              _model.passwordController.text,
                            );
                            if (user == null) {
                              return;
                            }

                            context.pushNamedAuth('HomePage', context.mounted);
                          },
                          text: FFLocalizations.of(context).getText(
                            'k20059yd' /* Entrar */,
                          ),
                          options: FFButtonOptions(
                            width: 230.0,
                            height: 50.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Colors.white,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF551A8B),
                                  fontSize: 19.0,
                                  fontWeight: FontWeight.w800,
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            context.pushNamed('cadastro');
                          },
                          text: FFLocalizations.of(context).getText(
                            'o04yvtdl' /* Cadastrar */,
                          ),
                          options: FFButtonOptions(
                            width: 200.0,
                            height: 50.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Color(0xFF551A8B),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w800,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '7mq92bgt' /* usar rede social */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF551A8B),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-0.45, -0.35),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 8.0, 8.0, 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  GoRouter.of(context).prepareAuthEvent();
                                  final user = await authManager
                                      .signInWithGoogle(context);
                                  if (user == null) {
                                    return;
                                  }

                                  context.goNamedAuth(
                                      'HomePage', context.mounted);
                                },
                                child: Container(
                                  width: 50.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF551A8B),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 5.0,
                                        color: Color(0x3314181B),
                                        offset: Offset(0.0, 2.0),
                                      )
                                    ],
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Color(0xFF551A8B),
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: FaIcon(
                                    FontAwesomeIcons.google,
                                    color: Colors.white,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  GoRouter.of(context).prepareAuthEvent();
                                  final user = await authManager
                                      .signInWithApple(context);
                                  if (user == null) {
                                    return;
                                  }

                                  context.goNamedAuth(
                                      'HomePage', context.mounted);
                                },
                                child: Container(
                                  width: 50.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF551A8B),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 5.0,
                                        color: Color(0x3314181B),
                                        offset: Offset(0.0, 2.0),
                                      )
                                    ],
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Color(0xFF551A8B),
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: FaIcon(
                                    FontAwesomeIcons.apple,
                                    color: Colors.white,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  GoRouter.of(context).prepareAuthEvent();
                                  final user = await authManager
                                      .signInWithFacebook(context);
                                  if (user == null) {
                                    return;
                                  }

                                  context.goNamedAuth(
                                      'HomePage', context.mounted);
                                },
                                child: Container(
                                  width: 50.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF551A8B),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 5.0,
                                        color: Color(0x3314181B),
                                        offset: Offset(0.0, 2.0),
                                      )
                                    ],
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Color(0xFF551A8B),
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: FaIcon(
                                    FontAwesomeIcons.facebookF,
                                    color: Colors.white,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                              Container(
                                width: 50.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF551A8B),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 5.0,
                                      color: Color(0x3314181B),
                                      offset: Offset(0.0, 2.0),
                                    )
                                  ],
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Color(0xFF551A8B),
                                  ),
                                ),
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Icon(
                                  Icons.phone_sharp,
                                  color: Colors.white,
                                  size: 24.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
