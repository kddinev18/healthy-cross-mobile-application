import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class RecipeContainer extends StatelessWidget {
  const RecipeContainer({
    Key? key,
    required this.name,
    required this.path1,
    required this.path2,
    required this.path3,
  }) : super(key: key);

  final String name;
  final String path1;
  final String path2;
  final String path3;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) => _buildPopupDialog(context),
        );
      },
      child: Container(
        child: Container(
          width: MediaQuery.of(context).size.width - kDefaultPadding * 2,
          height: 55,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: kPrimaryColor),
          child: Row(
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: dynamicFontSize(context, name)),
              Spacer(),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white.withOpacity(0.25)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        'Type: ',
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      typeContainer(context, path1),
                      typeContainer(context, path2),
                      typeContainer(context, path3),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPopupDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Menu: '),
      content: Container(
        child: Column(
          children: [Text('hi')],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          //textColor: Theme.of(context).primaryColor,
          child: const Text('Close'),
        ),
      ],
    );
  }

  Text dynamicFontSize(BuildContext context, String name) {
    double fontSize = 0;
    String finalName = "";
    if (name.length <= 16) {
      if (name.length > 14) {
        finalName = name;
        fontSize = 15.0;
      } else {
        finalName = name;
        fontSize = 20.0;
      }
    } else {
      fontSize = 15.0;
      for (int i = 0; i < 16; i++) {
        finalName += name[i];
      }
      finalName += "...";
    }
    return Text(finalName,
        style: Theme.of(context).textTheme.headline5!.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: fontSize));
  }

  Container typeContainer(BuildContext context, String path) {
    if (path == "") {
      return Container(
        width: MediaQuery.of(context).size.width / 10.5,
        height: MediaQuery.of(context).size.width / 10.5,
      );
    } else {
      return Container(
        width: MediaQuery.of(context).size.width / 10.5,
        height: MediaQuery.of(context).size.width / 10.5,
        child: SvgPicture.asset(path),
      );
    }
  }
}
