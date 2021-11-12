// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthy_app/constants.dart';
import 'package:healthy_app/screens/home/components/menu_container.dart';

import 'header.dart';
import 'title_with_underscore.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<int> bottom = <int>[0];
  List<String> names = <String>[];

  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Header(size: size),
            Padding(
              padding: const EdgeInsets.only(
                  left: kDefaultPadding, right: kDefaultPadding),
              child: Row(
                children: [
                  const TitleWithUnderscore(
                    text: "Your Menus",
                  ),
                  const Spacer(),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: kPrimaryColor,
                    child: IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return addMenuPopUp(context);
                            });
                      },
                      icon: const Icon(
                        Icons.add,
                        size: 20,
                      ),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                Container(
                  height: size.height / 1.70,
                  width: size.width,
                  child: SvgPicture.asset(
                      "assets/images/Eating healthy food-bro.svg"),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      right: 0, left: 0, top: kDefaultPadding / 3),
                  width: size.height,
                  height: size.height / 1.80,
                  child: CustomScrollView(
                    slivers: <Widget>[
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            return RecipeContainer(
                              name: names[index],
                              path1: "assets/icons/icons8-broccoli-50.png",
                              path2: "assets/icons/icons8-milk-bottle-50.png",
                              path3: "assets/icons/icons8-meat-50.png",
                            );
                          },
                          childCount: bottom.length - 1,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ));
  }

  AlertDialog addMenuPopUp(BuildContext context) {
    return AlertDialog(
      title: const Text('Menu: '),
      content: Column(
        children: [
          TextField(
              controller: nameController,
              onChanged: (v) => nameController.text = v,
              decoration: const InputDecoration(
                labelText: 'Name the Pup',
              )),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            setState(() {
              if (nameController.text == "") {
                names.add("Empty");
              } else {
                names.add(nameController.text);
              }
              bottom.add(bottom.length);
            });
            Navigator.of(context).pop();
            nameController.text = "";
          },
          //textColor: Theme.of(context).primaryColor,
          child: const Text('Ok'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            nameController.text = "";
          },
          //textColor: Theme.of(context).primaryColor,
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}
