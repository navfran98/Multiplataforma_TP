import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multi_tp/presentation/design_system/molecules/buttons/short_button.dart';
import 'package:multi_tp/presentation/design_system/tokens/colors.dart';
import 'package:multi_tp/presentation/design_system/tokens/font.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePicCard extends ConsumerStatefulWidget {
  const ProfilePicCard({Key? key, this.onProfilePicSelected, required this.imageUrl}) : super(key: key);
  final void Function(String?)? onProfilePicSelected;
  final String? imageUrl;
  
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => ProfilePicCardState();

}

class ProfilePicCardState extends ConsumerState<ProfilePicCard> {
  String? picPath;

  Widget renderPic() {
    if (picPath != null) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(42),
        ),
        child: CircleAvatar(
          radius: 42,
          child: ClipOval(
            child: Image.file(
              File(picPath!), 
              fit: BoxFit.cover, width: 84, height:84),
          ),
        ),
      );
    }else if (widget.imageUrl != null) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(42),
        ),
        child: CircleAvatar(
            radius: 42,
            backgroundImage: NetworkImage(widget.imageUrl!)
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
              if (picPath != null || widget.imageUrl != null)
                Container(
                    margin: const EdgeInsets.only(top: 8),
                    child: ShortButton(
                        isSmall: true,
                        isDisabled: false,
                        text: "Cambiar foto",
                        onPressedFunction: () { selectImage();})),
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



