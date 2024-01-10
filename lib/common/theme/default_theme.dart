// Copyright 2022 Logbot SRL. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class DefaultTheme {
  DefaultTheme() {
    _colorScheme = ColorScheme(
      brightness: Brightness.dark,
      primary: _primary,
      onPrimary: _white,
      secondary: _secondary,
      onSecondary: _white,
      error: _danger,
      onError: _black,
      background: _primary,
      onBackground: _black,
      surface: _black,
      onSurface: _black,
    );
  }

  /*
  * ##################
  * ### MAIN THEME ###
  * ##################
  * */

  late final ColorScheme _colorScheme;

  ColorScheme get colorScheme => _colorScheme;

  final Color _primary = const Color(0xff1C1C1E);
  final Color _secondary = const Color(0xffCA403B);

  Color get primary => _primary;
  Color get secondary => _secondary;

  /*
  * #####################
  * ### COMMON COLORS ###
  * #####################
  * */

  final Color _black = const Color.fromRGBO(0, 0, 0, 1);
  final Color _white = const Color.fromRGBO(255, 255, 255, 1);
  final Color _gray = const Color.fromRGBO(163, 163, 163, 1);
  final Color _disabled = const Color.fromRGBO(163, 163, 163, 1);

  Color get black => _black;
  Color get white => _white;
  Color get gray => _gray;
  Color get disabled => _disabled;

  // Alerts
  final Color _info = const Color.fromRGBO(0, 122, 255, 1);
  final Color _warning = const Color.fromRGBO(255, 204, 0, 1);
  final Color _danger = const Color.fromRGBO(255, 59, 48, 1);
  final Color _success = const Color.fromRGBO(49, 183, 112, 1);
  final Color _critical = const Color.fromRGBO(159, 9, 0, 1.0);
  final Color _debug = const Color.fromRGBO(176, 81, 222, 1.0);

  Color get info => _info;
  Color get warning => _warning;
  Color get danger => _danger;
  Color get success => _success;
  Color get critical => _critical;
  Color get debug => _debug;

  // Fonts
  late final Color _fontBlack = _black;
  late final Color _fontGray = const Color.fromRGBO(112, 112, 112, 1);
  late final Color _fontLightGray = _gray;
  late final Color _fontVeryLightGray = const Color.fromRGBO(242, 242, 242, 1);
  late final Color _fontWhite = _white;

  Color get fontBlack => _fontBlack;
  Color get fontGray => _fontGray;
  Color get fontLightGray => _fontLightGray;
  Color get fontVeryLightGray => _fontVeryLightGray;
  Color get fontWhite => _fontWhite;

  /*
  * ###################
  * ### TEXT STYLES ###
  * ###################
  * */

  late final TextStyle _textDefault = TextStyle(
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    fontSize: 16,
    color: _fontBlack,
  );

  late final TextStyle _textBoldDefault = TextStyle(
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    fontSize: 18,
    color: _fontBlack,
  );

  late final TextStyle _textPrimary = TextStyle(
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    fontSize: 16,
    color: _primary,
  );

  late final TextStyle _textPrimaryBold = TextStyle(
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    fontSize: 18,
    color: _primary,
  );

  late final TextStyle _textError = TextStyle(
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    fontSize: 16,
    color: _danger,
  );

  late final TextStyle _hyperLink = TextStyle(
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    fontSize: 16,
    color: _info,
  );

  TextStyle get textDefault => _textDefault;
  TextStyle get textBoldDefault => _textBoldDefault;
  TextStyle get textPrimary => _textPrimary;
  TextStyle get textPrimaryBold => _textPrimaryBold;
  TextStyle get textError => _textError;
  TextStyle get hyperLink => _hyperLink;

  late final TextStyle _title = TextStyle(
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    fontSize: 24.0,
    color: _fontWhite,
  );

  late final TextStyle _subtitle = const TextStyle(
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    fontSize: 15.0,
    color: Color(0xff69696C),
  );

  TextStyle get title => _title;
  TextStyle get subtitle => _subtitle;
}
