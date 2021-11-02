import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class RecipeContainer extends StatelessWidget {
  const RecipeContainer({
    Key? key,
    required this.path1,
    required this.path2,
    required this.path3,
  }) : super(key: key);

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
                      'Name: ',
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
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
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container typeContainer(BuildContext context, String path) {
    return Container(
      width: MediaQuery.of(context).size.width / 11,
      height: MediaQuery.of(context).size.width / 11,
      child: SvgPicture.asset(path),
    );
  }
}
