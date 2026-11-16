import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'map_only_view_model.dart';
export 'map_only_view_model.dart';

class MapOnlyViewWidget extends StatefulWidget {
  const MapOnlyViewWidget({
    super.key,
    required this.latlong,
  });

  final LatLng? latlong;

  @override
  State<MapOnlyViewWidget> createState() => _MapOnlyViewWidgetState();
}

class _MapOnlyViewWidgetState extends State<MapOnlyViewWidget> {
  late MapOnlyViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapOnlyViewModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final _googleMapMarker = widget!.latlong;
      return FlutterFlowGoogleMap(
        controller: _model.googleMapsController,
        onCameraIdle: (latLng) => _model.googleMapsCenter = latLng,
        initialLocation: _model.googleMapsCenter ??= widget!.latlong!,
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
        initialZoom: 14.0,
        allowInteraction: false,
        allowZoom: false,
        showZoomControls: true,
        showLocation: true,
        showCompass: true,
        showMapToolbar: true,
        showTraffic: false,
        centerMapOnMarkerTap: true,
      );
    });
  }
}
