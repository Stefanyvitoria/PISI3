import 'package:animecom/controllers/app_controller.dart';
import 'package:animecom/models/profile_model.dart';
import 'package:animecom/views/catalog_view.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animecom/views/pre-sets.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(color: darkpurple),
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      darkpurple,
                      darkpurple,
                    ],
                  ),
                  image: DecorationImage(
                      image: AssetImage('assets/ANIMECOM.png'))),
            ),
            Container(
              constraints: BoxConstraints(maxHeight: 70),
              height: MediaQuery.of(context).size.height * 0.2,
              child: TextFormField(
                onChanged: (_value) => appController.setServer = _value,
                decoration: InputDecoration(
                  fillColor: darkblue3,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.green, width: 20)),
                  labelText: 'Server',
                  labelStyle: quicksand(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ),
            TextButton(
              onPressed: () async {
                //appController.prefClear();
                //appController.prefSetUser('ste@gmail.com');
                //print(await appController.prefGetUser());

                Profile user = await appController.loadUser();
                //verificar servidor *****
                Navigator.push(
                  context,
                  PageTransition(
                    child: Catalog(),
                    type: PageTransitionType.rightToLeftWithFade,
                    duration: Duration(milliseconds: 1200),
                    settings: RouteSettings(
                      name: 'catalog',
                      arguments: user,
                    ),
                  ),
                );
              },
              child: Text(
                'Add server',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
