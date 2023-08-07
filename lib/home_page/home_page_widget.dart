import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/foto_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().Aleterarnome = false;
      });
    });

    _model.textController1 ??= TextEditingController();
    _model.textController2 ??= TextEditingController();
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            print('FloatingActionButton pressed ...');
          },
          backgroundColor: Color(0xFF551A8B),
          icon: Icon(
            Icons.minimize_sharp,
            color: FlutterFlowTheme.of(context).primaryBtnText,
          ),
          elevation: 10.0,
          label: Text(
            FFLocalizations.of(context).getText(
              'z62llhpv' /* Ajuda */,
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Poppins',
                  fontSize: 20.0,
                  fontWeight: FontWeight.w800,
                ),
          ),
        ),
        drawer: Drawer(
          elevation: 16.0,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 4000.0,
                height: 20.0,
                decoration: BoxDecoration(
                  color: Color(0xFF551A8B),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.15, 0.05),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      GoRouter.of(context).prepareAuthEvent();
                      await authManager.signOut();
                      GoRouter.of(context).clearRedirectLocation();

                      context.goNamedAuth('login', context.mounted);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            context.pushNamed('perfil');
                          },
                          text: FFLocalizations.of(context).getText(
                            'avzu4nml' /* Minha Conta */,
                          ),
                          options: FFButtonOptions(
                            width: 230.0,
                            height: 60.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Poppins',
                                  color: Colors.black,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w900,
                                ),
                            elevation: 2.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: AuthUserStreamWidget(
                            builder: (context) => InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return GestureDetector(
                                      onTap: () => FocusScope.of(context)
                                          .requestFocus(_model.unfocusNode),
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: FotoWidget(),
                                      ),
                                    );
                                  },
                                ).then((value) => setState(() {}));
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(35.0),
                                child: Image.network(
                                  valueOrDefault<String>(
                                    currentUserPhoto,
                                    'https://i.im.ge/2023/04/05/Ix5JNx.baixados.png',
                                  ),
                                  width: 60.0,
                                  height: 60.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.2, -0.3),
                child: Container(
                  width: 400.0,
                  height: 55.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBtnText,
                  ),
                  alignment: AlignmentDirectional(-0.35, -0.050000000000000044),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 4000.0,
                          height: 10.0,
                          decoration: BoxDecoration(
                            color: Color(0xFF551A8B),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.55),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 10.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'k2ec3jp3' /* Categoria */,
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
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: TextFormField(
                        controller: _model.textController1,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.textController1',
                          Duration(milliseconds: 2000),
                          () => setState(() {}),
                        ),
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: FFLocalizations.of(context).getText(
                            'amxbainq' /* Pesquisa */,
                          ),
                          hintStyle: FlutterFlowTheme.of(context).bodySmall,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search_sharp,
                            size: 30.0,
                          ),
                          suffixIcon: _model.textController1!.text.isNotEmpty
                              ? InkWell(
                                  onTap: () async {
                                    _model.textController1?.clear();
                                    setState(() {});
                                  },
                                  child: Icon(
                                    Icons.clear,
                                    color: Color(0xFF757575),
                                    size: 28.0,
                                  ),
                                )
                              : null,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              fontSize: 14.0,
                              fontWeight: FontWeight.w900,
                            ),
                        validator: _model.textController1Validator
                            .asValidator(context),
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: AlignmentDirectional(-1.0, -0.6),
                child: FlutterFlowDropDown<String>(
                  controller: _model.dropDownValueController1 ??=
                      FormFieldController<String>(null),
                  options: [
                    FFLocalizations.of(context).getText(
                      '21u1prih' /* PlayStation */,
                    ),
                    FFLocalizations.of(context).getText(
                      '250z8yzy' /* Xbox */,
                    ),
                    FFLocalizations.of(context).getText(
                      'mq0chn5i' /* Nintendo */,
                    )
                  ],
                  onChanged: (val) =>
                      setState(() => _model.dropDownValue1 = val),
                  width: 180.0,
                  height: 50.0,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontSize: 25.0,
                        fontWeight: FontWeight.w800,
                      ),
                  hintText: FFLocalizations.of(context).getText(
                    '8y0uigl8' /* Console */,
                  ),
                  icon: Icon(
                    Icons.arrow_drop_down_outlined,
                    size: 29.0,
                  ),
                  fillColor: Colors.white,
                  elevation: 2.0,
                  borderColor: Colors.transparent,
                  borderWidth: 0.0,
                  borderRadius: 0.0,
                  margin: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                  hidesUnderline: true,
                  isSearchable: false,
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: FlutterFlowDropDown<String>(
                  controller: _model.dropDownValueController2 ??=
                      FormFieldController<String>(null),
                  options: [
                    FFLocalizations.of(context).getText(
                      '4oydp6co' /* Relogio */,
                    ),
                    FFLocalizations.of(context).getText(
                      'v6jysof1' /* Relogio 02 */,
                    ),
                    FFLocalizations.of(context).getText(
                      'rt84itn7' /* Relogio 03 */,
                    )
                  ],
                  onChanged: (val) =>
                      setState(() => _model.dropDownValue2 = val),
                  width: 180.0,
                  height: 50.0,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontSize: 25.0,
                        fontWeight: FontWeight.w800,
                      ),
                  hintText: FFLocalizations.of(context).getText(
                    'qf34qb3w' /* Relogio */,
                  ),
                  icon: Icon(
                    Icons.arrow_drop_down_outlined,
                    size: 29.0,
                  ),
                  fillColor: Colors.white,
                  elevation: 2.0,
                  borderColor: Colors.transparent,
                  borderWidth: 0.0,
                  borderRadius: 0.0,
                  margin: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                  hidesUnderline: true,
                  isSearchable: false,
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: FlutterFlowDropDown<String>(
                  controller: _model.dropDownValueController3 ??=
                      FormFieldController<String>(null),
                  options: [
                    FFLocalizations.of(context).getText(
                      's9zinxw3' /* computador */,
                    ),
                    FFLocalizations.of(context).getText(
                      'gtph7r96' /* Computador01 */,
                    ),
                    FFLocalizations.of(context).getText(
                      'rg2xpjzd' /* Computado02 */,
                    )
                  ],
                  onChanged: (val) =>
                      setState(() => _model.dropDownValue3 = val),
                  width: 180.0,
                  height: 50.0,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontSize: 25.0,
                        fontWeight: FontWeight.w800,
                      ),
                  hintText: FFLocalizations.of(context).getText(
                    'o33ducd4' /* Pc */,
                  ),
                  icon: Icon(
                    Icons.arrow_drop_down_outlined,
                    size: 29.0,
                  ),
                  fillColor: Colors.white,
                  elevation: 2.0,
                  borderColor: Colors.transparent,
                  borderWidth: 0.0,
                  borderRadius: 0.0,
                  margin: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                  hidesUnderline: true,
                  isSearchable: false,
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: FlutterFlowDropDown<String>(
                  controller: _model.dropDownValueController4 ??=
                      FormFieldController<String>(null),
                  options: [
                    FFLocalizations.of(context).getText(
                      'lba2q6v7' /* Option 1 */,
                    ),
                    FFLocalizations.of(context).getText(
                      'l73ui8eb' /* cam01 */,
                    ),
                    FFLocalizations.of(context).getText(
                      'csdhx4mz' /* cam02 */,
                    )
                  ],
                  onChanged: (val) =>
                      setState(() => _model.dropDownValue4 = val),
                  width: 180.0,
                  height: 50.0,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontSize: 25.0,
                        fontWeight: FontWeight.w800,
                      ),
                  hintText: FFLocalizations.of(context).getText(
                    'u2zvchiy' /* Camera */,
                  ),
                  icon: Icon(
                    Icons.arrow_drop_down_outlined,
                    size: 29.0,
                  ),
                  fillColor: Colors.white,
                  elevation: 2.0,
                  borderColor: Colors.transparent,
                  borderWidth: 0.0,
                  borderRadius: 0.0,
                  margin: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                  hidesUnderline: true,
                  isSearchable: false,
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: FlutterFlowDropDown<String>(
                  controller: _model.dropDownValueController5 ??=
                      FormFieldController<String>(null),
                  options: [
                    FFLocalizations.of(context).getText(
                      '1aafjglf' /* Option 1 */,
                    ),
                    FFLocalizations.of(context).getText(
                      'g0bara0q' /* Celular */,
                    ),
                    FFLocalizations.of(context).getText(
                      'cylis2xq' /* Celular */,
                    )
                  ],
                  onChanged: (val) =>
                      setState(() => _model.dropDownValue5 = val),
                  width: 180.0,
                  height: 50.0,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontSize: 25.0,
                        fontWeight: FontWeight.w800,
                      ),
                  hintText: FFLocalizations.of(context).getText(
                    'oomep6og' /* Celular */,
                  ),
                  icon: Icon(
                    Icons.arrow_drop_down_outlined,
                    size: 29.0,
                  ),
                  fillColor: Colors.white,
                  elevation: 2.0,
                  borderColor: Colors.transparent,
                  borderWidth: 0.0,
                  borderRadius: 0.0,
                  margin: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                  hidesUnderline: true,
                  isSearchable: false,
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: FlutterFlowDropDown<String>(
                  controller: _model.dropDownValueController6 ??=
                      FormFieldController<String>(null),
                  options: [
                    FFLocalizations.of(context).getText(
                      'viq4n6y2' /* Option 1 */,
                    ),
                    FFLocalizations.of(context).getText(
                      'x2a79482' /* Televisao */,
                    ),
                    FFLocalizations.of(context).getText(
                      'fw6tqi5l' /* Televisao */,
                    )
                  ],
                  onChanged: (val) =>
                      setState(() => _model.dropDownValue6 = val),
                  width: 180.0,
                  height: 50.0,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontSize: 25.0,
                        fontWeight: FontWeight.w800,
                      ),
                  hintText: FFLocalizations.of(context).getText(
                    'gmct3c11' /* Tv */,
                  ),
                  icon: Icon(
                    Icons.arrow_drop_down_outlined,
                    size: 29.0,
                  ),
                  fillColor: Colors.white,
                  elevation: 2.0,
                  borderColor: Colors.transparent,
                  borderWidth: 0.0,
                  borderRadius: 0.0,
                  margin: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                  hidesUnderline: true,
                  isSearchable: false,
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: FlutterFlowDropDown<String>(
                  controller: _model.dropDownValueController7 ??=
                      FormFieldController<String>(null),
                  options: [
                    FFLocalizations.of(context).getText(
                      'oyl1zm30' /* Option 1 */,
                    ),
                    FFLocalizations.of(context).getText(
                      'wztck8lm' /* Fones01 */,
                    ),
                    FFLocalizations.of(context).getText(
                      'xo5268h0' /* Fones02 */,
                    )
                  ],
                  onChanged: (val) =>
                      setState(() => _model.dropDownValue7 = val),
                  width: 180.0,
                  height: 50.0,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontSize: 25.0,
                        fontWeight: FontWeight.w800,
                      ),
                  hintText: FFLocalizations.of(context).getText(
                    '99jqx0sx' /* Fones */,
                  ),
                  icon: Icon(
                    Icons.arrow_drop_down_outlined,
                    size: 29.0,
                  ),
                  fillColor: Colors.white,
                  elevation: 2.0,
                  borderColor: Colors.transparent,
                  borderWidth: 0.0,
                  borderRadius: 0.0,
                  margin: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                  hidesUnderline: true,
                  isSearchable: false,
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: FlutterFlowDropDown<String>(
                  controller: _model.dropDownValueController8 ??=
                      FormFieldController<String>(null),
                  options: [
                    FFLocalizations.of(context).getText(
                      'dl4wmpet' /* Option 1 */,
                    ),
                    FFLocalizations.of(context).getText(
                      'dfl5inui' /* Eletrodomestico */,
                    ),
                    FFLocalizations.of(context).getText(
                      'jk3j6toq' /* Eletrodomestico */,
                    )
                  ],
                  onChanged: (val) =>
                      setState(() => _model.dropDownValue8 = val),
                  width: 180.0,
                  height: 50.0,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontSize: 25.0,
                        fontWeight: FontWeight.w800,
                      ),
                  hintText: FFLocalizations.of(context).getText(
                    '74d6xg89' /* Domestico */,
                  ),
                  icon: Icon(
                    Icons.arrow_drop_down_outlined,
                    size: 29.0,
                  ),
                  fillColor: Colors.white,
                  elevation: 2.0,
                  borderColor: Colors.transparent,
                  borderWidth: 0.0,
                  borderRadius: 0.0,
                  margin: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                  hidesUnderline: true,
                  isSearchable: false,
                ),
              ),
              Container(
                width: 400.0,
                height: 200.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).lineColor,
                ),
                child: Align(
                  alignment: AlignmentDirectional(-0.6, -0.75),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-0.35, -0.55),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              9.0, 0.0, 0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'y1six6fm' /* Rede social */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w900,
                                ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-0.05, -0.15),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-0.15, -0.65),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30.0,
                                borderWidth: 1.0,
                                buttonSize: 60.0,
                                icon: FaIcon(
                                  FontAwesomeIcons.instagram,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 30.0,
                                ),
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, -0.15),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, -0.65),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30.0,
                                borderWidth: 1.0,
                                buttonSize: 60.0,
                                icon: FaIcon(
                                  FontAwesomeIcons.facebook,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 30.0,
                                ),
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Color(0xFF551A8B),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.menu_rounded,
              color: FlutterFlowTheme.of(context).secondaryBackground,
              size: 30.0,
            ),
            onPressed: () async {
              scaffoldKey.currentState!.openDrawer();
            },
          ),
          title: Align(
            alignment: AlignmentDirectional(-0.4, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  '5vxf8d4q' /* tech zoom */,
                ),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      fontSize: 28.0,
                      fontWeight: FontWeight.w900,
                    ),
              ),
            ),
          ),
          actions: [
            FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.brightness_5,
                color: FlutterFlowTheme.of(context).secondaryBackground,
                size: 40.0,
              ),
              onPressed: () async {
                context.pushNamed('configuracao');
              },
            ),
          ],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: ListView(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _model.textController2,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.textController2',
                            Duration(milliseconds: 2000),
                            () => setState(() {}),
                          ),
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: FFLocalizations.of(context).getText(
                              '9090gz5n' /* Pesquisa */,
                            ),
                            hintStyle: FlutterFlowTheme.of(context).bodySmall,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedErrorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.search,
                            ),
                            suffixIcon: _model.textController2!.text.isNotEmpty
                                ? InkWell(
                                    onTap: () async {
                                      _model.textController2?.clear();
                                      setState(() {});
                                    },
                                    child: Icon(
                                      Icons.clear,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 22.0,
                                    ),
                                  )
                                : null,
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                          validator: _model.textController2Validator
                              .asValidator(context),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 400.0,
                        height: 250.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Container(
                          width: double.infinity,
                          height: 500.0,
                          child: PageView(
                            controller: _model.pageViewController ??=
                                PageController(initialPage: 0),
                            scrollDirection: Axis.horizontal,
                            children: [
                              Image.asset(
                                'assets/images/1371504.jpg',
                                height: 250.0,
                                fit: BoxFit.cover,
                              ),
                              Image.network(
                                'https://picsum.photos/seed/52/600',
                                width: 100.0,
                                height: 100.0,
                                fit: BoxFit.cover,
                              ),
                              Image.network(
                                'https://picsum.photos/seed/156/600',
                                width: 100.0,
                                height: 100.0,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 0.0, 0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'ife553ei' /* Lançamentos */,
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodySmall.override(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w900,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 170.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: PagedListView<DocumentSnapshot<Object?>?,
                        ProdutosRecord>(
                      pagingController: _model.setListViewController2(
                        ProdutosRecord.collection,
                      ),
                      padding: EdgeInsets.zero,
                      reverse: false,
                      scrollDirection: Axis.horizontal,
                      builderDelegate:
                          PagedChildBuilderDelegate<ProdutosRecord>(
                        // Customize what your widget looks like when it's loading the first page.
                        firstPageProgressIndicatorBuilder: (_) => Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        ),
                        // Customize what your widget looks like when it's loading another page.
                        newPageProgressIndicatorBuilder: (_) => Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        ),

                        itemBuilder: (context, _, listViewIndex) {
                          final listViewProdutosRecord = _model
                              .listViewPagingController2!
                              .itemList![listViewIndex];
                          return Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 100.0,
                                height: 1500.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'resultado',
                                      queryParameters: {
                                        'resultado': serializeParam(
                                          listViewProdutosRecord.reference,
                                          ParamType.DocumentReference,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 5.0),
                                          child: FutureBuilder<
                                              List<ProdutosRecord>>(
                                            future: queryProdutosRecordOnce(
                                              singleRecord: true,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: CachedNetworkImage(
                                                    fadeInDuration: Duration(
                                                        milliseconds: 0),
                                                    fadeOutDuration: Duration(
                                                        milliseconds: 0),
                                                    imageUrl:
                                                        listViewProdutosRecord
                                                            .img,
                                                  ),
                                                );
                                              }
                                              List<ProdutosRecord>
                                                  imageProdutosRecordList =
                                                  snapshot.data!;
                                              // Return an empty Container when the item does not exist.
                                              if (snapshot.data!.isEmpty) {
                                                return Container();
                                              }
                                              final imageProdutosRecord =
                                                  imageProdutosRecordList
                                                          .isNotEmpty
                                                      ? imageProdutosRecordList
                                                          .first
                                                      : null;
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await imageProdutosRecord!
                                                      .reference
                                                      .update(
                                                          createProdutosRecordData(
                                                    img: imageProdutosRecord
                                                        ?.img,
                                                  ));

                                                  context
                                                      .pushNamed('resultado');
                                                },
                                                child: CachedNetworkImage(
                                                  fadeInDuration: Duration(
                                                      milliseconds: 500),
                                                  fadeOutDuration: Duration(
                                                      milliseconds: 500),
                                                  imageUrl:
                                                      listViewProdutosRecord
                                                          .img,
                                                  width: 100.0,
                                                  height: 100.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-0.15, -0.35),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 20.0, 0.0, 5.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await listViewProdutosRecord
                                                      .reference
                                                      .update(
                                                          createProdutosRecordData(
                                                    nome: listViewProdutosRecord
                                                        .nome,
                                                    marca: '',
                                                  ));

                                                  context
                                                      .pushNamed('resultado');
                                                },
                                                child: Text(
                                                  listViewProdutosRecord.nome,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w800,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-0.15, -0.35),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 20.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await listViewProdutosRecord
                                                      .reference
                                                      .update(
                                                          createProdutosRecordData(
                                                    marca:
                                                        listViewProdutosRecord
                                                            .marca,
                                                  ));

                                                  context
                                                      .pushNamed('resultado');
                                                },
                                                child: Text(
                                                  listViewProdutosRecord.marca,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w800,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 0.0, 0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'ztn3iqrd' /* Lançamentos */,
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodySmall.override(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w900,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 170.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
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
