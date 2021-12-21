// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthy_app/constants.dart';
import 'package:healthy_app/screens/home/components/body.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  int index2 = 1;
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
    ),
    Body(),
    Scaffold(),
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(),
      body: /*const Body()*/ _widgetOptions.elementAt(index2),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              offset: const Offset(0, -10),
              blurRadius: 50,
              color: kPrimaryColor.withOpacity(0.23))
        ]),
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
              iconData: Icons.medication,
              label: 'Medicine',
            ),
            FFNavigationBarItem(
              iconData: Icons.book,
              label: 'Menus',
            ),
            FFNavigationBarItem(
              iconData: Icons.water,
              label: 'Blood Sugar',
            ),
          ],
        ),
      ),
    );
  }

  PreferredSize homeAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(15),
      child: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
      ),
    );
  }
}
