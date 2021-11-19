import 'package:flutter/material.dart';

import '../../../constants.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({
    required Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
          height: MediaQuery.of(context).size.height / 12,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 50,
                    color: kPrimaryColor.withOpacity(0.23))
              ])),
    );
  }
}
