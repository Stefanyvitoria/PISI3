import 'package:animecom/views/pre-sets.dart';
import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [darkblue, darkblue2]),
      ),
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0, right: 20.0),
              child: Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.close,
                    size: 20,
                    color: gainsboro,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                child: Text(
                  'About:',
                  style: quicksand(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: gainsboro),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
              child: Align(
                child: Container(
                  decoration: BoxDecoration(
                    color: darkblue2,
                    border: Border.all(color: darkblue4, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  width: 500,
                  height: 400,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Text(
                        " Tired of watching the same anime all the time?\n\n Here's your solution!\n\n AnimeCom: an app that indicates anime, based on your description of one you've watched.\n\n\n by: Culpa do Usuário(CDU), UFRPE, 2021.",
                        style: quicksand(
                            color: gainsboro,
                            fontSize: 16.0,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
