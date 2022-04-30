import 'package:flutter/material.dart';

import 'navigation.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              Image.asset(
                'assets/header_search.png',
                alignment: Alignment.topCenter,
                fit: BoxFit.fitWidth,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width - 50, 50, 0, 0),
                  child: Container(
                    width: 20,
                    height: 20,
                    color: Colors.red.withOpacity(0),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 120, 25, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width / 8,
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(1, 1))
                      ],
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      decoration: InputDecoration(border: InputBorder.none),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 200, 25, 0),
                child: Column(
                  children: [
                    Image.asset('assets/drop_down_province.png'),
                    const SizedBox(
                      height: 10,
                    ),
                    Image.asset('assets/drop_down_district.png'),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 427,
                        child: ListView(children: [
                          GestureDetector(
                            child: Image.asset('assets/search_result.png'),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const Navigation()));
                            },
                          )
                        ])),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
