// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:

// Package imports:
enum PrimaryButtonState { ACTIVE, INACTIVE }

class CustomDefaultButton extends StatefulWidget {
  const CustomDefaultButton(
      {Key? key,
      this.backgroundColor = Colors.transparent,
      this.buttonTextColor = Colors.black,
      this.text = "Button Text",
      this.textStyle,
      this.press,
      this.primaryButtonState = PrimaryButtonState.ACTIVE,
      this.disabledBackgroundColor = Colors.grey,
      this.disabledButtonTextColor = Colors.white,
      this.borderColor = Colors.grey,
      this.horizontalPadding = 16,
      this.verticalPadding = 16,
      this.textAlign,
      this.decoration,
      this.width = double.infinity,
      this.height = 40})
      : super(key: key);
  final String text;
  final TextStyle? textStyle;
  final Function? press;
  final Color backgroundColor;
  final Color buttonTextColor;
  final Color disabledBackgroundColor;
  final Color disabledButtonTextColor;
  final Color borderColor;
  final double horizontalPadding;
  final double verticalPadding;
  final PrimaryButtonState primaryButtonState;
  final TextAlign? textAlign;
  final Decoration? decoration;
  final double? width;
  final double? height;
  @override
  _CustomDefaultButtonState createState() => _CustomDefaultButtonState();
}

class _CustomDefaultButtonState extends State<CustomDefaultButton> {
  PrimaryButtonState _primaryButtonState = PrimaryButtonState.ACTIVE;
  Color newBackgroundColor = const Color.fromRGBO(40, 40, 48, 1);

  @override
  void initState() {
    super.initState();
    _primaryButtonState = widget.primaryButtonState;
  }

  @override
  void didUpdateWidget(CustomDefaultButton oldWidget) {
    if (_primaryButtonState != widget.primaryButtonState) {
      setState(() {
        _primaryButtonState = widget.primaryButtonState;
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    if (_primaryButtonState == PrimaryButtonState.ACTIVE) {
      newBackgroundColor = widget.backgroundColor;
    } else {
      newBackgroundColor = widget.disabledBackgroundColor;
    }
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: GestureDetector(
        onTap: () {
          widget.press!.call();
        },
        child: Container(
          height: widget.height,
          width: widget.width,
          decoration: widget.decoration ??
              BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: widget.backgroundColor,
                  border: Border.all(
                    color: widget.borderColor,
                  )),
          child: Center(
            child: Text(
              widget.text,
              style: widget.textStyle ??
                  TextStyle(
                      color: widget.buttonTextColor,
                      fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
