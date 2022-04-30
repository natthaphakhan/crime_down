import 'package:crime_down_app/select_report_app_problem.dart';
import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool _switch1 = true;
  bool _switch2 = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/header_setting.png',
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fitWidth,
        ),
        Expanded(
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'ทั่วไป',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  _row(
                      'ภาษา',
                      Row(
                        children: const [
                          Text(
                            'ภาษาไทย (TH) ',
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.grey,
                          )
                        ],
                      )),
                  _row(
                      'การแจ้งเตือน',
                      Switch(
                        value: _switch1,
                        onChanged: _onChanged1,
                        activeColor: Colors.pink,
                      )),
                  _row(
                      'จัดการบัญชี',
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.grey,
                      )),
                  const Text(
                    'แผนที่',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  _row(
                      'หน่วยระยะทาง/หน่วยวัด',
                      Row(
                        children: const [
                          Text(
                            'กิโลเมตร (กม.) ',
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.grey,
                          )
                        ],
                      )),
                  _row(
                      'รูปแบบแผนที่เริ่มต้น',
                      Row(
                        children: const [
                          Text(
                            'ค่าเริ่มต้น ',
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.grey,
                          )
                        ],
                      )),
                  _row(
                      'โหมดการนำทางด้วยเสียง',
                      Switch(
                        value: _switch2,
                        onChanged: _onChanged2,
                        activeColor: Colors.pink,
                      )),
                  const Text(
                    'เพิ่มเติม',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SelectAppProblem()));
                    },
                    child: _row(
                        'แจ้งปัญหา/ปรับปรุง',
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.grey,
                        )),
                  ),
                  _row(
                      'ติดต่อผู้พัฒนา',
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.grey,
                      )),
                ],
              ),
            ),
          ),
        )
      ],
    );
  } // build context

  Widget _row(String txt, x) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(txt, style: const TextStyle(fontSize: 16)), x],
    );
  }

  void _onChanged1(bool onChanged) {
    setState(() {
      _switch1 = !_switch1;
    });
  }

  void _onChanged2(bool onChanged) {
    setState(() {
      _switch2 = !_switch2;
    });
  }
}//end
