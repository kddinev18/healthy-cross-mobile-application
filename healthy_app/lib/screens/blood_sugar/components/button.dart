import 'package:flutter/material.dart';

import '../../../constants.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.icon,
  }) : super(key: key);

  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kDefaultPadding),
          color: kPrimaryColor,
        ),
        child: IconButton(
          onPressed: () {},
          icon: icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
