import 'package:flutter/material.dart';
import 'package:multi_tp/utils/font.dart';
import 'package:multi_tp/utils/colors.dart';
import 'package:multi_tp/buttons/cta_button.dart';

class CurrentVolCard extends StatelessWidget {
  const CurrentVolCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: ColorPalette.primary5,
          boxShadow: const [
            BoxShadow(
              blurRadius: 6,
              spreadRadius: 2,
              offset: Offset(0, 2),
              color: Color.fromRGBO(0, 0, 0, 0.15),
            ),
            BoxShadow(
              blurRadius: 2,
              spreadRadius: 0,
              offset: Offset(0, 1),
              color: Color.fromRGBO(0, 0, 0, 0.3),
            )
          ],
          borderRadius: BorderRadius.circular(6),
          border: Border.all(width: 2, color: ColorPalette.primary100)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "ACCION SOCIAL",
                style: CustomFont.overline(ColorPalette.neutral75),
              ),
              Text(
                "Un Techo para mi Pais",
                style: CustomFont.subtitle01(ColorPalette.neutral100),
              )
            ],
          ),
          Expanded(child: Container()),
          Icon(
            Icons.location_pin,
            color: ColorPalette.primary100,
          )
        ],
      ),
    );
  }
}
