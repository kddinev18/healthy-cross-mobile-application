// @dart=2.9
import 'package:flutter/material.dart';
import 'package:healthy_app/constants.dart';
import 'package:healthy_app/screens/home/components/recipe_container.dart';

import 'header.dart';
import 'title_with_underscore.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<int> bottom = <int>[0];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Column(
      children: [
        Header(size: size),
        Padding(
          padding: const EdgeInsets.only(
              left: kDefaultPadding, right: kDefaultPadding),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: const TitleWithUnderscore(
                  text: "Recommended Recipies",
                ),
                padding: EdgeInsets.only(bottom: kDefaultPadding),
              ),
              const RecipeContainer(
                name: "Healthy",
                path1: "assets/icons/bok-choy-svgrepo-com.svg",
                path2: "assets/icons/egg-svgrepo-com.svg",
                path3: "assets/icons/ham-svgrepo-com.svg",
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: kDefaultPadding, right: kDefaultPadding),
          child: Row(
            children: [
              const TitleWithUnderscore(
                text: "Recommended",
              ),
              Spacer(),
              CircleAvatar(
                radius: 20,
                backgroundColor: kPrimaryColor,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      bottom.add(bottom.length);
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
        Container(
          padding: const EdgeInsets.only(
              right: kDefaultPadding,
              left: kDefaultPadding,
              top: kDefaultPadding / 3),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 3,
          child: CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Container(
                      padding: EdgeInsets.all(kDefaultPadding),
                      alignment: Alignment.center,
                      color: kPrimaryColor,
                      height: kDefaultPadding * 3,
                      child: Text('Item: ${bottom[index]}'),
                    );
                  },
                  childCount: bottom.length - 1,
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
