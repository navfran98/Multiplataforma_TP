import 'package:flutter/material.dart';
import 'package:multi_tp/presentation/design_system/tokens/colors.dart';
import 'package:multi_tp/presentation/design_system/tokens/font.dart';

class CtaButton extends StatelessWidget {
  const CtaButton(
      {Key? key,
      required this.isTransparent,
      required this.isDisabled,
      required this.text,
      required this.onPressedFunction})
      : super(key: key);
  final bool isTransparent;
  final bool isDisabled;
  final String text;
  final void Function() onPressedFunction;

  @override
  Widget build(BuildContext context) {
    Color textColor = isDisabled
        ? ColorPalette.neutral50
        : isTransparent
            ? ColorPalette.primary100
            : ColorPalette.neutral0;
    Color buttonColor = isDisabled
        ? ColorPalette.neutral25
        : isTransparent
            ? ColorPalette.neutral0
            : ColorPalette.primary100;
    return FilledButton(
        onPressed: isDisabled ? null : onPressedFunction,
        style: ButtonStyle(
          shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
          backgroundColor: MaterialStatePropertyAll(buttonColor),
          padding: const MaterialStatePropertyAll<EdgeInsets>(
              EdgeInsets.fromLTRB(8, 12, 8, 12)),
          minimumSize: const MaterialStatePropertyAll(Size.fromHeight(44)),
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)){
                return isTransparent
                    ? ColorPalette.neutral25
                    : ColorPalette.neutral10.withOpacity(0.10);
               }
              return null;
            },
          ),
        ),
        child: Text(
          text,
          style: CustomFont.button(textColor),
        ));
  }
}
