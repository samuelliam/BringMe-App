import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'confirm_alert_view_model.dart';
export 'confirm_alert_view_model.dart';

class ConfirmAlertViewWidget extends StatefulWidget {
  const ConfirmAlertViewWidget({
    super.key,
    required this.alertTitle,
    required this.alertMessage,
    required this.action,
  });

  final String? alertTitle;
  final String? alertMessage;
  final Future Function()? action;

  @override
  State<ConfirmAlertViewWidget> createState() => _ConfirmAlertViewWidgetState();
}

class _ConfirmAlertViewWidgetState extends State<ConfirmAlertViewWidget> {
  late ConfirmAlertViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfirmAlertViewModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                widget!.alertTitle!,
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      font: GoogleFonts.ibmPlexMono(
                        fontWeight: FontWeight.w600,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontStyle,
                      ),
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                widget!.alertMessage!,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.ibmPlexMono(
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('CONFIRM_ALERT_VIEW_CONFIRM_BTN_ON_TAP');
                      logFirebaseEvent('Button_close_dialog_drawer_etc');
                      Navigator.pop(context);
                      logFirebaseEvent('Button_execute_callback');
                      await widget.action?.call();
                    },
                    text: 'Confirm',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primaryText,
                      textStyle: FlutterFlowTheme.of(context)
                          .labelMedium
                          .override(
                            font: GoogleFonts.ibmPlexMono(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .fontStyle,
                            ),
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .labelMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .fontStyle,
                          ),
                      elevation: 2.0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'CONFIRM_ALERT_VIEW_CANCEL_BTN_ON_TAP');
                        logFirebaseEvent('Button_close_dialog_drawer_etc');
                        Navigator.pop(context);
                      },
                      text: 'Cancel',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 40.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        textStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  font: GoogleFonts.ibmPlexMono(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                        elevation: 0.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
