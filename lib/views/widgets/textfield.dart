import 'package:flutter/material.dart';

import '../pre-sets.dart';

class AnimeTextField extends StatelessWidget {
  final Key key;
  final onChanged;
  final icon;
  final text;
  final validator;
  final bool obscureText;
  final double labelsize;
  final double inputtextsize;
  final controller;
  final type;
  const AnimeTextField(
      {this.key,
      this.onChanged,
      this.icon,
      this.text,
      this.obscureText,
      this.validator,
      this.controller,
      this.labelsize,
      this.type,
      this.inputtextsize});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: type,
      onChanged: onChanged,
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
          prefixIcon: icon,
          fillColor: darkblue3,
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: Colors.green, width: 20)),
          labelText: text,
          labelStyle: quicksand(
              color: linen,
              fontSize: labelsize,
              fontWeight: FontWeight.normal)),
      style: quicksand(
          color: linen, fontSize: inputtextsize, fontWeight: FontWeight.normal),
    );
  }
}
