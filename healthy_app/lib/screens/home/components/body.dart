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
  List<String> decriptions = <String>[];
  List<bool> isVegetarian = <bool>[];
  List<bool> isVegen = <bool>[];
  List<bool> containsMeat = <bool>[];
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
                    size: 20,
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
                              path1: imageShower(
                                  "assets/icons/icons8-broccoli-50.png",
                                  isVegetarian[index]),
                              path2: imageShower(
                                  "assets/icons/icons8-milk-bottle-50.png",
                                  isVegen[index]),
                              path3: imageShower(
                                  "assets/icons/icons8-meat-50.png",
                                  containsMeat[index]),
                              content: decriptions[index],
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
    bool isVegetarianCB = false;
    bool isVeganCB = false;
    bool containsMeatCB = false;

    TextEditingController nameController = TextEditingController();
    TextEditingController contentController = TextEditingController();

    return AlertDialog(
      scrollable: true,
      contentPadding: const EdgeInsets.all(kDefaultPadding),
      titlePadding: const EdgeInsets.only(
          top: kDefaultPadding, left: kDefaultPadding, right: kDefaultPadding),
      title: const Text('Menu: '),
      content: Container(
        width: MediaQuery.of(context).size.width - kDefaultPadding * 2,
        child: Column(
          children: [
            TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        gapPadding: kDefaultPadding / 5,
                        borderRadius:
                            BorderRadius.all(Radius.circular(kDefaultPadding))),
                    hintText: 'Enter a name',
                    icon: Icon(Icons.book))),
            TextFormField(
                controller: contentController,
                maxLines: null,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        gapPadding: kDefaultPadding / 5,
                        borderRadius:
                            BorderRadius.all(Radius.circular(kDefaultPadding))),
                    hintText: 'Enter a discription',
                    icon: Icon(Icons.book))),
            CheckBox(isVegetarianCB, "Is Vegetarian", 17.5,
                "assets/icons/icons8-broccoli-50.png"),
            CheckBox(isVeganCB, "Is Vegan", 17.5,
                "assets/icons/icons8-milk-bottle-50.png"),
            CheckBox(containsMeatCB, "Contains Meat", 17.5,
                "assets/icons/icons8-meat-50.png"),
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
                  nameController.text = "";
                },
                child: const Text('Cancel'),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  setState(() {
                    if (nameController.text == "") {
                      names.add("Empty");
                    } else {
                      names.add(nameController.text);
                    }
                    if (contentController.text == "") {
                      decriptions.add("Empty");
                    } else {
                      decriptions.add(contentController.text);
                    }
                    isVegetarian.add(isVegetarianCB);
                    isVegen.add(isVeganCB);
                    containsMeat.add(containsMeatCB);

                    bottom.add(bottom.length);
                  });
                  Navigator.of(context).pop();
                  nameController.text = "";
                },
                //textColor: Theme.of(context).primaryColor,
                child: const Text('Ok'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String imageShower(String path, bool isEnabled) {
    if (isEnabled) {
      return path;
    } else {
      return "";
    }
  }

  StatefulBuilder CheckBox(
      bool value1, String text, double fontSize, String imagePath) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return Container(
        margin: const EdgeInsets.only(
            left: kDefaultPadding / 2, right: kDefaultPadding / 2),
        child: CheckboxListTile(
          contentPadding: const EdgeInsets.only(
              top: kDefaultPadding / 2, bottom: kDefaultPadding / 2),
          title: TitleWithUnderscore(text: text, size: fontSize),
          value: value1,
          onChanged: (bool value) {
            setState(() {
              value1 = value;
            });
          },
          secondary: Image.asset(
            imagePath,
            width: MediaQuery.of(context).size.width / 10.5,
            height: MediaQuery.of(context).size.width / 10.5,
          ),
        ),
      );
    });
  }
}
