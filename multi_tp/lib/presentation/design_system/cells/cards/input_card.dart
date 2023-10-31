import 'package:flutter/material.dart';
import 'package:multi_tp/presentation/design_system/tokens/colors.dart';
import 'package:multi_tp/presentation/design_system/tokens/font.dart';

class InputCard extends StatefulWidget {
   final void Function(String?)? onGenderSelected;
   final String? initialValue;

  const InputCard({Key? key, this.onGenderSelected, required this.initialValue}) : super(key: key);

  @override
  State<InputCard> createState() => _InputCardState();
}

class _InputCardState extends State<InputCard> {
  String? _selected;
  final List<String> _options = ["Hombre", "Mujer", "No Binario"];

  @override
  void initState() {
    if(widget.initialValue != null) {
      _selected = widget.initialValue;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorPalette.neutral10,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment
            .start, // Asegura que ambos hijos tengan la misma altura
        children: [
          Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
              color: ColorPalette.secondary25,
              child: const Text(
                "Información de perfil",
                style: CustomFont.subtitle01(ColorPalette.neutral100),
              )),
          ListView.builder(
            itemCount: 3,
            shrinkWrap: true,
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(
                  _options.elementAt(index),
                  style: const CustomFont.body01(ColorPalette.neutral100),
                ),
                leading: Radio<String>(
                  value: _options.elementAt(index),
                  groupValue: _selected,
                  fillColor:
                      const MaterialStatePropertyAll(ColorPalette.primary100),
                  onChanged: (String? value) {
                    setState(() {
                      _selected = value;
                    });
                    widget.onGenderSelected?.call(value);
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
