import 'package:flutter/material.dart';

class PngManeger {
  static final PngManeger _instance = PngManeger._init();
  static PngManeger get instance => _instance;

  PngManeger._init();
  String toPng(String name) => 'assets/images/$name.png';

  //PNGS
  String get rocket => toPng('rocket');

  //WIDGETS
  Widget get rocketPNG => Image.asset(rocket);
}

class SvgManager {
  static final SvgManager _instance = SvgManager._init();
  static SvgManager get instance => _instance;

  SvgManager._init();
  String toSVG(String name) => 'assets/svg/$name.svg';

  //SVGS
  String get trophy => toSVG('trophy');

  //WIDGETS
  // Widget get rocketPNG => SvgPicture.asset(trophy);

}
