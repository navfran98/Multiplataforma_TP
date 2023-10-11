import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multi_tp/presentation/design_system/tokens/colors.dart';
import 'package:multi_tp/presentation/design_system/tokens/font.dart';

class NewSnackbar extends ConsumerWidget {
  const NewSnackbar({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const CustomFont.subtitle01(ColorPalette.neutral100),
          ),
          InkWell(onTap: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(), child: const Text("Hide", style: CustomFont.subtitle01(ColorPalette.neutral100),))
        ],
      ),
    );
  }

}