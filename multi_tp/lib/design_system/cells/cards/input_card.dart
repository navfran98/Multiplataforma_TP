import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:multi_tp/design_system/molecules/buttons/cta_button.dart';
import 'package:multi_tp/design_system/tokens/font.dart';
import 'package:multi_tp/design_system/tokens/colors.dart';
import 'package:multi_tp/design_system/tokens/shadows.dart';
import 'package:multi_tp/design_system/molecules/components/vacante.dart';

class InputCard extends StatefulWidget {
  const InputCard({Key? key}) : super(key: key);

  @override
  State<InputCard> createState() => _InputCardState();
}

class _InputCardState extends State<InputCard> {
  String? _selected;
  final List<String> _options = ["Hombre", "Mujer", "no Binario"];

  @override
  Widget build(BuildContext context) {
    //TODO: tengo un problema con la altura de la card que se ve afectada por la imagen
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorPalette.neutral0,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start, // Asegura que ambos hijos tengan la misma altura
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
            color: ColorPalette.secondary25,
            child: const Text(
              "Información de perfil",
              style: CustomFont.subtitle01(ColorPalette.neutral100),
            )
          ),
          ListView.builder(
            itemCount: 3,
            padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(_options.elementAt(index), style: CustomFont.body01(ColorPalette.neutral100),),
                leading: Radio<String>(
                  value: _options.elementAt(index), 
                  groupValue: _selected, 
                  fillColor: const MaterialStatePropertyAll(ColorPalette.primary100),
                  onChanged: (String? value){
                    setState(() {
                      _selected = value;
                    });
                  },
                ),
              );
            },
          )
          // ListTile(
          //   title: const Text("Hombre", style: CustomFont.body01(ColorPalette.neutral100),),
          //   leading: Radio<String>(
          //     value: "Hombre", 
          //     groupValue: _selected, 
          //     fillColor: const MaterialStatePropertyAll(ColorPalette.primary100),
          //     onChanged: (String? value){
          //       setState(() {
          //         _selected = value;
          //       });
          //     },
          //   ),
          // ),
          // ListTile(
          //   title: const Text("Mujer", style: CustomFont.body01(ColorPalette.neutral100),),
          //   leading: Radio<String>(
          //     value: "Mujer", 
          //     groupValue: _selected, 
          //     fillColor: const MaterialStatePropertyAll(ColorPalette.primary100),
          //     onChanged: (String? value){
          //       setState(() {
          //         _selected = value;
          //       });
          //     },
          //   ),
          // ),
          // ListTile(
          //   title: const Text("No Binario", style: CustomFont.body01(ColorPalette.neutral100),),
          //   leading: Radio<String>(
          //     value: "No Binario", 
          //     groupValue: _selected, 
          //     fillColor: const MaterialStatePropertyAll(ColorPalette.primary100),
          //     onChanged: (String? value){
          //       setState(() {
          //         _selected = value;
          //       });
          //     },
          //   ),
          // )
        ],
      ),
    );
  }
}
