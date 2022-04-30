import 'package:camera/camera.dart';
import 'package:crime_down_app/menu.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

late List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Crime Down',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme:
              GoogleFonts.notoSansThaiTextTheme(Theme.of(context).textTheme),
          brightness: Brightness.light,
          primaryColor: const Color.fromRGBO(46, 103, 151, 1),
        ),
        home: const SafeArea(child: Menu()));
  }
}
