import 'package:flutter/material.dart';

class CustomShadow extends BoxShadow {
  const CustomShadow({
    required double blurRadius,
    required double spreadRadius,
    required Color color,
    required Offset offset,
  }) : super(
            blurRadius: blurRadius,
            spreadRadius: spreadRadius,
            color: color,
            offset: offset);

  // Shadows for SHADOW1
  const CustomShadow.shadow01_1()
      : this(
          blurRadius: 3,
          spreadRadius: 1,
          color: const Color.fromRGBO(0, 0, 0, 0.15),
          offset: const Offset(0, 1),
        );

  const CustomShadow.shadow01_2()
      : this(
          blurRadius: 2,
          spreadRadius: 0,
          color: const Color.fromRGBO(0, 0, 0, 0.3),
          offset: const Offset(0, 1),
        );

  // Shadows for SHADOW2
  const CustomShadow.shadow02_1()
      : this(
          blurRadius: 6,
          spreadRadius: 2,
          color: const Color.fromRGBO(0, 0, 0, 0.15),
          offset: const Offset(0, 2),
        );

  const CustomShadow.shadow02_2()
      : this(
          blurRadius: 2,
          spreadRadius: 0,
          color: const Color.fromRGBO(0, 0, 0, 0.3),
          offset: const Offset(0, 1),
        );

  // Shadows doe SHADOW3
  const CustomShadow.shadow03_1()
      : this(
          blurRadius: 4,
          spreadRadius: 0,
          color: const Color.fromRGBO(0, 0, 0, 0.3),
          offset: const Offset(0, 4),
        );

  const CustomShadow.shadow03_2()
      : this(
          blurRadius: 12,
          spreadRadius: 6,
          color: const Color.fromRGBO(0, 0, 0, 0.15),
          offset: const Offset(0, 8),
        );
}
