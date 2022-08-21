import 'package:flutter/material.dart';
import 'package:wajah_id/model/colorPallete.dart';


class FillOutlineButton extends StatelessWidget {
  const FillOutlineButton({
    Key key,
    this.isFilled = true,
    this.press,
    this.text,
  }) : super(key: key);

  final bool isFilled;
  final VoidCallback press;
  final String text;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide(color: WajahColors.WajahPrimary),
      ),
      elevation: isFilled ? 2 : 0,
      color: isFilled ? WajahColors.WajahPrimary : Colors.transparent,
      onPressed: press,
      child: Text(
        text,
        style: TextStyle(
          color: isFilled ? WajahColors.WajahPrimaryLightColor : Colors.black.withAlpha(90),
          fontSize: 12,
        ),
      ),
    );
  }
}