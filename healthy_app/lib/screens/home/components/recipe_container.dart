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
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Container(
              width: MediaQuery.of(context).size.width - kDefaultPadding * 2,
              height: 55,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: kPrimaryColor),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      name,
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: fontSize(name)),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white.withOpacity(0.25)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              'Type: ',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
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
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  double fontSize(String name) {
    if (name.length <= 16) {
      if (name.length > 14) {
        return 16.0;
      } else {
        return 20.0;
      }
    } else {
      return 10.0;
    }
  }

  Container typeContainer(BuildContext context, String path) {
    if (path == "") {
      return Container(
        width: MediaQuery.of(context).size.width / 10.5,
        height: MediaQuery.of(context).size.width / 10.5,
        child: SvgPicture.asset(path),
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
