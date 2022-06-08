import 'package:crime_down_app/navigation.dart';
import 'package:flutter/material.dart';

class Save extends StatefulWidget {
  const Save({Key? key}) : super(key: key);

  @override
  State<Save> createState() => _SaveState();
}

class _SaveState extends State<Save> {
  var delete = false;

  List<Widget> content = [
    Padding(
      padding: const EdgeInsets.fromLTRB(40, 40, 40, 0),
      child: Image.asset(
        'assets/content1_save.png',
      ),
    ),
    Padding(
      padding: const EdgeInsets.fromLTRB(40, 40, 40, 0),
      child: Image.asset(
        'assets/content2_save.png',
      ),
    ),
    Padding(
      padding: const EdgeInsets.fromLTRB(40, 40, 40, 0),
      child: Image.asset(
        'assets/content3_save.png',
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.asset(
            'assets/header_save.png',
            fit: BoxFit.fitWidth,
          ),
          GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (contex) => const Navigation()));
              },
              child: content[0]),
          delete == false
              ? Column(
                  children: [
                    GestureDetector(
                        onTap: () {
                          delete = true;
                          setState(() {
                            content.removeAt(1);
                          });
                        },
                        child: content[1]),
                    content[2]
                  ],
                )
              : content[1]
        ],
      ),
    );
  }
}
