// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthy_app/constants.dart';
import 'package:healthy_app/screens/home/components/body.dart';

import 'components/navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(),
      body: Stack(
        children: const [
          Body(),
          NavigationBar(
            key: null,
          ),
        ],
      ),
    );
  }

  PreferredSize homeAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(10),
      child: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/menu.svg"),
          onPressed: () {},
        ),
      ),
    );
  }
}
