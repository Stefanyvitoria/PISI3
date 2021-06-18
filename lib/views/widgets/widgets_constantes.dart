import 'package:animecom/views/pre-sets.dart';
import 'package:flutter/material.dart';

class WidgetsConstantes {
  static alert(
      {@required BuildContext context, title, Widget content, actions}) {
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

  static bottomSheet({@required BuildContext context, Widget content}) {
    return showModalBottomSheet(
      elevation: 5,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: content,
          ),
        );
      },
    );
  }
}
