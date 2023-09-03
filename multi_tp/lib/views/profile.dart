import 'package:flutter/material.dart';
import 'package:multi_tp/design_system/cells/cards/info_card.dart';
import 'package:multi_tp/design_system/molecules/buttons/cta_button.dart';
import 'package:multi_tp/design_system/molecules/buttons/short_button.dart';
import 'package:multi_tp/design_system/tokens/colors.dart';
import 'package:multi_tp/design_system/tokens/font.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorPalette.neutral0,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: renderCompletedProfile(),
    );
  }

  void Function() _handleEdit(BuildContext context) {
    return () {
      context.go('/editprofile');
    };
  }

  Widget renderCompletedProfile() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 32),
        child: Column(
          children: [
            SizedBox(
                width: 110,
                height: 110,
                child: Image.asset(
                  'images/profile_pic.png',
                  fit: BoxFit.fill,
                )),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "voluntario",
              style: CustomFont.overline(ColorPalette.neutral75),
            ),
            const SizedBox(
              height: 2,
            ),
            const Text(
              "Juan Cruz Gonzalez",
              style: CustomFont.subtitle01(ColorPalette.neutral100),
            ),
            const SizedBox(
              height: 2,
            ),
            const Text(
              "mimail@mail.com",
              style: CustomFont.body01(ColorPalette.secondary200),
            ),
            const SizedBox(
              height: 32,
            ),
            const InfoCard(),
            const SizedBox(
              height: 32,
            ),
            const InfoCard(),
            const SizedBox(
              height: 32,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  CtaButton(
                      isTransparent: false,
                      isDisabled: false,
                      text: "Editar perfil",
                      onPressedFunction: _handleEdit(context)),
                  const SizedBox(
                    height: 8,
                  ),
                  CtaButton(
                      isTransparent: true,
                      isDisabled: false,
                      text: "Cerrar sesion",
                      onPressedFunction: () {})
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget renderNewProfile() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'images/default_pic.png',
                fit: BoxFit.fill,
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Voluntario",
                style: CustomFont.overline(ColorPalette.neutral75),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "Juan Cruz Gonzalez",
                style: CustomFont.subtitle01(ColorPalette.neutral100),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "¡Completá tu perfil para tener acceso a mejores oportunidades!",
                style: CustomFont.body01(ColorPalette.neutral75),
                softWrap: true,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
          child: ShortButton(
            isSmall: false,
            isDisabled: false,
            text: "Completar",
            onPressedFunction: () {},
            icon: const Icon(
              Icons.add,
              color: ColorPalette.neutral0,
            ),
          ),
        ),
        Expanded(flex: 1, child: Container())
      ],
    );
  }
}
