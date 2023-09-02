import 'package:flutter/material.dart';
import 'package:multi_tp/design_system/tokens/font.dart';
import 'package:multi_tp/design_system/tokens/colors.dart';

class ShortButton extends StatelessWidget {
  const ShortButton(
      {Key? key,
      required this.isSmall,
      required this.isDisabled,
      required this.text,
      required this.onPressedFunction,
      this.icon})
      : super(key: key);
  final bool isSmall;
  final bool isDisabled;
  final String text;
  final Icon? icon;
  final void Function() onPressedFunction;

  @override
  Widget build(BuildContext context) {
    Color textColor =
        isDisabled ? ColorPalette.neutral50 : ColorPalette.neutral0;
    Color buttonColor =
        isDisabled ? ColorPalette.neutral25 : ColorPalette.primary100;
    return FilledButton(
      onPressed: isDisabled ? null : onPressedFunction,
      style: ButtonStyle(
        shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
        padding: const MaterialStatePropertyAll<EdgeInsets>(EdgeInsets.zero),
        backgroundColor: MaterialStatePropertyAll(buttonColor),
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return ColorPalette.neutral10.withOpacity(0.10);
            }
            return null;
          },
        ),
      ),
      child: Container(
        padding: !isSmall
            ? const EdgeInsets.all(12)
            : const EdgeInsets.fromLTRB(12, 8, 12, 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(icon != null)
              Row(
                children: [
                  icon!,
                  const SizedBox(
                    width: 8,
                  ),
                ],
              ),
            Text(
              text,
              style: CustomFont.button(textColor),
            ),
          ],
        ),
      )
    );
  }
}

