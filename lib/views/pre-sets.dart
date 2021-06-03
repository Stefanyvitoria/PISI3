import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Paleta de cores
const darkpurple = Color(0xFF242038);
const slateblue = Color(0XFF725AC1);
const midpurpleblue = Color(0XFF8D86C9);
const lavendergrey = Color(0xFFCAC4CE);
const linen = Color(0XFFF7ECE1);
const purplenavy = Color(0XFF5E548E);
const gainsboro = Color(0XFFDAE2E7);

//Fontes
quicksand({color, fontSize, fontWeight}) {
  return GoogleFonts.quicksand(
      textStyle:
          TextStyle(fontSize: fontSize, color: color, fontWeight: fontWeight));
}
