import 'package:flutter/material.dart';
import 'package:healthy_app/screens/home/components/title_with_underscore.dart';

// ignore: import_of_legacy_library_into_null_safe
import '../../../constants.dart';

class RecipeContainer extends StatelessWidget {
  const RecipeContainer({
    Key? key,
    required this.name,
    required this.path1,
    required this.path2,
    required this.path3,
    required this.content,
  }) : super(key: key);

  final List<String> content;

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
          builder: (BuildContext context) =>
              _buildPopupDialog(context, content),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width - kDefaultPadding * 2,
          height: 65,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: kPrimaryColor.withOpacity(0.7),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 30,
                    color: kPrimaryColor.withOpacity(0.2))
              ]),
          child: Row(
            children: [
              Padding(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: dynamicFontSize(context, name)),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white.withOpacity(0.25)),
                child: Padding(
                  padding: const EdgeInsets.all(13),
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

  Widget _buildPopupDialog(BuildContext context, List<String> content) {
    return AlertDialog(
      scrollable: true,
      title: Text(name + ': '),
      content: Container(
        width: MediaQuery.of(context).size.width - 2 * kDefaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            menuContainer(context, content, "Monday", 0),
            menuContainer(context, content, "Tuesday", 1),
            menuContainer(context, content, "Wednesday", 2),
            menuContainer(context, content, "Thursday", 3),
            menuContainer(context, content, "Friday", 4),
            menuContainer(context, content, "Saturday", 5),
            menuContainer(context, content, "Sunday", 6),
          ],
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

  Padding menuContainer(
      BuildContext context, List<String> content, String dayOfWeek, int index) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding - 5),
      child: Container(
          width: MediaQuery.of(context).size.width -
              2 * kDefaultPadding -
              kDefaultPadding,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: kPrimaryColor.withOpacity(0.45),
          ),
          child: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleWithUnderscore(text: dayOfWeek, size: 20),
                Text("\n      " + content[index] + "\n"),
              ],
            ),
          )),
    );
  }

  Text dynamicFontSize(BuildContext context, String name) {
    double fontSize = 20;
    String finalName = "";
    if (name.length <= 11) {
      finalName = name;
    } else {
      for (int i = 0; i < 9; i++) {
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
        child: Image.asset(path),
      );
    }
  }
}
