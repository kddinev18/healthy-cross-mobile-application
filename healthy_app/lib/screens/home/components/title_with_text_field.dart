import 'package:flutter/material.dart';
import 'package:healthy_app/screens/home/components/title_with_underscore.dart';
import '../../../constants.dart';

class TitleWithTextField extends StatelessWidget {
  const TitleWithTextField({
    required Key key,
    required this.contentController,
    required this.text,
    required this.description,
  }) : super(key: key);

  final String description;
  final String text;
  final TextEditingController contentController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleWithUnderscore(text: text, size: 20),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
              controller: contentController,
              maxLines: null,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(
                      gapPadding: kDefaultPadding / 5,
                      borderRadius:
                          BorderRadius.all(Radius.circular(kDefaultPadding))),
                  hintText: description,
                  icon: const Icon(Icons.book))),
        ),
      ],
    );
  }
}
