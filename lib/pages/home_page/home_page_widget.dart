import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/alert_view_delete_widget.dart';
import '/components/alert_view_with_text_field_for_item_group_create_widget.dart';
import '/components/confirm_alert_view_widget.dart';
import '/components/map_view_widget.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  static String routeName = 'HomePage';
  static String routePath = '/homePage';

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;
  var hasCardTriggered = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'HomePage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('HOME_PAGE_PAGE_HomePage_ON_INIT_STATE');
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
      'textFieldOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.bounceOut,
            delay: 0.0.ms,
            duration: 100.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(5.0, 0.0),
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 100.0.ms,
            begin: Offset(5.0, 0.0),
            end: Offset(-5.0, 0.0),
          ),
          MoveEffect(
            curve: Curves.bounceOut,
            delay: 200.0.ms,
            duration: 100.0.ms,
            begin: Offset(-5.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'cardOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        applyInitialState: false,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 33.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'cardOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 33.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    SchedulerBinding.instance.addPostFrameCallback((_) {
      animationsMap['cardOnPageLoadAnimation']!.controller.forward(from: 0.0);
    });
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
      child: PopScope(
        canPop: false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          endDrawer: Drawer(
            elevation: 16.0,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 0.0),
                child: Wrap(
                  spacing: 0.0,
                  runSpacing: 0.0,
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  direction: Axis.horizontal,
                  runAlignment: WrapAlignment.start,
                  verticalDirection: VerticalDirection.down,
                  clipBehavior: Clip.none,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        elevation: 4.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  4.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Item Groups',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.ibmPlexMono(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4.0, 4.0, 0.0, 4.0),
                                    child: FlutterFlowDropDown<int>(
                                      controller:
                                          _model.dropDownValueController ??=
                                              FormFieldController<int>(
                                        _model.dropDownValue ??= FFAppState()
                                            .itemGroups
                                            .where((e) =>
                                                e.groupID ==
                                                FFAppState().currentItemGroup)
                                            .toList()
                                            .firstOrNull
                                            ?.groupID,
                                      ),
                                      options: List<int>.from(FFAppState()
                                          .itemGroups
                                          .map((e) => e.groupID)
                                          .toList()),
                                      optionLabels: FFAppState()
                                          .itemGroups
                                          .map((e) => e.groupName)
                                          .toList(),
                                      onChanged: (val) async {
                                        safeSetState(
                                            () => _model.dropDownValue = val);
                                        logFirebaseEvent(
                                            'HOME_DropDown_rlhwwawl_ON_FORM_WIDGET_SE');
                                        logFirebaseEvent(
                                            'DropDown_update_app_state');
                                        FFAppState().currentItemGroup =
                                            _model.dropDownValue!;
                                        FFAppState().update(() {});
                                      },
                                      width: 300.0,
                                      height: 50.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.ibmPlexMono(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                      hintText: 'Please Select Item Group',
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      elevation: 0.0,
                                      borderColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderWidth: 0.0,
                                      borderRadius: 8.0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 4.0, 16.0, 4.0),
                                      hidesUnderline: true,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    ),
                                  ),
                                ),
                                Builder(
                                  builder: (context) => Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: FlutterFlowIconButton(
                                      borderRadius: 20.0,
                                      borderWidth: 0.0,
                                      buttonSize: 25.0,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      icon: Icon(
                                        Icons.add,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        size: 10.0,
                                      ),
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'HOME_PAGE_PAGE_add_ICN_ON_TAP');
                                        logFirebaseEvent(
                                            'IconButton_alert_dialog');
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
                                              child: GestureDetector(
                                                onTap: () {
                                                  FocusScope.of(dialogContext)
                                                      .unfocus();
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();
                                                },
                                                child: Container(
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.5,
                                                  width: double.infinity,
                                                  child:
                                                      AlertViewWithTextFieldForItemGroupCreateWidget(
                                                    alertTitle:
                                                        'Add Item Group',
                                                    alertMessage:
                                                        ' Add your desired group name',
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                if (FFAppState().currentItemGroup != 0)
                                  Builder(
                                    builder: (context) => Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 20.0,
                                        borderWidth: 0.0,
                                        buttonSize: 25.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        icon: Icon(
                                          Icons.remove,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          size: 10.0,
                                        ),
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'HOME_PAGE_PAGE_remove_ICN_ON_TAP');
                                          logFirebaseEvent(
                                              'IconButton_alert_dialog');
                                          await showDialog(
                                            context: context,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                elevation: 0,
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment: AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(dialogContext)
                                                        .unfocus();
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child: AlertViewDeleteWidget(
                                                    alertTitle:
                                                        'Item Group Delete',
                                                    alertMessage:
                                                        'Are you sure to delete?',
                                                    action: () async {
                                                      logFirebaseEvent(
                                                          '_update_app_state');
                                                      FFAppState().removeFromItemGroups(
                                                          FFAppState()
                                                              .itemGroups
                                                              .where((e) =>
                                                                  e.groupID ==
                                                                  FFAppState()
                                                                      .currentItemGroup)
                                                              .toList()
                                                              .firstOrNull!);
                                                      FFAppState()
                                                          .update(() {});
                                                      logFirebaseEvent(
                                                          '_custom_action');
                                                      await actions
                                                          .deleteAllItem(
                                                        FFAppState()
                                                            .currentItemGroup,
                                                      );
                                                      logFirebaseEvent(
                                                          '_update_app_state');
                                                      FFAppState()
                                                          .currentItemGroup = 0;
                                                      FFAppState()
                                                          .update(() {});
                                                      logFirebaseEvent(
                                                          '_navigate_to');
                                                      if (Navigator.of(context)
                                                          .canPop()) {
                                                        context.pop();
                                                      }
                                                      context.pushNamed(
                                                        HomePageWidget
                                                            .routeName,
                                                        extra: <String,
                                                            dynamic>{
                                                          kTransitionInfoKey:
                                                              TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .fade,
                                                          ),
                                                        },
                                                      );

                                                      logFirebaseEvent(
                                                          '_close_dialog_drawer_etc');
                                                      Navigator.pop(context);
                                                    },
                                                  ),
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
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'HOME_PAGE_PAGE_Card_026pc8qh_ON_TAP');
                          logFirebaseEvent('Card_set_dark_mode_settings');
                          setDarkModeSetting(
                            context,
                            !(Theme.of(context).brightness == Brightness.dark)
                                ? ThemeMode.dark
                                : ThemeMode.light,
                          );
                        },
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.light_mode_outlined,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Light/Dark Mode',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.ibmPlexMono(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
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
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'HOME_PAGE_PAGE_Card_rfatm5ry_ON_TAP');
                          logFirebaseEvent('Card_update_app_state');
                          FFAppState().isCompactMode =
                              !FFAppState().isCompactMode;
                          FFAppState().update(() {});
                        },
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.view_compact,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Compact Mode',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.ibmPlexMono(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ),
                              if (FFAppState().isCompactMode)
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.check_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    if (false)
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'HOME_PAGE_PAGE_Card_ovxli40d_ON_TAP');
                            logFirebaseEvent('Card_navigate_to');

                            context.pushNamed(
                                NotificationSettingsWidget.routeName);
                          },
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.notifications_outlined,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Notification Settings',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.ibmPlexMono(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    if (false)
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'HOME_PAGE_PAGE_Card_u52uv52u_ON_TAP');
                            if (loggedIn) {
                              logFirebaseEvent('Card_custom_action');
                              await actions.deleteAllItemsCollection();
                              logFirebaseEvent('Card_update_page_state');
                              _model.refreshFirebaseIndex = 0;
                              safeSetState(() {});
                              while (_model.refreshFirebaseIndex! <
                                  valueOrDefault<int>(
                                    FFAppState().checklistItems.length,
                                    0,
                                  )) {
                                logFirebaseEvent('Card_custom_action');
                                _model.locationList =
                                    await actions.getLocationHistoryLatLongList(
                                  _model.refreshFirebaseIndex!,
                                );
                                logFirebaseEvent('Card_backend_call');

                                await ItemsRecord.createDoc(
                                        currentUserReference!)
                                    .set({
                                  ...createItemsRecordData(
                                    itemName: FFAppState()
                                        .checklistItems
                                        .elementAtOrNull(
                                            _model.refreshFirebaseIndex!)
                                        ?.itemName,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'itemHistory': [
                                        getHistoryItemFirestoreData(
                                          updateHistoryItemStruct(
                                            HistoryItemStruct(
                                              datetime: FFAppState()
                                                  .checklistItems
                                                  .elementAtOrNull(_model
                                                      .refreshFirebaseIndex!)
                                                  ?.lastTimeUpdated,
                                              location: FFAppState()
                                                  .checklistItems
                                                  .elementAtOrNull(_model
                                                      .refreshFirebaseIndex!)
                                                  ?.lastLocation,
                                            ),
                                            clearUnsetFields: false,
                                            create: true,
                                          ),
                                          true,
                                        )
                                      ],
                                    },
                                  ),
                                });
                                logFirebaseEvent('Card_update_page_state');
                                _model.refreshFirebaseIndex =
                                    _model.refreshFirebaseIndex! + 1;
                                safeSetState(() {});
                              }
                              logFirebaseEvent('Card_navigate_to');
                              if (Navigator.of(context).canPop()) {
                                context.pop();
                              }
                              context.pushNamed(
                                HomePageWidget.routeName,
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );

                              logFirebaseEvent('Card_close_dialog_drawer_etc');
                              Navigator.pop(context);
                            } else {
                              logFirebaseEvent('Card_navigate_to');

                              context.pushNamed(LoginPageWidget.routeName);
                            }

                            safeSetState(() {});
                          },
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.refresh_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Save Backup',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.ibmPlexMono(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    if (false)
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'HOME_PAGE_PAGE_Card_mu4dn5fo_ON_TAP');
                            if (loggedIn) {
                              logFirebaseEvent('Card_firestore_query');
                              _model.fetchedUserItem =
                                  await queryItemsRecordOnce(
                                parent: currentUserReference,
                              );
                              logFirebaseEvent('Card_custom_action');
                              await actions.mergeUserItems(
                                _model.fetchedUserItem?.toList(),
                              );
                              logFirebaseEvent('Card_navigate_to');
                              if (Navigator.of(context).canPop()) {
                                context.pop();
                              }
                              context.pushNamed(
                                HomePageWidget.routeName,
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );
                            } else {
                              logFirebaseEvent('Card_navigate_to');

                              context.pushNamed(LoginPageWidget.routeName);
                            }

                            safeSetState(() {});
                          },
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.downloading_sharp,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Fetch Backup',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.ibmPlexMono(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'HOME_PAGE_PAGE_Card_rtd28cjp_ON_TAP');
                          logFirebaseEvent('Card_navigate_to');

                          context.pushNamed(AboutWidget.routeName);
                        },
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.info_outlined,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'About',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.ibmPlexMono(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
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
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    if (false)
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'HOME_PAGE_PAGE_Card_h0n81zv5_ON_TAP');
                            logFirebaseEvent('Card_navigate_to');

                            context.pushNamed(LoginPageWidget.routeName);
                          },
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.account_circle,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => Text(
                                      valueOrDefault<String>(
                                        currentUserDisplayName,
                                        'Login',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.ibmPlexMono(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 16.0, 16.0, 16.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: FlutterFlowAdBanner(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 250.0,
                            showsTestAd: false,
                            iOSAdUnitID:
                                'ca-app-pub-7072008593410741/9439347726',
                            androidAdUnitID:
                                'ca-app-pub-7072008593410741/1804647709',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondary,
            automaticallyImplyLeading: false,
            title: Text(
              'Bring Me',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    font: GoogleFonts.ibmPlexMono(
                      fontWeight: FlutterFlowTheme.of(context)
                          .headlineMedium
                          .fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontSize: 22.0,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
            ),
            actions: [
              FlutterFlowIconButton(
                borderRadius: 0.0,
                borderWidth: 0.0,
                buttonSize: 40.0,
                icon: Icon(
                  Icons.settings,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('HOME_PAGE_PAGE_settings_ICN_ON_TAP');
                  logFirebaseEvent('IconButton_drawer');
                  scaffoldKey.currentState!.openEndDrawer();
                },
              ),
            ],
            centerTitle: false,
            elevation: 2.0,
          ),
          body: SingleChildScrollView(
            primary: false,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16.0),
                          bottomRight: Radius.circular(16.0),
                          topLeft: Radius.circular(0.0),
                          topRight: Radius.circular(0.0),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(16.0),
                              bottomRight: Radius.circular(16.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(0.0),
                            ),
                          ),
                          child: FlutterFlowAdBanner(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 70.0,
                            showsTestAd: false,
                            iOSAdUnitID:
                                'ca-app-pub-7072008593410741/6872887965',
                            androidAdUnitID:
                                'ca-app-pub-7072008593410741/3490130435',
                          ),
                        ),
                      ),
                      if (FFAppState().currentItemGroup != 0)
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'HOME_PAGE_PAGE_Text_h568ke9w_ON_TAP');
                                    logFirebaseEvent('Text_drawer');
                                    scaffoldKey.currentState!.openEndDrawer();
                                  },
                                  child: Text(
                                    '${valueOrDefault<String>(
                                      FFAppState()
                                          .itemGroups
                                          .where((e) =>
                                              e.groupID ==
                                              FFAppState().currentItemGroup)
                                          .toList()
                                          .firstOrNull
                                          ?.groupName,
                                      'Default Group',
                                    )}',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .override(
                                          font: GoogleFonts.ibmPlexMono(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .headlineMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .headlineMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(4.0, 8.0, 4.0, 4.0),
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                4.0, 0.0, 4.0, 0.0),
                            child: TextFormField(
                              controller: _model.textController,
                              focusNode: _model.textFieldFocusNode,
                              onFieldSubmitted: (_) async {
                                logFirebaseEvent(
                                    'HOME_TextField_j6hzar92_ON_TEXTFIELD_SUB');
                                currentUserLocationValue =
                                    await getCurrentUserLocation(
                                        defaultLocation: LatLng(0.0, 0.0));
                                if (_model.textController.text != null &&
                                    _model.textController.text != '') {
                                  logFirebaseEvent(
                                      'TextField_update_app_state');
                                  FFAppState()
                                      .addToChecklistItems(CheckListItemStruct(
                                    isItemBringed: false,
                                    itemName: _model.textController.text,
                                    lastTimeUpdated: getCurrentTimestamp,
                                    lastLocation: currentUserLocationValue,
                                    itemGroup: FFAppState().currentItemGroup,
                                  ));
                                  safeSetState(() {});
                                  logFirebaseEvent(
                                      'TextField_clear_text_fields_pin_codes');
                                  safeSetState(() {
                                    _model.textController?.clear();
                                  });
                                  logFirebaseEvent('TextField_backend_call');
                                  _model.apiResultiu2 =
                                      await GetAddressFromLocationCall.call(
                                    latlng:
                                        '${functions.getLocationStrings(FFAppState().checklistItems.lastOrNull?.lastLocation)?.latitude},${functions.getLocationStrings(FFAppState().checklistItems.lastOrNull?.lastLocation)?.longitude}',
                                  );

                                  logFirebaseEvent(
                                      'TextField_update_app_state');
                                  FFAppState().updateChecklistItemsAtIndex(
                                    FFAppState().checklistItems.length - 1,
                                    (e) => e
                                      ..lastLocationAddress =
                                          valueOrDefault<String>(
                                        GetAddressFromLocationCall
                                            .formattedAddress(
                                          (_model.apiResultiu2?.jsonBody ?? ''),
                                        )?.firstOrNull,
                                        'Not updated yet.',
                                      )
                                      ..atHome = false
                                      ..updateLocationHistory(
                                        (e) => e.add(currentUserLocationValue!),
                                      ),
                                  );
                                  FFAppState().update(() {});
                                  logFirebaseEvent('TextField_show_snack_bar');
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Added Successfully.',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              font: GoogleFonts.ibmPlexMono(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .fontStyle,
                                            ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                      action: SnackBarAction(
                                        label: 'Undo',
                                        textColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        onPressed: () async {
                                          FFAppState().removeFromChecklistItems(
                                              FFAppState()
                                                  .checklistItems
                                                  .lastOrNull!);
                                          safeSetState(() {});
                                        },
                                      ),
                                    ),
                                  );
                                  logFirebaseEvent('TextField_custom_action');
                                  unawaited(
                                    () async {
                                      await actions.updateHomeWidgetData();
                                    }(),
                                  );
                                } else {
                                  logFirebaseEvent(
                                      'TextField_widget_animation');
                                  if (animationsMap[
                                          'textFieldOnActionTriggerAnimation'] !=
                                      null) {
                                    animationsMap[
                                            'textFieldOnActionTriggerAnimation']!
                                        .controller
                                        .forward(from: 0.0);
                                  }
                                }

                                safeSetState(() {});
                              },
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'Add Item',
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.add_rounded,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 20.0,
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .override(
                                    font: GoogleFonts.ibmPlexMono(
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .fontStyle,
                                    ),
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .fontStyle,
                                    lineHeight: 2.0,
                                  ),
                              textAlign: TextAlign.start,
                              cursorColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              validator: _model.textControllerValidator
                                  .asValidator(context),
                            ).animateOnActionTrigger(
                              animationsMap[
                                  'textFieldOnActionTriggerAnimation']!,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            final checkListItem = FFAppState()
                                .checklistItems
                                .where((e) => () {
                                      if (e.itemGroup ==
                                          FFAppState().currentItemGroup) {
                                        return true;
                                      } else if (FFAppState()
                                              .currentItemGroup ==
                                          0) {
                                        return true;
                                      } else {
                                        return false;
                                      }
                                    }())
                                .toList();

                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(checkListItem.length,
                                      (checkListItemIndex) {
                                final checkListItemItem =
                                    checkListItem[checkListItemIndex];
                                return Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 4.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Stack(
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'HOME_PAGE_PAGE_Container_ygnppqhv_ON_TAP');
                                          logFirebaseEvent(
                                              'Container_custom_action');
                                          _model.finalIndexFiltered =
                                              await actions.getItemsFinalIndex(
                                            checkListItemItem,
                                          );
                                          logFirebaseEvent(
                                              'Container_navigate_to');

                                          context.pushNamed(
                                            ItemDetailsViewWidget.routeName,
                                            queryParameters: {
                                              'itemIndex': serializeParam(
                                                _model.finalIndexFiltered,
                                                ParamType.int,
                                              ),
                                            }.withoutNulls,
                                          );

                                          safeSetState(() {});
                                        },
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          child: Container(
                                            width: double.infinity,
                                            constraints: BoxConstraints(
                                              maxHeight:
                                                  FFAppState().isCompactMode
                                                      ? 150.0
                                                      : 400.0,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              shape: BoxShape.rectangle,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 16.0,
                                                                0.0, 8.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Flexible(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    if (!FFAppState()
                                                                            .isCompactMode &&
                                                                        (checkListItemItem.itemImages.length >
                                                                            0))
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.all(4.0),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(10.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100.0,
                                                                            height:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              borderRadius: BorderRadius.circular(10.0),
                                                                            ),
                                                                            child:
                                                                                Visibility(
                                                                              visible: !FFAppState().isCompactMode && (checkListItemItem.itemImages.length > 0),
                                                                              child: Container(
                                                                                width: 100.0,
                                                                                height: 100.0,
                                                                                child: custom_widgets.ImageViewWithPathWidget(
                                                                                  width: 100.0,
                                                                                  height: 100.0,
                                                                                  imagePath: checkListItemItem.itemImages.firstOrNull,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        checkListItemItem
                                                                            .itemName,
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleLarge
                                                                            .override(
                                                                              font: GoogleFonts.ibmPlexMono(
                                                                                fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                              ),
                                                                              letterSpacing: 1.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              if (FFAppState()
                                                                  .isCompactMode)
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          8.0,
                                                                          16.0,
                                                                          8.0),
                                                                  child:
                                                                      SelectionArea(
                                                                          child:
                                                                              Text(
                                                                    checkListItemItem
                                                                        .lastLocationAddress,
                                                                    maxLines: 3,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.ibmPlexMono(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                          ),
                                                                          fontSize: FFAppState().isCompactMode
                                                                              ? 12.0
                                                                              : 0.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .fontStyle,
                                                                        ),
                                                                  )),
                                                                ),
                                                              if (FFAppState()
                                                                  .isCompactMode)
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          4.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      dateTimeFormat(
                                                                        "MMMM d, yyyy, h:mm a",
                                                                        checkListItemItem
                                                                            .lastTimeUpdated,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      ),
                                                                      'Not Updated Yet.',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.ibmPlexMono(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                          ),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          fontSize: FFAppState().isCompactMode
                                                                              ? 12.0
                                                                              : 0.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Builder(
                                                              builder:
                                                                  (context) =>
                                                                      Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            16.0,
                                                                            0.0,
                                                                            8.0),
                                                                child:
                                                                    FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'HOME_PAGE_PAGE_WITH_ME_BTN_ON_TAP');
                                                                    currentUserLocationValue = await getCurrentUserLocation(
                                                                        defaultLocation: LatLng(
                                                                            0.0,
                                                                            0.0));
                                                                    if (checkListItemItem
                                                                        .atHome) {
                                                                      logFirebaseEvent(
                                                                          'Button_alert_dialog');
                                                                      await showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (dialogContext) {
                                                                          return Dialog(
                                                                            elevation:
                                                                                0,
                                                                            insetPadding:
                                                                                EdgeInsets.zero,
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                            child:
                                                                                GestureDetector(
                                                                              onTap: () {
                                                                                FocusScope.of(dialogContext).unfocus();
                                                                                FocusManager.instance.primaryFocus?.unfocus();
                                                                              },
                                                                              child: ConfirmAlertViewWidget(
                                                                                alertTitle: 'Please Check',
                                                                                alertMessage: 'Do you confirm your item is With You?',
                                                                                action: () async {
                                                                                  currentUserLocationValue = await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
                                                                                  if (FFAppState().checklistItems.length > 0) {
                                                                                    logFirebaseEvent('_haptic_feedback');
                                                                                    HapticFeedback.mediumImpact();
                                                                                    logFirebaseEvent('_custom_action');
                                                                                    _model.finalIndexFilteredOnPrompt = await actions.getItemsFinalIndex(
                                                                                      checkListItemItem,
                                                                                    );
                                                                                    logFirebaseEvent('_update_app_state');
                                                                                    FFAppState().updateChecklistItemsAtIndex(
                                                                                      _model.finalIndexFilteredOnPrompt!,
                                                                                      (e) => e
                                                                                        ..lastTimeUpdated = getCurrentTimestamp
                                                                                        ..lastLocation = currentUserLocationValue
                                                                                        ..updateLocationHistory(
                                                                                          (e) => e.add(currentUserLocationValue!),
                                                                                        )
                                                                                        ..atHome = false,
                                                                                    );
                                                                                    FFAppState().update(() {});
                                                                                    logFirebaseEvent('_backend_call');
                                                                                    _model.apiResultiu1Copy = await GetAddressFromLocationCall.call(
                                                                                      latlng: '${functions.getLocationStrings(currentUserLocationValue)?.latitude},${functions.getLocationStrings(currentUserLocationValue)?.longitude}',
                                                                                    );

                                                                                    logFirebaseEvent('_update_app_state');
                                                                                    FFAppState().updateChecklistItemsAtIndex(
                                                                                      _model.finalIndexFilteredOnTap!,
                                                                                      (e) => e
                                                                                        ..lastLocationAddress = GetAddressFromLocationCall.formattedAddress(
                                                                                          (_model.apiResultiu1Copy?.jsonBody ?? ''),
                                                                                        )?.firstOrNull,
                                                                                    );
                                                                                    FFAppState().update(() {});
                                                                                  }
                                                                                },
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      );
                                                                    } else {
                                                                      if (FFAppState()
                                                                              .checklistItems
                                                                              .length >
                                                                          0) {
                                                                        logFirebaseEvent(
                                                                            'Button_haptic_feedback');
                                                                        HapticFeedback
                                                                            .mediumImpact();
                                                                        logFirebaseEvent(
                                                                            'Button_custom_action');
                                                                        _model.finalIndexFilteredOnTap =
                                                                            await actions.getItemsFinalIndex(
                                                                          checkListItemItem,
                                                                        );
                                                                        logFirebaseEvent(
                                                                            'Button_update_app_state');
                                                                        FFAppState()
                                                                            .updateChecklistItemsAtIndex(
                                                                          _model
                                                                              .finalIndexFilteredOnTap!,
                                                                          (e) => e
                                                                            ..lastTimeUpdated =
                                                                                getCurrentTimestamp
                                                                            ..lastLocation =
                                                                                currentUserLocationValue
                                                                            ..updateLocationHistory(
                                                                              (e) => e.add(currentUserLocationValue!),
                                                                            )
                                                                            ..updateLocationHistoryWithAddress(
                                                                              (e) => e.add(LatLongWithAddressStruct(
                                                                                latLong: currentUserLocationValue,
                                                                                address: 'Not updated yet.',
                                                                                dateTime: getCurrentTimestamp,
                                                                              )),
                                                                            ),
                                                                        );
                                                                        FFAppState()
                                                                            .update(() {});
                                                                        logFirebaseEvent(
                                                                            'Button_backend_call');
                                                                        _model.apiResultiu1 =
                                                                            await GetAddressFromLocationCall.call(
                                                                          latlng:
                                                                              '${functions.getLocationStrings(currentUserLocationValue)?.latitude},${functions.getLocationStrings(currentUserLocationValue)?.longitude}',
                                                                        );

                                                                        logFirebaseEvent(
                                                                            'Button_update_app_state');
                                                                        FFAppState()
                                                                            .updateChecklistItemsAtIndex(
                                                                          _model
                                                                              .finalIndexFilteredOnTap!,
                                                                          (e) => e
                                                                            ..lastLocationAddress =
                                                                                GetAddressFromLocationCall.formattedAddress(
                                                                              (_model.apiResultiu1?.jsonBody ?? ''),
                                                                            )?.firstOrNull
                                                                            ..updateLocationHistoryWithAddress(
                                                                              (e) => e[checkListItemItem.locationHistoryWithAddress.length - 1]
                                                                                ..address = GetAddressFromLocationCall.formattedAddress(
                                                                                  (_model.apiResultiu1?.jsonBody ?? ''),
                                                                                )?.firstOrNull,
                                                                            ),
                                                                        );
                                                                        FFAppState()
                                                                            .update(() {});
                                                                      }
                                                                    }

                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  text: checkListItemItem
                                                                          .atHome
                                                                      ? 'At Home'
                                                                      : 'With Me',
                                                                  options:
                                                                      FFButtonOptions(
                                                                    width:
                                                                        120.0,
                                                                    height:
                                                                        40.0,
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            0.0),
                                                                    iconPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    color: valueOrDefault<
                                                                        Color>(
                                                                      checkListItemItem.atHome
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .accent2
                                                                          : FlutterFlowTheme.of(context)
                                                                              .primaryBackground,
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                    ),
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.ibmPlexMono(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                          ),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                    elevation:
                                                                        0.0,
                                                                    borderSide:
                                                                        BorderSide(
                                                                      width:
                                                                          0.5,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  showLoadingIndicator:
                                                                      false,
                                                                ),
                                                              ),
                                                            ),
                                                            Builder(
                                                              builder: (context) =>
                                                                  FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'HOME_PAGE_PAGE_MAP_VIEW_BTN_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'Button_alert_dialog');
                                                                  await showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (dialogContext) {
                                                                      return Dialog(
                                                                        elevation:
                                                                            0,
                                                                        insetPadding:
                                                                            EdgeInsets.zero,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        alignment:
                                                                            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                        child:
                                                                            GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            FocusScope.of(dialogContext).unfocus();
                                                                            FocusManager.instance.primaryFocus?.unfocus();
                                                                          },
                                                                          child:
                                                                              MapViewWidget(
                                                                            location:
                                                                                checkListItemItem.lastLocation!,
                                                                            address:
                                                                                checkListItemItem.lastLocationAddress,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  );
                                                                },
                                                                text:
                                                                    'Map View',
                                                                options:
                                                                    FFButtonOptions(
                                                                  width: 120.0,
                                                                  height: 40.0,
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              0.0),
                                                                  iconPadding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .eerieBlack,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .ibmPlexMono(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternatePrimaryText,
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                  elevation:
                                                                      0.0,
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    width: 0.5,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 8.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                          child: Text(
                                                            'Last Time Updated:',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .ibmPlexMono(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      FFAppState()
                                                                              .isCompactMode
                                                                          ? 0.0
                                                                          : 12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Flexible(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      8.0,
                                                                      0.0),
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              dateTimeFormat(
                                                                "MMMM d, yyyy, h:mm a",
                                                                checkListItemItem
                                                                    .lastTimeUpdated,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              ),
                                                              'Not Updated Yet.',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .ibmPlexMono(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      FFAppState()
                                                                              .isCompactMode
                                                                          ? 0.0
                                                                          : 14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    16.0,
                                                                    8.0,
                                                                    4.0),
                                                        child: Text(
                                                          'Last Known Location: ',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .ibmPlexMono(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize:
                                                                    FFAppState()
                                                                            .isCompactMode
                                                                        ? 0.0
                                                                        : 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Flexible(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      8.0,
                                                                      8.0),
                                                          child: SelectionArea(
                                                              child: Text(
                                                            'Lat: ${valueOrDefault<String>(
                                                              functions
                                                                  .getLocationStrings(
                                                                      checkListItemItem
                                                                          .lastLocation)
                                                                  ?.latitude,
                                                              'Not updated yet.',
                                                            )}',
                                                            maxLines: 3,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .ibmPlexMono(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      FFAppState()
                                                                              .isCompactMode
                                                                          ? 0.0
                                                                          : 14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                          )),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Flexible(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      8.0,
                                                                      8.0),
                                                          child: SelectionArea(
                                                              child: Text(
                                                            'Long: ${valueOrDefault<String>(
                                                              functions
                                                                  .getLocationStrings(
                                                                      checkListItemItem
                                                                          .lastLocation)
                                                                  ?.longitude,
                                                              'Not updated yet.',
                                                            )}',
                                                            maxLines: 3,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .ibmPlexMono(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      FFAppState()
                                                                              .isCompactMode
                                                                          ? 0.0
                                                                          : 14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                          )),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Flexible(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      32.0,
                                                                      16.0),
                                                          child: SelectionArea(
                                                              child: Text(
                                                            checkListItemItem
                                                                .lastLocationAddress,
                                                            maxLines: 3,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .ibmPlexMono(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      FFAppState()
                                                                              .isCompactMode
                                                                          ? 0.0
                                                                          : 14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                          )),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      if (FFAppState().currentItemGroup == 0)
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  1.0, 1.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 20.0,
                                                    borderWidth: 0.0,
                                                    buttonSize: 30.0,
                                                    icon: Icon(
                                                      Icons
                                                          .keyboard_arrow_down_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 15.0,
                                                    ),
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'HOME_keyboard_arrow_down_rounded_ICN_ON_');
                                                      if (checkListItemIndex !=
                                                          (FFAppState()
                                                                  .checklistItems
                                                                  .length -
                                                              1)) {
                                                        logFirebaseEvent(
                                                            'IconButton_custom_action');
                                                        await actions
                                                            .moveItemDown(
                                                          checkListItemItem,
                                                        );
                                                        logFirebaseEvent(
                                                            'IconButton_update_app_state');
                                                        FFAppState()
                                                            .updateChecklistItemsAtIndex(
                                                          checkListItemIndex,
                                                          (e) => e
                                                            ..isItemBringed =
                                                                checkListItemItem
                                                                    .isItemBringed,
                                                        );
                                                        safeSetState(() {});
                                                        logFirebaseEvent(
                                                            'IconButton_widget_animation');
                                                        if (animationsMap[
                                                                'cardOnActionTriggerAnimation'] !=
                                                            null) {
                                                          safeSetState(() =>
                                                              hasCardTriggered =
                                                                  true);
                                                          SchedulerBinding
                                                              .instance
                                                              .addPostFrameCallback((_) async =>
                                                                  await animationsMap[
                                                                          'cardOnActionTriggerAnimation']!
                                                                      .controller
                                                                      .forward(
                                                                          from:
                                                                              0.0));
                                                        }
                                                      }
                                                    },
                                                  ),
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 20.0,
                                                    borderWidth: 0.0,
                                                    buttonSize: 30.0,
                                                    icon: Icon(
                                                      Icons.keyboard_arrow_up,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 15.0,
                                                    ),
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'HOME_keyboard_arrow_up_ICN_ON_TAP');
                                                      if (checkListItemIndex !=
                                                          0) {
                                                        logFirebaseEvent(
                                                            'IconButton_custom_action');
                                                        await actions
                                                            .moveItemUp(
                                                          checkListItemItem,
                                                        );
                                                        logFirebaseEvent(
                                                            'IconButton_update_app_state');
                                                        FFAppState()
                                                            .updateChecklistItemsAtIndex(
                                                          checkListItemIndex,
                                                          (e) => e
                                                            ..isItemBringed =
                                                                checkListItemItem
                                                                    .isItemBringed,
                                                        );
                                                        safeSetState(() {});
                                                        logFirebaseEvent(
                                                            'IconButton_widget_animation');
                                                        if (animationsMap[
                                                                'cardOnActionTriggerAnimation'] !=
                                                            null) {
                                                          safeSetState(() =>
                                                              hasCardTriggered =
                                                                  true);
                                                          SchedulerBinding
                                                              .instance
                                                              .addPostFrameCallback((_) async =>
                                                                  await animationsMap[
                                                                          'cardOnActionTriggerAnimation']!
                                                                      .controller
                                                                      .forward(
                                                                          from:
                                                                              0.0));
                                                        }
                                                      }
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                    ],
                                  ),
                                )
                                    .animateOnPageLoad(animationsMap[
                                        'cardOnPageLoadAnimation']!)
                                    .animateOnActionTrigger(
                                        animationsMap[
                                            'cardOnActionTriggerAnimation']!,
                                        hasBeenTriggered: hasCardTriggered);
                              })
                                  .divide(SizedBox(height: 16.0))
                                  .addToEnd(SizedBox(height: 50.0)),
                            );
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
      ),
    );
  }
}
