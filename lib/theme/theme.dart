import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff216487),
      surfaceTint: Color(0xff216487),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffc7e7ff),
      onPrimaryContainer: Color(0xff004c6c),
      secondary: Color(0xff1b6585),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffc3e8ff),
      onSecondaryContainer: Color(0xff004c68),
      tertiary: Color(0xff62597c),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffe8ddff),
      onTertiaryContainer: Color(0xff4a4263),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfff6fafe),
      onSurface: Color(0xff181c20),
      onSurfaceVariant: Color(0xff41484d),
      outline: Color(0xff71787e),
      outlineVariant: Color(0xffc1c7ce),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2d3135),
      inversePrimary: Color(0xff92cef5),
      primaryFixed: Color(0xffc7e7ff),
      onPrimaryFixed: Color(0xff001e2e),
      primaryFixedDim: Color(0xff92cef5),
      onPrimaryFixedVariant: Color(0xff004c6c),
      secondaryFixed: Color(0xffc3e8ff),
      onSecondaryFixed: Color(0xff001e2c),
      secondaryFixedDim: Color(0xff8fcff3),
      onSecondaryFixedVariant: Color(0xff004c68),
      tertiaryFixed: Color(0xffe8ddff),
      onTertiaryFixed: Color(0xff1e1635),
      tertiaryFixedDim: Color(0xffccc1e9),
      onTertiaryFixedVariant: Color(0xff4a4263),
      surfaceDim: Color(0xffd7dadf),
      surfaceBright: Color(0xfff6fafe),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff0f4f9),
      surfaceContainer: Color(0xffebeef3),
      surfaceContainerHigh: Color(0xffe5e8ed),
      surfaceContainerHighest: Color(0xffdfe3e7),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff003a54),
      surfaceTint: Color(0xff216487),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff347397),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff003b51),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff2f7495),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff393151),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff71688c),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff6fafe),
      onSurface: Color(0xff0d1215),
      onSurfaceVariant: Color(0xff30373c),
      outline: Color(0xff4d5359),
      outlineVariant: Color(0xff676e74),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2d3135),
      inversePrimary: Color(0xff92cef5),
      primaryFixed: Color(0xff347397),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff115b7d),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff2f7495),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff065b7b),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff71688c),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff595072),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc3c7cb),
      surfaceBright: Color(0xfff6fafe),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff0f4f9),
      surfaceContainer: Color(0xffe5e8ed),
      surfaceContainerHigh: Color(0xffdadde2),
      surfaceContainerHighest: Color(0xffced2d6),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff003045),
      surfaceTint: Color(0xff216487),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff004e6f),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff003043),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff004f6b),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff2f2747),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff4d4466),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff6fafe),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff262d32),
      outlineVariant: Color(0xff434a4f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2d3135),
      inversePrimary: Color(0xff92cef5),
      primaryFixed: Color(0xff004e6f),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff00374f),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff004f6b),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff00374c),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff4d4466),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff362e4e),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffb5b9be),
      surfaceBright: Color(0xfff6fafe),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeef1f6),
      surfaceContainer: Color(0xffdfe3e7),
      surfaceContainerHigh: Color(0xffd1d5d9),
      surfaceContainerHighest: Color(0xffc3c7cb),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff92cef5),
      surfaceTint: Color(0xff92cef5),
      onPrimary: Color(0xff00344c),
      primaryContainer: Color(0xff004c6c),
      onPrimaryContainer: Color(0xffc7e7ff),
      secondary: Color(0xff8fcff3),
      onSecondary: Color(0xff003549),
      secondaryContainer: Color(0xff004c68),
      onSecondaryContainer: Color(0xffc3e8ff),
      tertiary: Color(0xffccc1e9),
      onTertiary: Color(0xff332b4b),
      tertiaryContainer: Color(0xff4a4263),
      onTertiaryContainer: Color(0xffe8ddff),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff101417),
      onSurface: Color(0xffdfe3e7),
      onSurfaceVariant: Color(0xffc1c7ce),
      outline: Color(0xff8b9198),
      outlineVariant: Color(0xff41484d),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdfe3e7),
      inversePrimary: Color(0xff216487),
      primaryFixed: Color(0xffc7e7ff),
      onPrimaryFixed: Color(0xff001e2e),
      primaryFixedDim: Color(0xff92cef5),
      onPrimaryFixedVariant: Color(0xff004c6c),
      secondaryFixed: Color(0xffc3e8ff),
      onSecondaryFixed: Color(0xff001e2c),
      secondaryFixedDim: Color(0xff8fcff3),
      onSecondaryFixedVariant: Color(0xff004c68),
      tertiaryFixed: Color(0xffe8ddff),
      onTertiaryFixed: Color(0xff1e1635),
      tertiaryFixedDim: Color(0xffccc1e9),
      onTertiaryFixedVariant: Color(0xff4a4263),
      surfaceDim: Color(0xff101417),
      surfaceBright: Color(0xff353a3d),
      surfaceContainerLowest: Color(0xff0a0f12),
      surfaceContainerLow: Color(0xff181c20),
      surfaceContainer: Color(0xff1c2024),
      surfaceContainerHigh: Color(0xff262a2e),
      surfaceContainerHighest: Color(0xff313539),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffb9e2ff),
      surfaceTint: Color(0xff92cef5),
      onPrimary: Color(0xff00293c),
      primaryContainer: Color(0xff5b97bd),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffb4e3ff),
      onSecondary: Color(0xff00293a),
      secondaryContainer: Color(0xff5898ba),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffe2d6ff),
      onTertiary: Color(0xff292140),
      tertiaryContainer: Color(0xff968bb1),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff101417),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffd7dde4),
      outline: Color(0xffacb3b9),
      outlineVariant: Color(0xff8a9197),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdfe3e7),
      inversePrimary: Color(0xff004d6d),
      primaryFixed: Color(0xffc7e7ff),
      onPrimaryFixed: Color(0xff00131f),
      primaryFixedDim: Color(0xff92cef5),
      onPrimaryFixedVariant: Color(0xff003a54),
      secondaryFixed: Color(0xffc3e8ff),
      onSecondaryFixed: Color(0xff00131d),
      secondaryFixedDim: Color(0xff8fcff3),
      onSecondaryFixedVariant: Color(0xff003b51),
      tertiaryFixed: Color(0xffe8ddff),
      onTertiaryFixed: Color(0xff140c2a),
      tertiaryFixedDim: Color(0xffccc1e9),
      onTertiaryFixedVariant: Color(0xff393151),
      surfaceDim: Color(0xff101417),
      surfaceBright: Color(0xff414549),
      surfaceContainerLowest: Color(0xff04080b),
      surfaceContainerLow: Color(0xff1a1e22),
      surfaceContainer: Color(0xff24282c),
      surfaceContainerHigh: Color(0xff2f3337),
      surfaceContainerHighest: Color(0xff3a3e42),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffe3f2ff),
      surfaceTint: Color(0xff92cef5),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff8ecaf1),
      onPrimaryContainer: Color(0xff000d16),
      secondary: Color(0xffe1f2ff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xff8bcbef),
      onSecondaryContainer: Color(0xff000d15),
      tertiary: Color(0xfff5edff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffc8bde5),
      onTertiaryContainer: Color(0xff0e0624),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff101417),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffeaf1f7),
      outlineVariant: Color(0xffbdc3ca),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdfe3e7),
      inversePrimary: Color(0xff004d6d),
      primaryFixed: Color(0xffc7e7ff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xff92cef5),
      onPrimaryFixedVariant: Color(0xff00131f),
      secondaryFixed: Color(0xffc3e8ff),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xff8fcff3),
      onSecondaryFixedVariant: Color(0xff00131d),
      tertiaryFixed: Color(0xffe8ddff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffccc1e9),
      onTertiaryFixedVariant: Color(0xff140c2a),
      surfaceDim: Color(0xff101417),
      surfaceBright: Color(0xff4c5154),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff1c2024),
      surfaceContainer: Color(0xff2d3135),
      surfaceContainerHigh: Color(0xff383c40),
      surfaceContainerHighest: Color(0xff43474b),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),
    scaffoldBackgroundColor: colorScheme.surface,
    canvasColor: colorScheme.surface,
  );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
