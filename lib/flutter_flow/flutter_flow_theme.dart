// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shared_preferences/shared_preferences.dart';

const kThemeModeKey = '__theme_mode__';
SharedPreferences? _prefs;

abstract class FlutterFlowTheme {
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static ThemeMode get themeMode {
    final darkMode = _prefs?.getBool(kThemeModeKey);
    return darkMode == null
        ? ThemeMode.system
        : darkMode
            ? ThemeMode.dark
            : ThemeMode.light;
  }

  static void saveThemeMode(ThemeMode mode) => mode == ThemeMode.system
      ? _prefs?.remove(kThemeModeKey)
      : _prefs?.setBool(kThemeModeKey, mode == ThemeMode.dark);

  static FlutterFlowTheme of(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? DarkModeTheme()
        : LightModeTheme();
  }

  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary;
  late Color secondary;
  late Color tertiary;
  late Color alternate;
  late Color primaryText;
  late Color secondaryText;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color accent1;
  late Color accent2;
  late Color accent3;
  late Color accent4;
  late Color success;
  late Color warning;
  late Color error;
  late Color info;

  late Color border;
  late Color rating;

  @Deprecated('Use displaySmallFamily instead')
  String get title1Family => displaySmallFamily;
  @Deprecated('Use displaySmall instead')
  TextStyle get title1 => typography.displaySmall;
  @Deprecated('Use headlineMediumFamily instead')
  String get title2Family => typography.headlineMediumFamily;
  @Deprecated('Use headlineMedium instead')
  TextStyle get title2 => typography.headlineMedium;
  @Deprecated('Use headlineSmallFamily instead')
  String get title3Family => typography.headlineSmallFamily;
  @Deprecated('Use headlineSmall instead')
  TextStyle get title3 => typography.headlineSmall;
  @Deprecated('Use titleMediumFamily instead')
  String get subtitle1Family => typography.titleMediumFamily;
  @Deprecated('Use titleMedium instead')
  TextStyle get subtitle1 => typography.titleMedium;
  @Deprecated('Use titleSmallFamily instead')
  String get subtitle2Family => typography.titleSmallFamily;
  @Deprecated('Use titleSmall instead')
  TextStyle get subtitle2 => typography.titleSmall;
  @Deprecated('Use bodyMediumFamily instead')
  String get bodyText1Family => typography.bodyMediumFamily;
  @Deprecated('Use bodyMedium instead')
  TextStyle get bodyText1 => typography.bodyMedium;
  @Deprecated('Use bodySmallFamily instead')
  String get bodyText2Family => typography.bodySmallFamily;
  @Deprecated('Use bodySmall instead')
  TextStyle get bodyText2 => typography.bodySmall;

  String get displayLargeFamily => typography.displayLargeFamily;
  TextStyle get displayLarge => typography.displayLarge;
  String get displayMediumFamily => typography.displayMediumFamily;
  TextStyle get displayMedium => typography.displayMedium;
  String get displaySmallFamily => typography.displaySmallFamily;
  TextStyle get displaySmall => typography.displaySmall;
  String get headlineLargeFamily => typography.headlineLargeFamily;
  TextStyle get headlineLarge => typography.headlineLarge;
  String get headlineMediumFamily => typography.headlineMediumFamily;
  TextStyle get headlineMedium => typography.headlineMedium;
  String get headlineSmallFamily => typography.headlineSmallFamily;
  TextStyle get headlineSmall => typography.headlineSmall;
  String get titleLargeFamily => typography.titleLargeFamily;
  TextStyle get titleLarge => typography.titleLarge;
  String get titleMediumFamily => typography.titleMediumFamily;
  TextStyle get titleMedium => typography.titleMedium;
  String get titleSmallFamily => typography.titleSmallFamily;
  TextStyle get titleSmall => typography.titleSmall;
  String get labelLargeFamily => typography.labelLargeFamily;
  TextStyle get labelLarge => typography.labelLarge;
  String get labelMediumFamily => typography.labelMediumFamily;
  TextStyle get labelMedium => typography.labelMedium;
  String get labelSmallFamily => typography.labelSmallFamily;
  TextStyle get labelSmall => typography.labelSmall;
  String get bodyLargeFamily => typography.bodyLargeFamily;
  TextStyle get bodyLarge => typography.bodyLarge;
  String get bodyMediumFamily => typography.bodyMediumFamily;
  TextStyle get bodyMedium => typography.bodyMedium;
  String get bodySmallFamily => typography.bodySmallFamily;
  TextStyle get bodySmall => typography.bodySmall;

  Typography get typography => ThemeTypography(this);
}

class LightModeTheme extends FlutterFlowTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFFFF5E36);
  late Color secondary = const Color(0xFF88304E);
  late Color tertiary = const Color(0xFF522546);
  late Color alternate = const Color(0xFF311D3F);
  late Color primaryText = const Color(0xFF14181B);
  late Color secondaryText = const Color(0xFF677681);
  late Color primaryBackground = const Color(0xFFFFFFFF);
  late Color secondaryBackground = const Color(0xFFEEEEEE);
  late Color accent1 = const Color(0x4CF83B46);
  late Color accent2 = const Color(0x4CFF6A73);
  late Color accent3 = const Color(0x4D0299FF);
  late Color accent4 = const Color(0xB2FFFFFF);
  late Color success = const Color(0xFF6BBD78);
  late Color warning = const Color(0xFFEC9C4B);
  late Color error = const Color(0xFFF83B46);
  late Color info = const Color(0xFFFFFFFF);

  late Color border = const Color(0x3D687285);
  late Color rating = const Color(0xFFDD8560);
}

