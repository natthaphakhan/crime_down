import 'package:crime_down_app/call.dart';
import 'package:crime_down_app/home.dart';
import 'package:crime_down_app/save.dart';
import 'package:crime_down_app/setting.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int selectedIndex = 0;

  void onTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List<Widget> page = [
    const Home(),
    const Save(),
    const Call(),
    const Setting(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Image.asset('assets/home_icon.png', scale: 2),
              label: 'หน้าแรก'),
          BottomNavigationBarItem(
              icon: Image.asset('assets/save_icon.png', scale: 2),
              label: 'บันทึก'),
          BottomNavigationBarItem(
              icon: Image.asset('assets/call_icon.png', scale: 2),
              label: 'แจ้งเหตุ'),
          BottomNavigationBarItem(
              icon: Image.asset('assets/setting_icon.png', scale: 2),
              label: 'ตั้งค่า'),
        ],
        showUnselectedLabels: true,
        currentIndex: selectedIndex,
        selectedItemColor: const Color.fromRGBO(46, 103, 151, 1),
        unselectedItemColor: Colors.grey,
        onTap: onTapped,
      ),
    );
  }
}
