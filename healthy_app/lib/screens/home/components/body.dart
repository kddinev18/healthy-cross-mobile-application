// @dart=2.9
import 'package:flutter/material.dart';
import 'package:healthy_app/constants.dart';

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
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Container(
                      alignment: Alignment.center,
                      color: Colors.blue[200],
                      height: 100,
                      child: Text('Item: ${bottom[index]}'),
                    );
                  },
                  childCount: bottom.length - 1,
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
