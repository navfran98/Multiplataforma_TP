import 'package:flutter/material.dart';
import 'package:multi_tp/design_system/tokens/font.dart';
import 'package:multi_tp/design_system/tokens/colors.dart';
import 'package:multi_tp/design_system/tokens/shadows.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton(
      {Key? key, required this.isDisabled, required this.onPressedFunction})
      : super(key: key);
  final bool isDisabled;
  final void Function() onPressedFunction;

  @override
  Widget build(BuildContext context) {
    Color buttonColor =
        isDisabled ? ColorPalette.neutral10 : ColorPalette.primary10;
    return Container(
      decoration: const BoxDecoration(
          boxShadow: [CustomShadow.shadow03_1(), CustomShadow.shadow03_2()]),
      child: IconButton(
        icon: Icon(Icons.near_me,
            color:
                isDisabled ? ColorPalette.neutral25 : ColorPalette.primary100),
        onPressed: isDisabled ? null : onPressedFunction,
        style: ButtonStyle(
          shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
          padding:
              const MaterialStatePropertyAll<EdgeInsets>(EdgeInsets.all(12)),
          maximumSize:
              const MaterialStatePropertyAll<Size>(Size.fromWidth(123)),
          // splashFactory: InkRipple.splashFactory
          backgroundColor: MaterialStatePropertyAll(buttonColor),
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return ColorPalette.neutral75.withOpacity(0.10);
              }
              return null; // Defer to the widget's default.
            },
          ),
        ),
      ),
    );
  }
}
