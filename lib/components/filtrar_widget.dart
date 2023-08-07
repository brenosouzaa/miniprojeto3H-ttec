import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'filtrar_model.dart';
export 'filtrar_model.dart';

class FiltrarWidget extends StatefulWidget {
  const FiltrarWidget({Key? key}) : super(key: key);

  @override
  _FiltrarWidgetState createState() => _FiltrarWidgetState();
}

class _FiltrarWidgetState extends State<FiltrarWidget> {
  late FiltrarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FiltrarModel());

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

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [],
    );
  }
}
