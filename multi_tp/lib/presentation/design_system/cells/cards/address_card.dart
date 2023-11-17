
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multi_tp/presentation/design_system/tokens/colors.dart';
import 'package:multi_tp/presentation/design_system/tokens/font.dart';

class AddressCard extends ConsumerWidget {
  AddressCard({Key? key, required this.address}) : super(key: key);
  final String address;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
         decoration: const BoxDecoration(
          color: ColorPalette.secondary25,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5.0), // Ajusta el valor según sea necesario
            topRight: Radius.circular(5.0), // Ajusta el valor según sea necesario
          ),
         ),
          child: const Text(
            "Ubicación",
            style: CustomFont.subtitle01(ColorPalette.neutral100),
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(5.0), // Ajusta el valor según sea necesario
            bottomRight: Radius.circular(5.0), // Ajusta el valor según sea necesario
          ),),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Dirección",
                style: CustomFont.overline(ColorPalette.neutral50),
              ),
              Text(
                address,
                style: const CustomFont.body01(ColorPalette.neutral100),
              )
            ],
          ),
        )
      ],
    );
  }

}