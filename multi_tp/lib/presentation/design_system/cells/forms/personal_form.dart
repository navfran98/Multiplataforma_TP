import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multi_tp/presentation/design_system/cells/cards/input_card.dart';
import 'package:multi_tp/presentation/design_system/cells/cards/profile_pic_card.dart';
import 'package:multi_tp/presentation/design_system/molecules/inputs/calendarfield.dart';
import 'package:multi_tp/presentation/design_system/tokens/colors.dart';
import 'package:multi_tp/presentation/design_system/tokens/font.dart';
import 'package:multi_tp/presentation/utils/validators.dart';

class PersonalForm extends ConsumerStatefulWidget {
  final void Function(String?)? onGenderSelected;
  final void Function(String?)? onProfilePicSelected;
  const PersonalForm({Key? key, required this.dateController, this.onGenderSelected, required this.initialValue,this.onProfilePicSelected}) : super(key: key);
  final TextEditingController dateController;
  final String? initialValue;
  
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PersonalFormState();

}

class _PersonalFormState extends ConsumerState<PersonalForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorPalette.neutral0,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Datos de perfil", style: CustomFont.headline01(ColorPalette.neutral100),),
          const SizedBox(height: 24,),
          CalendarTextField(floatingLabel: true, labelText: "Fecha de nacimiento", controller: widget.dateController, hintText: 'DD/MM/YYYY', validator: Validators.validateBirthDate,),
          const SizedBox(height: 24,),
          InputCard(
            onGenderSelected: (value) {
              widget.onGenderSelected?.call(value);
            },
            initialValue: widget.initialValue
          ),
          const SizedBox(height: 24,),
          ProfilePicCard(
            onProfilePicSelected: (value) {
              widget.onProfilePicSelected?.call(value);
            },
          )
        ],
      ),
    );
  }
}
