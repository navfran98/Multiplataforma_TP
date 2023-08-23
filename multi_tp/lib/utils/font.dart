import 'package:flutter/material.dart';

class CustomFont extends TextStyle {
  const CustomFont({
    required double size,
    required double height,
    required double spacing,
    required double weight,
    required Color color,
  }) : super(
          fontSize: size,
          height: height,
          letterSpacing: spacing,
          fontWeight: FontWeight.w400,
          color: color,
        );

  const CustomFont.headline01(
    Color color,
  ) : this(
      size: 24,
      height: 24,
      spacing: 0.18,
      weight: 400,
      color: color,
  );

  const CustomFont.headline02(
    Color color,
  ) : this(
      size: 20,
      height: 24,
      spacing: 0.15,
      weight: 500,
      color: color,
  );

  const CustomFont.subtitle01(
    Color color,
  ) : this(
      size: 16,
      height: 24,
      spacing: 0.15,
      weight: 400,
      color: color,
  );

  const CustomFont.body01(
    Color color,
  ) : this(
      size: 14,
      height: 20,
      spacing: 0.25,
      weight: 400,
      color: color,
  );

  const CustomFont.body02(
    Color color,
  ) : this(
      size: 12,
      height: 16,
      spacing: 0.4,
      weight: 400,
      color: color,
  );

  const CustomFont.button(
    Color color,
  ) : this(
      size: 14,
      height: 20,
      spacing: 0.1,
      weight: 500,
      color: color,
  );

  const CustomFont.caption(
    Color color,
  ) : this(
      size: 12,
      height: 16,
      spacing: 0.4,
      weight: 400,
      color: color,
  );

  const CustomFont.overline(
    Color color,
  ) : this(
      size: 10,
      height: 16,
      spacing: 1.5,
      weight: 500,
      color: color,
  );
  
}
