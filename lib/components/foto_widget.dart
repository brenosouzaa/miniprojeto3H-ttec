import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'foto_model.dart';
export 'foto_model.dart';

class FotoWidget extends StatefulWidget {
  const FotoWidget({Key? key}) : super(key: key);

  @override
  _FotoWidgetState createState() => _FotoWidgetState();
}

class _FotoWidgetState extends State<FotoWidget> {
  late FotoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FotoModel());

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

    return Stack(
      children: [
        Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: AuthUserStreamWidget(
            builder: (context) => ClipRRect(
              borderRadius: BorderRadius.circular(110.0),
              child: Image.network(
                currentUserPhoto,
                height: 230.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(-0.88, -0.89),
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.safePop();
            },
            child: Icon(
              Icons.arrow_back,
              color: FlutterFlowTheme.of(context).primaryBtnText,
              size: 30.0,
            ),
          ),
        ),
      ],
    );
  }
}
