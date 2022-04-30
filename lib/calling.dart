import 'dart:async';

import 'package:flutter/material.dart';

class Calling extends StatefulWidget {
  const Calling({Key? key}) : super(key: key);

  @override
  State<Calling> createState() => _CallingState();
}

class _CallingState extends State<Calling> {
  Duration duration = const Duration();
  Timer? timer;
  bool volumeOn = true;
  bool camOn = true;
  bool micOn = true;

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime());
  }

  void addTime() {
    const addSec = 1;
    setState(() {
      var sec = duration.inSeconds + addSec;
      duration = Duration(seconds: sec);
    });
  }

  @override
  void initState() {
    super.initState();

    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              'assets/call_page_bg.png',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fitWidth,
            ),
            Center(child: Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: time(),
            )),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 600, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  onTapIcon(Icons.volume_up),
                  onTapIcon(Icons.videocam),
                  onTapIcon(Icons.mic),
                  GestureDetector(
                    child: Image.asset('assets/outcall.png', scale: 2),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget onTapIcon(IconData ic) {
    return IconButton(
      iconSize: 40,
      icon: changeIcon(ic),
      onPressed: () {
        if (ic == Icons.volume_up) {
          setState(() {
            volumeOn = !volumeOn;
          });
        }
        if (ic == Icons.videocam) {
          setState(() {
            camOn = !camOn;
          });
        }
        if (ic == Icons.mic) {
          setState(() {
            micOn = !micOn;
          });
        }
      },
    );
  }

  Widget changeIcon(IconData x) {
    if (volumeOn == true && x == Icons.volume_up) {
      return const Icon(Icons.volume_up, color: Colors.white);
    }
    if (volumeOn == false && x == Icons.volume_up) {
      return const Icon(Icons.volume_off, color: Colors.white);
    }
    if (camOn == true && x == Icons.videocam) {
      return const Icon(Icons.videocam, color: Colors.white);
    }
    if (camOn == false && x == Icons.videocam) {
      return const Icon(Icons.videocam_off, color: Colors.white);
    }
    if (micOn == true && x == Icons.mic) {
      return const Icon(Icons.mic, color: Colors.white);
    }
    if (micOn == false && x == Icons.mic) {
      return const Icon(Icons.mic_off, color: Colors.white);
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget time() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return Text(
      '$minutes:$seconds',
      style: const TextStyle(color: Colors.white,fontSize: 20),
    );
  }
}//end
