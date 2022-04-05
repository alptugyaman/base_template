import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  double get bottomHeight => mediaQuery.padding.bottom;
}

extension MediaQueryExtension on BuildContext {
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;
  double heightEx(double val) => mediaQuery.size.height / val;
  double widthEx(double val) => mediaQuery.size.width / val;

  double get lowValue => height * 0.0125;
  double get normalValue => height * 0.025;
  double get mediumValue => height * 0.05;
  double get highValue => height * 0.1;
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colors => theme.colorScheme;
}

extension PaddingExtension on BuildContext {
  EdgeInsets get paddingLow => EdgeInsets.all(lowValue);
  EdgeInsets get paddingNormal => EdgeInsets.all(normalValue);
  EdgeInsets get paddingMedium => EdgeInsets.all(mediumValue);
  EdgeInsets get paddingHigh => EdgeInsets.all(highValue);
}

extension MarginExtension on BuildContext {
  EdgeInsets get marginLow => EdgeInsets.all(lowValue);
  EdgeInsets get marginNormal => EdgeInsets.all(normalValue);
  EdgeInsets get marginMedium => EdgeInsets.all(mediumValue);
  EdgeInsets get marginHigh => EdgeInsets.all(highValue);
}
