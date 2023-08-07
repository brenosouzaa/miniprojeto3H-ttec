import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'mudarnome_model.dart';
export 'mudarnome_model.dart';

class MudarnomeWidget extends StatefulWidget {
  const MudarnomeWidget({Key? key}) : super(key: key);

  @override
  _MudarnomeWidgetState createState() => _MudarnomeWidgetState();
}

class _MudarnomeWidgetState extends State<MudarnomeWidget> {
  late MudarnomeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MudarnomeModel());

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

    return Container();
  }
}
