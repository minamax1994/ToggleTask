import 'package:flutter/material.dart';

import '../model/model.dart';

class CustomTextFormField extends StatefulWidget {
  final CustomTextFormFieldType type;
  final String initialValue;
  final Function onSaved;

  CustomTextFormField({
    @required this.type,
    this.initialValue = '',
    @required this.onSaved,
  });

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  String labelText;
  IconData icon;
  TextInputType keyboardType;
  bool obscureText = false;
  int maxLength;
  Function validator;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case CustomTextFormFieldType.Email:
        labelText = 'Email';
        icon = Icons.email;
        keyboardType = TextInputType.emailAddress;
        obscureText = false;
        validator = (String value) {
          if (value.isEmpty ||
              !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                  .hasMatch(value)) {
            return 'Invalid Email';
          } else {
            return null;
          }
        };
        break;
      case CustomTextFormFieldType.Password:
        labelText = 'Password';
        icon = Icons.lock;
        keyboardType = TextInputType.text;
        obscureText = true;
        validator = (String value) {
          if (value.isEmpty) {
            return 'Password cant be empty';
          } else if (value.length < 6) {
            return 'Password must be at least 6 charachters';
          } else if (!value.contains(RegExp(r'[A-Z]')) ||
              !value.contains(RegExp(r'[a-z]'))) {
            return 'Password must include small and capital letters';
          } else {
            return null;
          }
        };
        break;
      case CustomTextFormFieldType.Token:
        labelText = 'Token';
        icon = Icons.security;
        keyboardType = TextInputType.emailAddress;
        obscureText = false;
        validator = (String value) {
          if (value.isEmpty) {
            return 'Token field cannot be empty';
          } else {
            return null;
          }
        };
        break;
    }
    return TextFormField(
      initialValue: widget.initialValue,
      maxLength: maxLength,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(10.0),
        ),
        isDense: true,
        filled: true,
        fillColor: Colors.white,
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.grey),
        errorStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        prefixIcon: Icon(
          icon,
          color: Colors.grey,
        ),
      ),
      keyboardType: keyboardType,
      validator: validator,
      onSaved: widget.onSaved,
    );
  }
}
