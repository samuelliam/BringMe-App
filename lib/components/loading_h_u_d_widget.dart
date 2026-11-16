import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'loading_h_u_d_model.dart';
export 'loading_h_u_d_model.dart';

class LoadingHUDWidget extends StatefulWidget {
  const LoadingHUDWidget({super.key});

  @override
  State<LoadingHUDWidget> createState() => _LoadingHUDWidgetState();
}

class _LoadingHUDWidgetState extends State<LoadingHUDWidget> {
  late LoadingHUDModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingHUDModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.5,
        height: MediaQuery.sizeOf(context).height * 0.5,
        decoration: BoxDecoration(),
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: FlutterFlowTheme.of(context).secondaryBackground,
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Lottie.asset(
                'assets/jsons/Animation_-_1700813327697.json',
                height: MediaQuery.sizeOf(context).height * 0.8,
                fit: BoxFit.fitWidth,
                animate: true,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
