import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {

  final Color color;
  final String btnTitle;
  final void Function() callback;

  const RoundedButton(this.color, this.btnTitle, this.callback, {super.key});

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
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

}