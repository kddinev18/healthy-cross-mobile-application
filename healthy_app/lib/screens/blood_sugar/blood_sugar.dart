import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthy_app/constants.dart';
import 'package:healthy_app/screens/home/components/menu_container.dart';

import '../home/components/header.dart';
import '../home/components/title_with_underscore.dart';
import 'components/button.dart';

class BloodSugar extends StatefulWidget {
  const BloodSugar({required Key key}) : super(key: key);

  @override
  State<BloodSugar> createState() => _BloodSugarState();
}

class _BloodSugarState extends State<BloodSugar> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Header(size: size),
        Padding(
          padding: const EdgeInsets.only(
              right: kDefaultPadding, left: kDefaultPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: const [
                  Button(icon: Icon(Icons.add)),
                  Button(icon: Icon(Icons.remove)),
                  Button(icon: Icon(Icons.edit)),
                ],
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: MediaQuery.of(context).size.height / 1.6,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(0, 10),
                            blurRadius: 50,
                            color: kPrimaryColor.withOpacity(0.23))
                      ]),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
