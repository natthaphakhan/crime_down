import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class Opencamera extends StatefulWidget {
  const Opencamera({Key? key}) : super(key: key);

  @override
  State<Opencamera> createState() => _OpencameraState();
}

class _OpencameraState extends State<Opencamera> {
  late CameraController controller;

  @override
  void initState() {
    super.initState();
    controller = CameraController(cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return CameraPreview(controller);
  }
}
