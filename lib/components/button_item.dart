import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String title;
  final Function onPressed;

  CustomButton({
    @required this.title,
    @required this.onPressed,
  });

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(
        widget.title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      textColor: Colors.redAccent,
      onPressed: widget.onPressed
    );
  }
}
