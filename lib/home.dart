import 'dart:async';
import 'package:crime_down_app/calling.dart';
import 'package:crime_down_app/global_variable.dart';
import 'package:crime_down_app/report_clue.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'search.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Position? position;
  CameraPosition? cameraPosition;
  BitmapDescriptor? mk0;
  BitmapDescriptor? mk1;
  BitmapDescriptor? mk2;
  BitmapDescriptor? mk3;
  final Set<Marker> _markers = {};
  Set<Circle>? zone;

  void setMarker() async {
    mk0 = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), 'assets/police_marker.png');
    mk1 = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), 'assets/121.png');
    mk2 = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), 'assets/21.png');
    mk3 = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), 'assets/7.png');
  }

  void onCreateMap(GoogleMapController controller) {
    setState(() {
      _markers.add(Marker(
          markerId: const MarkerId('0'),
          position: const LatLng(7.89209578349211, 98.38558396967984),
          consumeTapEvents: true,
          icon: mk0!,
          onTap: () {
            _show('assets/police_station_popup.png', 1);
          }));
      _markers.add(Marker(
          markerId: const MarkerId('1'),
          position: const LatLng(7.895938644287658, 98.40125932049747),
          consumeTapEvents: true,
          icon: mk1!));
      _markers.add(Marker(
          markerId: const MarkerId('2'),
          position: const LatLng(7.889590416012022, 98.3982826882354),
          consumeTapEvents: true,
          icon: mk2!));
      _markers.add(Marker(
          markerId: const MarkerId('3'),
          position: const LatLng(7.8898456453791015, 98.40514480166946),
          consumeTapEvents: true,
          icon: mk3!));
    });
  }

  void crimeDetailPopup() {
    showModalBottomSheet<void>(
      backgroundColor: Colors.white.withOpacity(0),
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.9,
          child: ListView(
            children: [
              Image.asset(
                "assets/crime_sheet.png",
                fit: BoxFit.fitWidth,
              ),
            ],
          ),
        );
      },
    );
  }

  Future<Position> getPosition() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    cameraPosition = CameraPosition(
        target: LatLng(position!.latitude, position!.longitude), zoom: 15);
    camPosition = cameraPosition!;
    myPosition = LatLng(position!.latitude, position!.longitude);
    return position!;
  }

  void _show(String img, x) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return GestureDetector(
          child: AlertDialog(
            backgroundColor: Colors.black.withAlpha(0),
            contentPadding: const EdgeInsets.all(0),
            content: Image.asset(
              img,
            ),
          ),
          onTap: () {
            if (x == 0) {
              crimeDetailPopup();
            }
            if (x == 1) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Calling()));
            }
            if (x == 2) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ReportClue()));
            }
          },
        );
      },
    );
  }

  void allZone() {
    zone = {
      Circle(
          circleId: const CircleId('1'),
          center: const LatLng(7.895938644287658, 98.40125932049747),
          radius: 250,
          fillColor: Colors.red.withOpacity(0.5),
          strokeColor: Colors.red.withOpacity(1),
          strokeWidth: 2,
          consumeTapEvents: true,
          onTap: () {
            crimeDetailPopup();
          }),
      Circle(
          circleId: const CircleId('2'),
          center: const LatLng(7.889590416012022, 98.3982826882354),
          radius: 200,
          fillColor: Colors.orange.withOpacity(0.5),
          strokeColor: Colors.orange.withOpacity(1),
          strokeWidth: 2),
      Circle(
          circleId: const CircleId('3'),
          center: const LatLng(7.8898456453791015, 98.40514480166946),
          radius: 150,
          fillColor: Colors.yellow.withOpacity(0.5),
          strokeColor: Colors.yellow.withOpacity(1),
          strokeWidth: 2),
    };
  }

  void popup(String img, int t, int fn) {
    Future.delayed(Duration(seconds: t), () {
      _show(img, fn);
    });
  }

  @override
  void initState() {
    super.initState();
    setMarker();
    allZone();
    popup('assets/report_clue_popup.png', 5, 2);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getPosition(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Stack(
              children: [
                googleMap(),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: searchBox(),
                ),
              ],
            );
          } else {
            return const Center(
                child: CircularProgressIndicator(
              color: Color.fromRGBO(46, 103, 151, 1),
            ));
          }
        });
  }

  Widget googleMap() {
    return GoogleMap(
      circles: zone!,
      myLocationButtonEnabled: false,
      myLocationEnabled: true,
      initialCameraPosition: cameraPosition!,
      onMapCreated: onCreateMap,
      markers: _markers,
    );
  }

  Widget searchBox() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Search()));
      },
      child: Image.asset(
        'assets/search_box.png',
        alignment: Alignment.topCenter,
      ),
    );
  }
} //end
