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
import 'home_page_widget.dart' show HomePageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  int itemCheckerIndex = 0;

  int? refreshFirebaseIndex = 0;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (getAddressFromLocation)] action in TextField widget.
  ApiCallResponse? apiResultiu2;
  // Stores action output result for [Custom Action - getItemsFinalIndex] action in Container widget.
  int? finalIndexFiltered;
  // Stores action output result for [Backend Call - API (getAddressFromLocation)] action in Button widget.
  ApiCallResponse? apiResultiu1Copy;
  // Stores action output result for [Custom Action - getItemsFinalIndex] action in Button widget.
  int? finalIndexFilteredOnPrompt;
  // Stores action output result for [Custom Action - getItemsFinalIndex] action in Button widget.
  int? finalIndexFilteredOnTap;
  // Stores action output result for [Backend Call - API (getAddressFromLocation)] action in Button widget.
  ApiCallResponse? apiResultiu1;
  // State field(s) for DropDown widget.
  int? dropDownValue;
  FormFieldController<int>? dropDownValueController;
  // Stores action output result for [Custom Action - getLocationHistoryLatLongList] action in Card widget.
  List<LatLng>? locationList;
  // Stores action output result for [Firestore Query - Query a collection] action in Card widget.
  List<ItemsRecord>? fetchedUserItem;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
