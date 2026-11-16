import '/components/item_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'item_details_view_model.dart';
export 'item_details_view_model.dart';

class ItemDetailsViewWidget extends StatefulWidget {
  const ItemDetailsViewWidget({
    super.key,
    required this.itemIndex,
  });

  final int? itemIndex;

  static String routeName = 'ItemDetailsView';
  static String routePath = '/itemDetailsView';

  @override
  State<ItemDetailsViewWidget> createState() => _ItemDetailsViewWidgetState();
}

class _ItemDetailsViewWidgetState extends State<ItemDetailsViewWidget> {
  late ItemDetailsViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemDetailsViewModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ItemDetailsView'});
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
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryText,
          iconTheme:
              IconThemeData(color: FlutterFlowTheme.of(context).alternate),
          automaticallyImplyLeading: true,
          title: Text(
            'Item Details',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.ibmPlexMono(
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).alternate,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: wrapWithModel(
                  model: _model.itemViewModel,
                  updateCallback: () => safeSetState(() {}),
                  updateOnChange: true,
                  child: Hero(
                    tag: 'itemDetailTag',
                    transitionOnUserGestures: true,
                    child: Material(
                      color: Colors.transparent,
                      child: ItemViewWidget(
                        itemIndexInList: widget!.itemIndex!,
                        itemDetails: FFAppState()
                            .checklistItems
                            .elementAtOrNull(widget!.itemIndex!)!,
                      ),
                    ),
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
