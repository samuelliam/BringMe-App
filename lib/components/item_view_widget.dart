import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/alert_view_delete_widget.dart';
import '/components/confirm_alert_view_widget.dart';
import '/components/image_viewer_widget.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'item_view_model.dart';
export 'item_view_model.dart';

class ItemViewWidget extends StatefulWidget {
  const ItemViewWidget({
    super.key,
    required this.itemDetails,
    required this.itemIndexInList,
  });

  final CheckListItemStruct? itemDetails;
  final int? itemIndexInList;

  @override
  State<ItemViewWidget> createState() => _ItemViewWidgetState();
}

class _ItemViewWidgetState extends State<ItemViewWidget>
    with TickerProviderStateMixin {
  late ItemViewModel _model;

  LatLng? currentUserLocationValue;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemViewModel());

    _model.textController ??=
        TextEditingController(text: widget!.itemDetails?.itemNotes);
    _model.textFieldFocusNode ??= FocusNode();

    _model.switchValue = FFAppState()
        .checklistItems
        .elementAtOrNull(widget!.itemIndexInList!)!
        .atHome;
    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 250.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  child: Builder(builder: (context) {
                    final _googleMapMarker = widget!.itemDetails?.lastLocation;
                    return FlutterFlowGoogleMap(
                      controller: _model.googleMapsController,
                      onCameraIdle: (latLng) =>
                          _model.googleMapsCenter = latLng,
                      initialLocation: _model.googleMapsCenter ??=
                          widget!.itemDetails!.lastLocation!,
                      markers: [
                        if (_googleMapMarker != null)
                          FlutterFlowMarker(
                            _googleMapMarker.serialize(),
                            _googleMapMarker,
                          ),
                      ],
                      markerColor: GoogleMarkerColor.red,
                      mapType: MapType.normal,
                      style: GoogleMapStyle.dark,
                      initialZoom: 15.0,
                      allowInteraction: true,
                      allowZoom: true,
                      showZoomControls: true,
                      showLocation: true,
                      showCompass: true,
                      showMapToolbar: false,
                      showTraffic: false,
                      centerMapOnMarkerTap: true,
                    );
                  }),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                  child: Builder(
                    builder: (context) {
                      final image =
                          widget!.itemDetails?.itemImages?.toList() ?? [];

                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: List.generate(image.length, (imageIndex) {
                            final imageItem = image[imageIndex];
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Container(
                                width: 100.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Visibility(
                                  visible:
                                      widget!.itemDetails!.itemImages.length >
                                          0,
                                  child: Builder(
                                    builder: (context) => InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'ITEM_VIEW_COMP_Container_6fiemkr6_ON_TAP');
                                        logFirebaseEvent(
                                            'ImageViewWithPathWidget_custom_action');
                                        _model.imageData =
                                            await actions.getCurrentImageData(
                                          imageItem,
                                        );
                                        logFirebaseEvent(
                                            'ImageViewWithPathWidget_alert_dialog');
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment: AlignmentDirectional(
                                                      0.0, -1.0)
                                                  .resolve(Directionality.of(
                                                      context)),
                                              child: Container(
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.9,
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.9,
                                                child: ImageViewerWidget(
                                                  image: _model.imageData!,
                                                  currentItemIndex:
                                                      widget!.itemIndexInList!,
                                                  imageIndex: imageIndex,
                                                ),
                                              ),
                                            );
                                          },
                                        );

                                        safeSetState(() {});
                                      },
                                      child: Container(
                                        width: 100.0,
                                        height: 100.0,
                                        child: custom_widgets
                                            .ImageViewWithPathWidget(
                                          width: 100.0,
                                          height: 100.0,
                                          imagePath: imageItem,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          })
                              .divide(SizedBox(width: 8.0))
                              .around(SizedBox(width: 8.0)),
                        ),
                      );
                    },
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 8.0),
                    child: Text(
                      valueOrDefault<String>(
                        widget!.itemDetails?.itemName,
                        'Item',
                      ),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            font: GoogleFonts.ibmPlexMono(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontStyle,
                          ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 16.0, 8.0, 0.0),
                  child: SelectionArea(
                      child: Text(
                    widget!.itemDetails!.lastLocationAddress,
                    style: FlutterFlowTheme.of(context).labelSmall.override(
                          font: GoogleFonts.ibmPlexMono(
                            fontWeight: FlutterFlowTheme.of(context)
                                .labelSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .labelSmall
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .labelSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).labelSmall.fontStyle,
                        ),
                  )),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 16.0, 8.0, 0.0),
                        child: SelectionArea(
                            child: Text(
                          'Last time updated: ${valueOrDefault<String>(
                            dateTimeFormat(
                              "MMMM d, yyyy, h:mm a",
                              widget!.itemDetails?.lastTimeUpdated,
                              locale: FFLocalizations.of(context).languageCode,
                            ),
                            'Not updated yet.',
                          )}',
                          maxLines: 3,
                          style:
                              FlutterFlowTheme.of(context).labelSmall.override(
                                    font: GoogleFonts.ibmPlexMono(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .fontStyle,
                                  ),
                        )),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 16.0, 8.0, 0.0),
                        child: SelectionArea(
                            child: Text(
                          'Lat: ${valueOrDefault<String>(
                            functions
                                .getLocationStrings(
                                    widget!.itemDetails?.lastLocation)
                                ?.latitude,
                            'Not updated yet.',
                          )}',
                          maxLines: 3,
                          style:
                              FlutterFlowTheme.of(context).labelSmall.override(
                                    font: GoogleFonts.ibmPlexMono(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .fontStyle,
                                  ),
                        )),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 16.0, 8.0, 0.0),
                        child: SelectionArea(
                            child: Text(
                          'Long: ${valueOrDefault<String>(
                            functions
                                .getLocationStrings(
                                    widget!.itemDetails?.lastLocation)
                                ?.longitude,
                            'Not updated yet.',
                          )}',
                          maxLines: 3,
                          style:
                              FlutterFlowTheme.of(context).labelSmall.override(
                                    font: GoogleFonts.ibmPlexMono(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .fontStyle,
                                  ),
                        )),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 16.0, 8.0, 0.0),
                  child: Text(
                    'Notes:',
                    style: FlutterFlowTheme.of(context).titleMedium.override(
                          font: GoogleFonts.ibmPlexMono(
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).primaryText,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleMedium
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .titleMedium
                              .fontStyle,
                        ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 0.0),
                    child: TextFormField(
                      controller: _model.textController,
                      focusNode: _model.textFieldFocusNode,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.textController',
                        Duration(milliseconds: 2000),
                        () async {
                          logFirebaseEvent(
                              'ITEM_VIEW_TextField_c9fhkzl8_ON_TEXTFIEL');
                          logFirebaseEvent('TextField_update_app_state');
                          FFAppState().updateChecklistItemsAtIndex(
                            widget!.itemIndexInList!,
                            (e) => e..itemNotes = _model.textController.text,
                          );
                          safeSetState(() {});
                        },
                      ),
                      autofocus: false,
                      textInputAction: TextInputAction.done,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  font: GoogleFonts.ibmPlexMono(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                        hintText: FFAppState()
                            .jokes
                            .elementAtOrNull(random_data.randomInteger(0, 59)),
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  font: GoogleFonts.ibmPlexMono(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).secondaryText,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.ibmPlexMono(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                      maxLines: null,
                      minLines: 1,
                      keyboardType: TextInputType.multiline,
                      validator:
                          _model.textControllerValidator.asValidator(context),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                        child: Icon(
                          Icons.home,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                      ),
                      Text(
                        'At Home',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.ibmPlexMono(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                      Switch.adaptive(
                        value: _model.switchValue!,
                        onChanged: (newValue) async {
                          safeSetState(() => _model.switchValue = newValue!);
                          if (newValue!) {
                            logFirebaseEvent(
                                'ITEM_VIEW_Switch_h8382b6y_ON_TOGGLE_ON');
                            logFirebaseEvent('Switch_update_app_state');
                            FFAppState().updateChecklistItemsAtIndex(
                              widget!.itemIndexInList!,
                              (e) => e..atHome = true,
                            );
                            safeSetState(() {});
                          } else {
                            logFirebaseEvent(
                                'ITEM_VIEW_Switch_h8382b6y_ON_TOGGLE_OFF');
                            logFirebaseEvent('Switch_update_app_state');
                            FFAppState().updateChecklistItemsAtIndex(
                              widget!.itemIndexInList!,
                              (e) => e..atHome = false,
                            );
                            safeSetState(() {});
                          }
                        },
                        activeColor: FlutterFlowTheme.of(context).primaryText,
                        activeTrackColor: FlutterFlowTheme.of(context).accent2,
                        inactiveTrackColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        inactiveThumbColor:
                            FlutterFlowTheme.of(context).primaryText,
                      ),
                    ].divide(SizedBox(width: 8.0)).around(SizedBox(width: 8.0)),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Builder(
                                builder: (context) => Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 4.0, 8.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'ITEM_VIEW_COMP_WITH_ME_BTN_ON_TAP');
                                      currentUserLocationValue =
                                          await getCurrentUserLocation(
                                              defaultLocation:
                                                  LatLng(0.0, 0.0));
                                      if (widget!.itemDetails!.atHome) {
                                        logFirebaseEvent('Button_alert_dialog');
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: ConfirmAlertViewWidget(
                                                alertTitle: 'Please Check',
                                                alertMessage:
                                                    'Do you confirm your item is With You?',
                                                action: () async {
                                                  currentUserLocationValue =
                                                      await getCurrentUserLocation(
                                                          defaultLocation:
                                                              LatLng(0.0, 0.0));
                                                  if (FFAppState()
                                                          .checklistItems
                                                          .length >
                                                      0) {
                                                    logFirebaseEvent(
                                                        '_haptic_feedback');
                                                    HapticFeedback
                                                        .mediumImpact();
                                                    logFirebaseEvent(
                                                        '_update_app_state');
                                                    FFAppState()
                                                        .updateChecklistItemsAtIndex(
                                                      widget!.itemIndexInList!,
                                                      (e) => e
                                                        ..lastTimeUpdated =
                                                            getCurrentTimestamp
                                                        ..lastLocation =
                                                            currentUserLocationValue
                                                        ..updateLocationHistory(
                                                          (e) => e.add(
                                                              currentUserLocationValue!),
                                                        )
                                                        ..atHome = false,
                                                    );
                                                    FFAppState().update(() {});
                                                    logFirebaseEvent(
                                                        '_backend_call');
                                                    _model.apiResultiu1Copy =
                                                        await GetAddressFromLocationCall
                                                            .call(
                                                      latlng:
                                                          '${functions.getLocationStrings(currentUserLocationValue)?.latitude},${functions.getLocationStrings(currentUserLocationValue)?.longitude}',
                                                    );

                                                    logFirebaseEvent(
                                                        '_update_app_state');
                                                    FFAppState()
                                                        .updateChecklistItemsAtIndex(
                                                      widget!.itemIndexInList!,
                                                      (e) => e
                                                        ..lastLocationAddress =
                                                            GetAddressFromLocationCall
                                                                .formattedAddress(
                                                          (_model.apiResultiu1Copy
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )?.firstOrNull
                                                        ..atHome = false,
                                                    );
                                                    FFAppState().update(() {});
                                                    logFirebaseEvent(
                                                        '_google_map');
                                                    await _model
                                                        .googleMapsController
                                                        .future
                                                        .then(
                                                      (c) => c.animateCamera(
                                                        CameraUpdate.newLatLng(
                                                            currentUserLocationValue!
                                                                .toGoogleMaps()),
                                                      ),
                                                    );
                                                  }
                                                  logFirebaseEvent(
                                                      '_navigate_to');
                                                  if (Navigator.of(context)
                                                      .canPop()) {
                                                    context.pop();
                                                  }
                                                  context.pushNamed(
                                                    ItemDetailsViewWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'itemIndex':
                                                          serializeParam(
                                                        widget!.itemIndexInList,
                                                        ParamType.int,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      kTransitionInfoKey:
                                                          TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .fade,
                                                        duration: Duration(
                                                            milliseconds: 0),
                                                      ),
                                                    },
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                        );
                                      } else {
                                        if (FFAppState().checklistItems.length >
                                            0) {
                                          logFirebaseEvent(
                                              'Button_haptic_feedback');
                                          HapticFeedback.mediumImpact();
                                          logFirebaseEvent(
                                              'Button_update_app_state');
                                          FFAppState()
                                              .updateChecklistItemsAtIndex(
                                            widget!.itemIndexInList!,
                                            (e) => e
                                              ..lastTimeUpdated =
                                                  getCurrentTimestamp
                                              ..lastLocation =
                                                  currentUserLocationValue
                                              ..updateLocationHistory(
                                                (e) => e.add(
                                                    currentUserLocationValue!),
                                              )
                                              ..updateLocationHistoryWithAddress(
                                                (e) => e.add(
                                                    LatLongWithAddressStruct(
                                                  latLong:
                                                      currentUserLocationValue,
                                                  address: ' ',
                                                  dateTime: getCurrentTimestamp,
                                                )),
                                              ),
                                          );
                                          FFAppState().update(() {});
                                          logFirebaseEvent(
                                              'Button_backend_call');
                                          _model.apiResultiu1 =
                                              await GetAddressFromLocationCall
                                                  .call(
                                            latlng:
                                                '${functions.getLocationStrings(currentUserLocationValue)?.latitude},${functions.getLocationStrings(currentUserLocationValue)?.longitude}',
                                          );

                                          logFirebaseEvent(
                                              'Button_update_app_state');
                                          FFAppState()
                                              .updateChecklistItemsAtIndex(
                                            widget!.itemIndexInList!,
                                            (e) => e
                                              ..lastLocationAddress =
                                                  GetAddressFromLocationCall
                                                      .formattedAddress(
                                                (_model.apiResultiu1
                                                        ?.jsonBody ??
                                                    ''),
                                              )?.firstOrNull
                                              ..updateLocationHistoryWithAddress(
                                                (e) => e[FFAppState()
                                                        .checklistItems
                                                        .elementAtOrNull(widget!
                                                            .itemIndexInList!)!
                                                        .locationHistoryWithAddress
                                                        .length -
                                                    1]
                                                  ..address =
                                                      GetAddressFromLocationCall
                                                          .formattedAddress(
                                                    (_model.apiResultiu1
                                                            ?.jsonBody ??
                                                        ''),
                                                  )?.firstOrNull,
                                              ),
                                          );
                                          FFAppState().update(() {});
                                          logFirebaseEvent('Button_google_map');
                                          await _model
                                              .googleMapsController.future
                                              .then(
                                            (c) => c.animateCamera(
                                              CameraUpdate.newLatLng(
                                                  currentUserLocationValue!
                                                      .toGoogleMaps()),
                                            ),
                                          );
                                        }
                                      }

                                      safeSetState(() {});
                                    },
                                    text: 'With Me',
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            font: GoogleFonts.ibmPlexMono(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
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
                            ),
                            Builder(
                              builder: (context) => Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    4.0, 8.0, 0.0, 8.0),
                                child: FlutterFlowIconButton(
                                  borderRadius: 10.0,
                                  borderWidth: 0.0,
                                  buttonSize: 40.0,
                                  fillColor: FlutterFlowTheme.of(context).error,
                                  icon: Icon(
                                    Icons.delete_outline_outlined,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    size: 20.0,
                                  ),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'ITEM_VIEW_delete_outline_outlined_ICN_ON');
                                    logFirebaseEvent('IconButton_alert_dialog');
                                    await showDialog(
                                      context: context,
                                      builder: (dialogContext) {
                                        return Dialog(
                                          elevation: 0,
                                          insetPadding: EdgeInsets.zero,
                                          backgroundColor: Colors.transparent,
                                          alignment: AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          child: AlertViewDeleteWidget(
                                            alertTitle: 'Deleting Item',
                                            alertMessage:
                                                'Are you sure to delete?',
                                            action: () async {
                                              logFirebaseEvent(
                                                  '_update_app_state');
                                              FFAppState()
                                                  .removeFromChecklistItems(
                                                      widget!.itemDetails!);
                                              safeSetState(() {});
                                              logFirebaseEvent('_navigate_to');
                                              if (Navigator.of(context)
                                                  .canPop()) {
                                                context.pop();
                                              }
                                              context.pushNamed(
                                                HomePageWidget.routeName,
                                                extra: <String, dynamic>{
                                                  kTransitionInfoKey:
                                                      TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType.fade,
                                                  ),
                                                },
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 4.0, 8.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'ITEM_VIEW_COMP_ADD_IMAGE_BTN_ON_TAP');
                                    logFirebaseEvent(
                                        'Button_store_media_for_upload');
                                    final selectedMedia =
                                        await selectMediaWithSourceBottomSheet(
                                      context: context,
                                      allowPhoto: true,
                                    );
                                    if (selectedMedia != null &&
                                        selectedMedia.every((m) =>
                                            validateFileFormat(
                                                m.storagePath, context))) {
                                      safeSetState(() =>
                                          _model.isDataUploading_uploadDataGor =
                                              true);
                                      var selectedUploadedFiles =
                                          <FFUploadedFile>[];

                                      try {
                                        selectedUploadedFiles = selectedMedia
                                            .map((m) => FFUploadedFile(
                                                  name: m.storagePath
                                                      .split('/')
                                                      .last,
                                                  bytes: m.bytes,
                                                  height: m.dimensions?.height,
                                                  width: m.dimensions?.width,
                                                  blurHash: m.blurHash,
                                                ))
                                            .toList();
                                      } finally {
                                        _model.isDataUploading_uploadDataGor =
                                            false;
                                      }
                                      if (selectedUploadedFiles.length ==
                                          selectedMedia.length) {
                                        safeSetState(() {
                                          _model.uploadedLocalFile_uploadDataGor =
                                              selectedUploadedFiles.first;
                                        });
                                      } else {
                                        safeSetState(() {});
                                        return;
                                      }
                                    }

                                    logFirebaseEvent('Button_custom_action');
                                    _model.uploadedImagePath =
                                        await actions.getImagePath(
                                      _model.uploadedLocalFile_uploadDataGor,
                                    );
                                    logFirebaseEvent('Button_update_app_state');
                                    FFAppState().updateChecklistItemsAtIndex(
                                      widget!.itemIndexInList!,
                                      (e) => e
                                        ..updateItemImages(
                                          (e) => e.insert(
                                              0, _model.uploadedImagePath!),
                                        ),
                                    );
                                    safeSetState(() {});

                                    safeSetState(() {});
                                  },
                                  text: 'Add Image',
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          font: GoogleFonts.ibmPlexMono(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
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
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 4.0, 8.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'ITEM_VIEW_LOCATION_HISTORY_BTN_ON_TAP');
                                    logFirebaseEvent('Button_navigate_to');

                                    context.pushNamed(
                                      LocationHistoryWidget.routeName,
                                      queryParameters: {
                                        'locationHistory': serializeParam(
                                          widget!.itemDetails
                                              ?.locationHistoryWithAddress
                                              ?.map((e) => e.latLong)
                                              .withoutNulls
                                              .toList(),
                                          ParamType.LatLng,
                                          isList: true,
                                        ),
                                        'addressHistory': serializeParam(
                                          widget!.itemDetails
                                              ?.locationHistoryWithAddress
                                              ?.map((e) => e.address)
                                              .toList(),
                                          ParamType.String,
                                          isList: true,
                                        ),
                                        'dateTimeList': serializeParam(
                                          widget!.itemDetails
                                              ?.locationHistoryWithAddress
                                              ?.map((e) => e.dateTime)
                                              .withoutNulls
                                              .toList(),
                                          ParamType.DateTime,
                                          isList: true,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  text: 'Location History',
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          font: GoogleFonts.ibmPlexMono(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
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
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8.0, 16.0, 8.0, 16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: FlutterFlowAdBanner(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 250.0,
                    showsTestAd: false,
                    iOSAdUnitID: 'ca-app-pub-7072008593410741/3665621761',
                    androidAdUnitID: 'ca-app-pub-7072008593410741/8917948449',
                  ),
                ),
              ),
            ),
          ].addToEnd(SizedBox(height: 50.0)),
        ),
      ),
    ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!);
  }
}
