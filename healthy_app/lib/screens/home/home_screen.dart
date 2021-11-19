// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthy_app/constants.dart';
import 'package:healthy_app/screens/home/components/body.dart';

import 'components/navigation_bar.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  int index2 = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(),
      body: const Body(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(),
        child: FFNavigationBar(
          theme: FFNavigationBarTheme(
            barBackgroundColor: Colors.white,
            selectedItemBorderColor: Colors.white,
            selectedItemBackgroundColor: kPrimaryColor,
            selectedItemIconColor: Colors.white,
            selectedItemLabelColor: Colors.black,
          ),
          selectedIndex: index2,
          onSelectTab: (index) {
            setState(() {
              index2 = index;
            });
          },
          items: [
            FFNavigationBarItem(
              iconData: Icons.calendar_today,
              label: 'Schedule',
            ),
            FFNavigationBarItem(
              iconData: Icons.people,
              label: 'Contacts',
            ),
            FFNavigationBarItem(
              iconData: Icons.attach_money,
              label: 'Bills',
            ),
          ],
        ),
      ),
    );
  }

  PreferredSize homeAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(10),
      child: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
      ),
    );
  }
}
