import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:multi_tp/design_system/molecules/buttons/cta_button.dart';
import 'package:multi_tp/design_system/molecules/buttons/short_button.dart';
import 'package:multi_tp/design_system/tokens/font.dart';
import 'package:multi_tp/design_system/tokens/colors.dart';
import 'package:multi_tp/design_system/tokens/shadows.dart';
import 'package:multi_tp/design_system/molecules/components/vacante.dart';

class ProfilePicCard extends StatelessWidget {
  ProfilePicCard({Key? key, this.picPath}) : super(key: key);
  String? picPath;

  Widget renderPic(){
    if(picPath != null){
      return Image.asset(picPath!, fit: BoxFit.cover);
    }
    return ShortButton(isSmall: true, isDisabled: false, text: "Subir foto", onPressedFunction: (){});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorPalette.secondary25,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Foto de perfil", style: CustomFont.subtitle01(ColorPalette.neutral100),),
              const SizedBox(height: 8,),
              if (picPath != null) ShortButton(isSmall: true, isDisabled: false, text: "Cambiar foto", onPressedFunction: (){}),
            ],
          ),
          Expanded(child: Container()),
          const SizedBox(width: 8,),
          renderPic(),
        ],
      ),
    );
  }
}
