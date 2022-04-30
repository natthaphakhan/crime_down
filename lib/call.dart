import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:slidable_button/slidable_button.dart';

import 'calling.dart';
import 'global_variable.dart';

class Call extends StatefulWidget {
  const Call({Key? key}) : super(key: key);

  @override
  State<Call> createState() => _CallState();
}

class _CallState extends State<Call> {
  void popupCallOption() {
    showModalBottomSheet<void>(
      backgroundColor: Colors.red.withOpacity(0),
      context: context,
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 1),
                child: inCallOption('ศูนย์รับแจ้งเหตุ 191',
                    const Color.fromRGBO(46, 103, 151, 1), '0'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 1),
                child: inCallOption('07-621-2046 (ตำรวจภูธรภูเก็ต)',
                    const Color.fromRGBO(46, 103, 151, 1), '1'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: inCallOption(
                    'ยกเลิก', const Color.fromRGBO(211, 70, 72, 1), '2'),
              ),
            ],
          ),
        );
      },
    );
  }

  void sos(String txt) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          content: Text(
            txt,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  Widget inCallOption(String txt, Color cl, String x) {
    return GestureDetector(
      onTap: () {
        if (x == '0') {
          log('Call 191 !');
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Calling()));
        }
        if (x == '1') {
          log('Call Police Station !');
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Calling()));
        }
        if (x == '2') {
          Navigator.pop(context);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width / 1.2,
        height: MediaQuery.of(context).size.width / 7,
        child: Text(
          txt,
          style: TextStyle(color: cl, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/call_bg.png',
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fitWidth,
        ),
        Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 8),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: slideButton(
                    'เลื่อนขวาเพื่อแจ้งเหตุ', 'assets/call_button.png', '0'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: slideButton(
                    'เลื่อนขวากรณีฉุกเฉิน', 'assets/sos_button.png', '1'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget slideButton(String txt, String img, String x) {
    return SlidableButton(
      isRestart: true,
      width: MediaQuery.of(context).size.width / 1.5,
      height: MediaQuery.of(context).size.width / 5.5,
      color: Colors.grey.shade100.withOpacity(0.5),
      buttonColor: Colors.black.withOpacity(0),
      dismissible: false,
      label: Center(child: Image.asset(img)),
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              txt,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      onChanged: (position) {
        if (x == '0' && position == SlidableButtonPosition.right) {
          setState(() {
            popupCallOption();
          });
        }
        if (x == '1' && position == SlidableButtonPosition.right) {
          setState(() {
            sos('กำลังส่งตำแหน่งของคุณ...');
            Future.delayed(const Duration(seconds: 2), () {
              setState(() {
                Navigator.pop(context);
                sos('เราได้รับตำแหน่งของคุณแล้ว\nเรากำลังเร่งดำเนินการเพื่อช่วยเหลือคุณ');
                log('Your location >>> $myPosition');
                Future.delayed(const Duration(seconds: 2), () {
                  Navigator.pop(context);
                });
              });
            });
          });
        }
      },
    );
  }
} // end
