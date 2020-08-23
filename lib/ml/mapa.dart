import 'dart:async';

import 'package:firebaseml/landmark.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapaPage extends StatefulWidget {
  final Landmark landmark;
  MapaPage({Key key, @required this.landmark}) : super(key: key);

  @override
  _MapaPageState createState() => _MapaPageState(landmark);
}

class _MapaPageState extends State<MapaPage> {
  MapType _defaultMapType = MapType.normal;
  Completer<GoogleMapController> _controller = Completer();
  var currentLocation = LocationData;
  final Landmark landmark;
  _MapaPageState(this.landmark);

  void _changeMapType() {
    setState(() {
      _defaultMapType = _defaultMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  @override
  void initState() {
    super.initState();
    // Additional initialization of the State
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(landmark.landmark),
        centerTitle: true,
      ),
      body: Stack(children: <Widget>[
        GoogleMap(
          mapType: _defaultMapType,
          myLocationEnabled: true,
          initialCameraPosition: CameraPosition(
              target: LatLng(this.landmark.latitude, this.landmark.longitude),
              zoom: 15),
        ),
        Container(
          margin: EdgeInsets.only(top: 80, right: 10),
          alignment: Alignment.topRight,
          child: Column(children: <Widget>[
            FloatingActionButton(
                child: Icon(Icons.layers),
                elevation: 5,
                backgroundColor: Colors.teal[200],
                onPressed: () {
                  _changeMapType();
                  print('Changing the Map Type');
                }),
          ]),
        ),
      ]),
    );
  }
}
