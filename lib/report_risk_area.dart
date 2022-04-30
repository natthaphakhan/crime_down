import 'package:flutter/material.dart';

import 'open_camera.dart';
import 'select_location.dart';

class ReportRiskArea extends StatefulWidget {
  const ReportRiskArea({Key? key}) : super(key: key);

  @override
  State<ReportRiskArea> createState() => _ReportRiskAreaState();
}

class _ReportRiskAreaState extends State<ReportRiskArea> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 140, 20, 20),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Text(
                            'แจ้งเพิ่มพื้นที่เสี่ยง',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        GestureDetector(
                          child: Image.asset('assets/select_location.png'),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SelectLocation()));
                          },
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Text(
                            'เพิ่มรูปภาพ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        GestureDetector(
                          child: Image.asset('assets/add_picture.png'),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Opencamera()));
                          },
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Text(
                            'รายละเอียด',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                            width: 375,
                            height: 125,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(20)),
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: TextField(
                                decoration:
                                    InputDecoration(border: InputBorder.none),
                              ),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Image.asset(
              'assets/header_setting_save.png',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fitWidth,
            ),
            Positioned(
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
            ),
          ],
        ),
      )),
    );
  }
}
