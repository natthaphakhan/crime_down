import 'package:crime_down_app/report_risk_area.dart';
import 'package:flutter/material.dart';

class SelectAppProblem extends StatefulWidget {
  const SelectAppProblem({Key? key}) : super(key: key);

  @override
  State<SelectAppProblem> createState() => _SelectAppProblemState();
}

class _SelectAppProblemState extends State<SelectAppProblem> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/header_setting_back.png',
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth,
              ),
              Positioned(
                left: 300,
                top: 70,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 70,
                    height: 20,
                    color: Colors.red.withOpacity(0),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              height: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'แจ้งปัญหา/ปรับปรุง',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  _row(
                      'แจ้งปัญหา/ปรับปรุงแอปพลิเคชัน',
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.grey,
                      )),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ReportRiskArea()));
                    },
                    child: _row(
                        'แจ้งเพิ่มพื้นที่เสี่ยง',
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.grey,
                        )),
                  ),
                  _row(
                      'แจ้งปรับปรุงข้อมูล',
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.grey,
                      )),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }

  Widget _row(String txt, x) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(txt, style: const TextStyle(fontSize: 16)), x],
    );
  }
}//end
