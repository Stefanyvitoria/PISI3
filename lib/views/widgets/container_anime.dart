import 'package:animecom/views/pre-sets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_gradients/flutter_gradients.dart';

class AnimeContainer extends StatelessWidget {
  final Key key;
  final String name;
  final double score;
  final String imgurl;

  const AnimeContainer({this.key, this.name, this.score, this.imgurl});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 10.0, left: 10.0, right: 10.0, bottom: 10.0),
      child: Container(
          child: Row(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.only(left: 5.0, top: 5.0, bottom: 5.0),
                child: Container(
                  height: 170,
                  width: 120,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      image: DecorationImage(
                          image: NetworkImage(imgurl), fit: BoxFit.fill)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 80.0),
                child: Column(
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        style: quicksand(
                            color: gainsboro,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    // RatingBar.builder(
                    //   allowHalfRating: true,
                    //   initialRating: score / 2,
                    //   minRating: 0,
                    //   maxRating: 10.0,
                    //   itemCount: 5,
                    //   itemSize: 25,
                    //   itemBuilder: (context, index) => Icon(
                    //     Icons.star,
                    //     color: darkpurple2,
                    //   ),
                    // ),
                    Expanded(
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: favyellow,
                            size: 30,
                          ),
                          Text(
                            '$score',
                            style: quicksand(
                                color: favyellow,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          height: 200,
          width: 500,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [darkblue2, darkblue],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
              border: Border.all(color: darkblue2),
              color: darkblue,
              borderRadius: BorderRadius.all(Radius.circular(25)))),
    );
  }
}
