// Flutter imports:
import 'package:flutter/material.dart';

class ClearDefaultButton extends StatelessWidget {
  final Function() press;
  final String name;
  const ClearDefaultButton({
    Key? key,
    required this.press,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      // padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
      onPressed: press,
      // textColor: kPrimaryColor,
      // highlightColor: kTransparent,
      // splashColor: kTransparent,
      child: Text(
        name.toUpperCase(),
      ),
    );
  }
}
