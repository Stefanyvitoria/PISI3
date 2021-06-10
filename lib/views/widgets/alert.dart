import 'package:animecom/views/pre-sets.dart';
import 'package:flutter/material.dart';

class WidgetsConstantes {
  static alert({title, Widget content, actions, context}) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: title,
          scrollable: true,
          titleTextStyle: quicksand(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: darkpurple,
          ),
          contentTextStyle: quicksand(
            fontSize: 18.0,
            fontWeight: FontWeight.normal,
            color: darkpurple,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          content: content,
          actions: actions,
        );
      },
    );
  }
}
