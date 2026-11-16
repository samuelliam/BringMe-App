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
import 'item_view_widget.dart' show ItemViewWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ItemViewModel extends FlutterFlowModel<ItemViewWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Stores action output result for [Custom Action - getCurrentImageData] action in ImageViewWithPathWidget widget.
  FFUploadedFile? imageData;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for Switch widget.
  bool? switchValue;
  // Stores action output result for [Backend Call - API (getAddressFromLocation)] action in Button widget.
  ApiCallResponse? apiResultiu1Copy;
  // Stores action output result for [Backend Call - API (getAddressFromLocation)] action in Button widget.
  ApiCallResponse? apiResultiu1;
  bool isDataUploading_uploadDataGor = false;
  FFUploadedFile uploadedLocalFile_uploadDataGor =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Custom Action - getImagePath] action in Button widget.
  String? uploadedImagePath;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
