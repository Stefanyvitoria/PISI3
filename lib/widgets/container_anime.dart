import 'package:animecom/pre-sets.dart';
import 'package:flutter/material.dart';

class AnimeContainer extends StatelessWidget {
  final Key key;
  final String name;
  final String imgurl;

  const AnimeContainer({this.key, this.name, this.imgurl});
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 5.0, top: 5.0, bottom: 5.0),
              child: Container(
                height: 150,
                width: 100,
                decoration: BoxDecoration(
                    border: Border.all(color: darkpurple, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    image: DecorationImage(image: NetworkImage(imgurl))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 80.0),
              child: Text(
                name,
                style: quicksand(
                    color: darkpurple,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        height: 160,
        width: 500,
        decoration: BoxDecoration(
            color: gainsboro,
            border: Border.all(color: gainsboro),
            borderRadius: BorderRadius.all(Radius.circular(25))));
  }
}