abstract class Typography {
  String get displayLargeFamily;
  TextStyle get displayLarge;
  String get displayMediumFamily;
  TextStyle get displayMedium;
  String get displaySmallFamily;
  TextStyle get displaySmall;
  String get headlineLargeFamily;
  TextStyle get headlineLarge;
  String get headlineMediumFamily;
  TextStyle get headlineMedium;
  String get headlineSmallFamily;
  TextStyle get headlineSmall;
  String get titleLargeFamily;
  TextStyle get titleLarge;
  String get titleMediumFamily;
  TextStyle get titleMedium;
  String get titleSmallFamily;
  TextStyle get titleSmall;
  String get labelLargeFamily;
  TextStyle get labelLarge;
  String get labelMediumFamily;
  TextStyle get labelMedium;
  String get labelSmallFamily;
  TextStyle get labelSmall;
  String get bodyLargeFamily;
  TextStyle get bodyLarge;
  String get bodyMediumFamily;
  TextStyle get bodyMedium;
  String get bodySmallFamily;
  TextStyle get bodySmall;
}

class ThemeTypography extends Typography {
  ThemeTypography(this.theme);

  final FlutterFlowTheme theme;

  String get displayLargeFamily => 'Roboto';
  TextStyle get displayLarge => GoogleFonts.getFont(
        'Roboto',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 56.0,
      );
  String get displayMediumFamily => 'Roboto';
  TextStyle get displayMedium => GoogleFonts.getFont(
        'Roboto',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 44.0,
      );
  String get displaySmallFamily => 'Roboto';
  TextStyle get displaySmall => GoogleFonts.getFont(
        'Roboto',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 36.0,
      );
  String get headlineLargeFamily => 'Roboto';
  TextStyle get headlineLarge => GoogleFonts.getFont(
        'Roboto',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 32.0,
      );
  String get headlineMediumFamily => 'Roboto';
  TextStyle get headlineMedium => GoogleFonts.getFont(
        'Roboto',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 32.0,
      );
  String get headlineSmallFamily => 'Roboto';
  TextStyle get headlineSmall => GoogleFonts.getFont(
        'Roboto',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 24.0,
      );
  String get titleLargeFamily => 'Roboto';
  TextStyle get titleLarge => GoogleFonts.getFont(
        'Roboto',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 22.0,
      );
  String get titleMediumFamily => 'Roboto';
  TextStyle get titleMedium => GoogleFonts.getFont(
        'Roboto',
        color: theme.info,
        fontWeight: FontWeight.w600,
        fontSize: 18.0,
      );
  String get titleSmallFamily => 'Roboto';
  TextStyle get titleSmall => GoogleFonts.getFont(
        'Roboto',
        color: theme.info,
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
      );
  String get labelLargeFamily => 'Roboto';
  TextStyle get labelLarge => GoogleFonts.getFont(
        'Roboto',
        color: theme.secondaryText,
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
      );
  String get labelMediumFamily => 'Roboto';
  TextStyle get labelMedium => GoogleFonts.getFont(
        'Roboto',
        color: theme.secondaryText,
        fontWeight: FontWeight.w500,
        fontSize: 14.0,
      );
  String get labelSmallFamily => 'Roboto';
  TextStyle get labelSmall => GoogleFonts.getFont(
        'Roboto',
        color: theme.secondaryText,
        fontWeight: FontWeight.w500,
        fontSize: 12.0,
      );
  String get bodyLargeFamily => 'Roboto';
  TextStyle get bodyLarge => GoogleFonts.getFont(
        'Roboto',
        color: theme.primaryText,
        fontSize: 16.0,
      );
  String get bodyMediumFamily => 'Roboto';
  TextStyle get bodyMedium => GoogleFonts.getFont(
        'Roboto',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get bodySmallFamily => 'Roboto';
  TextStyle get bodySmall => GoogleFonts.getFont(
        'Roboto',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
}

class DarkModeTheme extends FlutterFlowTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFFFF5E36);
  late Color secondary = const Color(0xFFFF6A73);
  late Color tertiary = const Color(0xFF0299FF);
  late Color alternate = const Color(0xFF262D34);
  late Color primaryText = const Color(0xFFFFFFFF);
  late Color secondaryText = const Color(0xFFA5B0BE);
  late Color primaryBackground = const Color(0xFF1A1F24);
  late Color secondaryBackground = const Color(0xFF0F1316);
  late Color accent1 = const Color(0x4CF83B46);
  late Color accent2 = const Color(0x4CFF6A73);
  late Color accent3 = const Color(0x4D0299FF);
  late Color accent4 = const Color(0xB20B191E);
  late Color success = const Color(0xFF6BBD78);
  late Color warning = const Color(0xFFEC9C4B);
  late Color error = const Color(0xFFF83B46);
  late Color info = const Color(0xFFFFFFFF);

  late Color border = const Color(0x3D687285);
  late Color rating = const Color(0xFFDD8560);
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = true,
    TextDecoration? decoration,
    double? lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily!,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              letterSpacing: letterSpacing ?? this.letterSpacing,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              letterSpacing: letterSpacing,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
            );
}
