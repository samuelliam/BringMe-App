import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'image_viewer_model.dart';
export 'image_viewer_model.dart';

class ImageViewerWidget extends StatefulWidget {
  const ImageViewerWidget({
    super.key,
    required this.image,
    required this.currentItemIndex,
    required this.imageIndex,
  });

  final FFUploadedFile? image;
  final int? currentItemIndex;
  final int? imageIndex;

  @override
  State<ImageViewerWidget> createState() => _ImageViewerWidgetState();
}

class _ImageViewerWidgetState extends State<ImageViewerWidget> {
  late ImageViewerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ImageViewerModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        logFirebaseEvent('IMAGE_VIEWER_COMP_Stack_5ul5gbe3_ON_TAP');
        logFirebaseEvent('Stack_close_dialog_drawer_etc');
        Navigator.pop(context);
      },
      child: Stack(
        children: [
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              logFirebaseEvent('IMAGE_VIEWER_COMP_Image_uhcpv4gq_ON_TAP');
              logFirebaseEvent('Image_expand_image');
              await Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                  child: FlutterFlowExpandedImageView(
                    image: Image.memory(
                      widget!.image?.bytes ?? Uint8List.fromList([]),
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) => Image.asset(
                        'assets/images/error_image.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    allowRotation: true,
                    tag: 'imageHeroTag',
                    useHeroAnimation: true,
                  ),
                ),
              );
            },
            child: Hero(
              tag: 'imageHeroTag',
              transitionOnUserGestures: true,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.memory(
                  widget!.image?.bytes ?? Uint8List.fromList([]),
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Image.asset(
                    'assets/images/error_image.png',
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, 1.0),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('IMAGE_VIEWER_COMP_DELETE_BTN_ON_TAP');
                  logFirebaseEvent('Button_alert_dialog');
                  var confirmDialogResponse = await showDialog<bool>(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: Text('Delete Image'),
                            content: Text('Are you sure to delete?'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext, false),
                                child: Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext, true),
                                child: Text('Confirm'),
                              ),
                            ],
                          );
                        },
                      ) ??
                      false;
                  if (confirmDialogResponse) {
                    logFirebaseEvent('Button_update_app_state');
                    FFAppState().updateChecklistItemsAtIndex(
                      widget!.currentItemIndex!,
                      (e) => e
                        ..updateItemImages(
                          (e) => e.removeAt(widget!.imageIndex!),
                        ),
                    );
                    safeSetState(() {});
                    logFirebaseEvent('Button_close_dialog_drawer_etc');
                    Navigator.pop(context);
                  }
                },
                text: 'Delete',
                options: FFButtonOptions(
                  width: MediaQuery.sizeOf(context).width * 0.4,
                  height: 45.0,
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primaryText,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        font: GoogleFonts.ibmPlexMono(
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).alternate,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                  elevation: 3.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(1.0, -1.0),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: FlutterFlowIconButton(
                borderRadius: 10.0,
                borderWidth: 1.0,
                buttonSize: 30.0,
                fillColor: FlutterFlowTheme.of(context).primaryText,
                icon: Icon(
                  Icons.close_rounded,
                  color: FlutterFlowTheme.of(context).alternate,
                  size: 15.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('IMAGE_VIEWER_close_rounded_ICN_ON_TAP');
                  logFirebaseEvent('IconButton_close_dialog_drawer_etc');
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
