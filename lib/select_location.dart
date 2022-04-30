import 'package:crime_down_app/global_variable.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SelectLocation extends StatefulWidget {
  const SelectLocation({Key? key}) : super(key: key);

  @override
  State<SelectLocation> createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            googleMap(),
            Image.asset(
              'assets/header_select_location.png',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fitWidth,
            ),
            Center(
              child: Image.asset(
                'assets/marker.png',
                scale: 2,
              ),
            ),
            tapToClose()
          ],
        ),
      ),
    );
  }

  Widget tapToClose() {
    return Positioned(
      left: 330,
      top: 70,
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          width: 50,
          height: 20,
          color: Colors.red.withOpacity(0),
        ),
      ),
    );
  }

  Widget googleMap() {
    return GoogleMap(
        myLocationEnabled: true, initialCameraPosition: camPosition);
  }
}//end
