import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multi_tp/presentation/design_system/molecules/buttons/short_button.dart';
import 'package:multi_tp/presentation/design_system/tokens/colors.dart';
import 'package:multi_tp/presentation/design_system/tokens/font.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_tp/utils/logger.dart';

class ProfilePicCard extends ConsumerStatefulWidget {
  const ProfilePicCard({Key? key, this.onProfilePicSelected}) : super(key: key);
  final void Function(String?)? onProfilePicSelected;
  
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => ProfilePicCardState();

}

class ProfilePicCardState extends ConsumerState<ProfilePicCard> {
  String? picPath;

  Widget renderPic() {
    if (picPath != null) {
      logger.d("Pic path: $picPath");
      // return Image.asset(picPath!, fit: BoxFit.fill);
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(42),
        ),
        // child: Image.file(
        //   File(picPath!),
        //   width: 84,
        //   height: 84,
        //   fit: BoxFit.cover,
        //   // fit: BoxFit.fitHeight,
        // ),
        child: CircleAvatar(
            radius: 42,
            backgroundImage: FileImage(File(picPath!))
        )
      );
    }
    return ShortButton(
        isSmall: true,
        isDisabled: false,
        text: "Subir foto",
        onPressedFunction: () {
          selectImage();
        });
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Foto de perfil",
                style: CustomFont.subtitle01(ColorPalette.neutral100),
              ),
              if (picPath != null)
                Container(
                    margin: const EdgeInsets.only(top: 8),
                    child: ShortButton(
                        isSmall: true,
                        isDisabled: false,
                        text: "Cambiar foto",
                        onPressedFunction: () {})),
            ],
          ),
          Expanded(child: Container()),
          const SizedBox(
            width: 8,
          ),
          renderPic(),
        ],
      ),
    );
  }

  //onPressedFunction
  void selectImage() async {
    final ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(source: ImageSource.gallery);
    if(file != null){
      setState(() {
        picPath = file.path;
      });
      widget.onProfilePicSelected?.call(file.path);
    }
  }
}
