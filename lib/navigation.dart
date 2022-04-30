import 'package:crime_down_app/global_variable.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  final Set<Marker> _markers = {};
  final Set<Polyline> _polyline = {};
  final LatLng destination = const LatLng(7.892061536459044, 98.38562100027727);
  var _tapStart = false;

  final List<LatLng> _list = [];

  void _createLine(GoogleMapController _controller) {
    setState(() {
      _markers
          .add(Marker(markerId: const MarkerId('1'), position: destination));
      _polyline.add(Polyline(
        polylineId: const PolylineId('1'),
        visible: true,
        points: _list,
        color: Colors.blue,
        startCap: Cap.roundCap,
        endCap: Cap.roundCap,
      ));
    });
  }

  @override
  void initState() {
    super.initState();
    _list.add(myPosition);

    _list.add(const LatLng(7.895194300000014, 98.402444987308));
    _list.add(const LatLng(7.891368512880226, 98.40037432194475));
    _list.add(const LatLng(7.890188888033346, 98.39660850049073));
    _list.add(const LatLng(7.891060322914069, 98.39184489726493));
    _list.add(const LatLng(7.8904864513788935, 98.39003172397463));
    _list.add(const LatLng(7.891963637614862, 98.38972058774615));
    _list.add(const LatLng(7.891581057511792, 98.3858367490657));
    _list.add(const LatLng(7.891963637625841, 98.38566508769611));

    _list.add(destination);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: camPosition,
            myLocationButtonEnabled: false,
            myLocationEnabled: true,
            markers: _markers,
            polylines: _polyline,
            onMapCreated: _createLine,
          ),
          if (_tapStart == false)
            Padding(
              padding: const EdgeInsets.all(20),
              child: Image.asset('assets/search_navigation.png'),
            )
          else
            Container(),
          if (_tapStart == false)
            _button('assets/start_navigate_button.png', 530)
          else
            _button('assets/end_navigate_button.png', 480),
          if (_tapStart == true) _bottomSheet() else Container()
        ],
      )),
    );
  }

  Widget _button(String img, double _top) {
    return Positioned(
      top: _top,
      left: 20,
      child: GestureDetector(
        child: Image.asset(img, scale: 2),
        onTap: () {
          setState(() {
            _tapStart = !_tapStart;
          });
        },
      ),
    );
  }

  Widget _bottomSheet() {
    return Positioned(
      top: 580,
      child: Image.asset(
        'assets/bottom_sheet_navigation.png',
        fit: BoxFit.fitWidth,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}//end
