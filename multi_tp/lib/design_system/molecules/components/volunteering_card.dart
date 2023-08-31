import 'package:flutter/material.dart';
import 'package:multi_tp/design_system/tokens/font.dart';
import 'package:multi_tp/design_system/tokens/colors.dart';

class VolunteeringCard extends StatelessWidget {
  const VolunteeringCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorPalette.neutral0,
        boxShadow: const [
          BoxShadow(
              blurRadius: 6,
              spreadRadius: 2,
              offset: Offset(0, 2),
              color: Color.fromRGBO(0, 0, 0, 0.15)),
          BoxShadow(
              blurRadius: 2,
              spreadRadius: 0,
              offset: Offset(0, 1),
              color: Color.fromRGBO(0, 0, 0, 0.3))
        ],
        borderRadius: BorderRadius.circular(2),
      ),
      height: 234,
      child: Column(
        children: [
          SizedBox(
            height: 138,
            width: double.infinity,
            child: Image.asset(
              'images/Landscape-Color.jpg',
              fit: BoxFit.fitWidth,
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  alignment: AlignmentDirectional.centerStart,
                  height: 72,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "ACCION SOCIAL",
                        style: CustomFont.overline(ColorPalette.neutral75),
                        textAlign: TextAlign.start,
                      ),
                      const Text(
                        "Un Techo para mi Pais",
                        style: CustomFont.subtitle01(ColorPalette.neutral100),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
                        height: 28,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          color: ColorPalette.secondary25,
                        ),
                        child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("Vacantes:",
                                  style: CustomFont.body02(
                                      ColorPalette.neutral100)),
                              SizedBox(
                                width: 8,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.person,
                                    color: ColorPalette.secondary200,
                                    size: 20,
                                  ),
                                  Text("10",
                                      style: CustomFont.subtitle01(
                                          ColorPalette.secondary200))
                                ],
                              ),
                            ]),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                const Row(
                  children: [
                    Icon(
                      Icons.favorite_border,
                      size: 24,
                      color: ColorPalette.primary100,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Icon(
                      Icons.location_pin,
                      size: 24,
                      color: ColorPalette.primary100,
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
