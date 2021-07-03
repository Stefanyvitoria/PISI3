import 'package:animecom/controllers/anime_controller.dart';
import 'package:animecom/models/anime_model.dart';
import 'package:animecom/models/evaluation_model.dart';
import 'package:flutter/material.dart';
import 'package:animecom/views/anime_info_view.dart';
import 'package:flutter/widgets.dart';
import '../pre-sets.dart';

List controlList = [];

class TransparentRoute extends PageRoute<void> {
  TransparentRoute({
    @required this.builder,
    RouteSettings settings,
  })  : assert(builder != null),
        super(settings: settings, fullscreenDialog: false);

  final WidgetBuilder builder;

  @override
  bool get opaque => false;

  @override
  Color get barrierColor => null;

  @override
  String get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => Duration(milliseconds: 300);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    final result = builder(context);
    return FadeTransition(
      opacity: Tween<double>(begin: 0, end: 1).animate(animation),
      child: Semantics(
        scopesRoute: true,
        explicitChildNodes: true,
        child: result,
      ),
    );
  }
}

class CategoryContainer extends StatelessWidget {
  final Key key;
  final String text;
  final child;
  const CategoryContainer({this.key, this.text, this.child});

  @override
  Widget build(BuildContext context) {
    AnimeController animeController = AnimeController();
    return Container(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(
                text,
                style: quicksand(
                    color: gainsboro,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            child
          ],
        ),
      ),
    );
  }
}

class FutureAnimes extends StatelessWidget {
  final Key key;
  final String genre;
  final future;
  final itemCount;
  const FutureAnimes({this.key, this.genre, this.future, this.itemCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: FutureBuilder(
          future: future,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.all(5),
                      child: Hero(
                        tag: '${snapshot.data[i][0]}' + genre,
                        child: GestureDetector(
                          onTap: () async {
                            Navigator.of(context).push(TransparentRoute(
                                builder: (BuildContext context) => Anime_info(
                                    info: snapshot.data[i][0],
                                    genre: genre,
                                    anime: Anime.fromJson(snapshot.data[i]))));
                          },
                          child: Container(
                            height: 200,
                            width: 120,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(snapshot.data[i][7]))),
                          ),
                        ),
                      ),
                    );
                  });
            }
          }),
    );
  }
}
