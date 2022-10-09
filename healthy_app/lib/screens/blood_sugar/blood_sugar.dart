import 'dart:ffi';

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
    List<Float> bloodPercentage = <Float>[];
    List<DateTime> date = <DateTime>[];
    return Column(
      children: [
        Header(size: size),
        Padding(
          padding: const EdgeInsets.only(
              right: kDefaultPadding, left: kDefaultPadding / 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Button(
                      icon: const Icon(Icons.add),
                      operation: () {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) {
                              return addBloodSugarRecord(context);
                            });
                      }),
                  Button(icon: const Icon(Icons.remove), operation: () {}),
                  Button(icon: const Icon(Icons.edit), operation: () {}),
                ],
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.65,
                  height: MediaQuery.of(context).size.height / 2,
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

  AlertDialog addBloodSugarRecord(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      contentPadding: const EdgeInsets.all(kDefaultPadding),
      titlePadding: const EdgeInsets.only(
          top: kDefaultPadding, left: kDefaultPadding, right: kDefaultPadding),
      title: const Text('Blood Sugar Record: '),
      content: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(
                  Icons.bloodtype,
                  color: kPrimaryColor,
                  size: kDefaultPadding * 4,
                ),
                Icon(
                  Icons.date_range,
                  color: kPrimaryColor,
                  size: kDefaultPadding * 4,
                ),
              ],
            ),
            Row(
              children: [
                
              ],
            ),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(kDefaultPadding / 2),
          child: Row(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Ok'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
