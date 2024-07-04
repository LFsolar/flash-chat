import 'package:flutter/material.dart';
import '../screens/registration_screen.dart';

class RoundedButton extends StatelessWidget {

  Color color;
  String btnTitle;
  void Function() callback;

  RoundedButton(this.color, this.btnTitle, @required this.callback);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: callback,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            btnTitle,
          ),
        ),
      ),
    );
  }

}