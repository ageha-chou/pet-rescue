import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  late double  one_percent_screen_h;
  late double  one_percent_screen_w;
  late double horizontal_padding;
  late String  button_text;
  late  int active;
  late Color backgroundColor;
  late Color textColor;
  late VoidCallback onButtonSelected;

  var one_percent_sreen_h;

  Buttons({required this.button_text, required this.active, required this.one_percent_sreen_h,
  required this.one_percent_screen_w, required this.horizontal_padding, required this.onButtonSelected}){
    if(this.active == 1){
      backgroundColor = Colors.green;
      textColor = Colors.white;
    }else{
      backgroundColor = Colors.white;
      textColor = Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 32 * one_percent_screen_h,
      left: horizontal_padding * one_percent_screen_w,
      child: FlatButton(
        onPressed: () => onButtonSelected,
        splashColor: Colors.transparent,
        highlightColor: Colors.red,
        child: Container(
          width: one_percent_screen_w * 22,
          height: one_percent_screen_h * 4.5,
          decoration:BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(50),
                ),
              color: backgroundColor,
              ),
          child: Center(
            child: Text(
              button_text,
              style: TextStyle(
                color: textColor,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            )
          ),

          ),

        )

    );
  }
}
