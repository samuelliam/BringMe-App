import '/components/item_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'item_details_view_widget.dart' show ItemDetailsViewWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ItemDetailsViewModel extends FlutterFlowModel<ItemDetailsViewWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for itemView component.
  late ItemViewModel itemViewModel;

  @override
  void initState(BuildContext context) {
    itemViewModel = createModel(context, () => ItemViewModel());
  }

  @override
  void dispose() {
    itemViewModel.dispose();
  }
}
