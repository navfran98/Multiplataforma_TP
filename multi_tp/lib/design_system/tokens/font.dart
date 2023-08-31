import 'package:flutter/material.dart';

class CustomFont extends TextStyle {
  static const String customFontFamily = "Roboto";

  const CustomFont({
    required double size,
    required double height,
    required double spacing,
    required FontWeight weight,
    required Color color,
    required String family,
  }) : super(
          fontSize: size,
          height: height,
          letterSpacing: spacing,
          fontWeight: weight,
          color: color,
          fontFamily: 'Roboto'
        );

  const CustomFont.headline01(
    Color color,
  ) : this(
      size: 24,
      height: 24/24,
      spacing: 0.18,
      weight: FontWeight.w400,
      color: color,
      family: customFontFamily,
  );

  const CustomFont.headline02(
    Color color,
  ) : this(
      size: 20,
      height: 24/20,
      spacing: 0.15,
      weight: FontWeight.w500,
      color: color,
      family: customFontFamily,
  );

  const CustomFont.subtitle01(
    Color color,
  ) : this(
      size: 16,
      height: 24/16,
      spacing: 0.15,
      weight: FontWeight.w400,
      color: color,
      family: customFontFamily,
  );

  const CustomFont.body01(
    Color color,
  ) : this(
      size: 14,
      height: 20/14,
      spacing: 0.25,
      weight: FontWeight.w400,
      color: color,
      family: customFontFamily,
  );

  const CustomFont.body02(
    Color color,
  ) : this(
      size: 12,
      height: 16/12,
      spacing: 0.4,
      weight: FontWeight.w400,
      color: color,
      family: customFontFamily,
  );

  const CustomFont.button(
    Color color,
  ) : this(
      size: 14,
      height: 20/14,
      spacing: 0.1,
      weight: FontWeight.w500,
      color: color,
      family: customFontFamily,
  );

  const CustomFont.caption(
    Color color,
  ) : this(
      size: 12,
      height: 16/12,
      spacing: 0.4,
      weight: FontWeight.w400,
      color: color,
      family: customFontFamily,
  );

  const CustomFont.overline(
    Color color,
  ) : this(
      size: 10,
      height: 16/10,
      spacing: 1.5,
      weight: FontWeight.w500,
      color: color,
      family: customFontFamily,
  );
  
}
