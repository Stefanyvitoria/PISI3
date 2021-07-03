import 'package:animecom/views/pre-sets.dart';
import 'package:animecom/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'AnimeCom',
          theme: ThemeData(primarySwatch: _createMaterialColor(linen)),
          home: SplashScreen(title: 'AnimeCom'),
        );
      },
    );
  }

  MaterialColor _createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch);
  }
}
