import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_tp/application/controllers/logged_user_controller.dart';
import 'package:multi_tp/application/providers.dart';
import 'package:multi_tp/data/dtos/user_dto.dart';
import 'package:multi_tp/presentation/design_system/cells/cards/info_card.dart';
import 'package:multi_tp/presentation/design_system/cells/custom_modal.dart';
import 'package:multi_tp/presentation/design_system/molecules/buttons/cta_button.dart';
import 'package:multi_tp/presentation/design_system/molecules/buttons/short_button.dart';
import 'package:multi_tp/presentation/design_system/tokens/colors.dart';
import 'package:multi_tp/presentation/design_system/tokens/font.dart';
import 'package:multi_tp/presentation/screens/edit_profile.dart';
import 'package:multi_tp/presentation/screens/login_screen.dart';
import 'package:multi_tp/presentation/screens/welcome_screen.dart';
import 'package:multi_tp/router.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  static const route = "/home/profile";
  static const routeName = "profile";

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final loggedUser = ref.watch(loggedUserControllerProvider);
    return Container(
        color: ColorPalette.neutral0,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: loggedUser.when(
          data: (user) {
            if (user!.profileCompleted) {
              return renderCompletedProfile(user);
            } else {
              return renderNewProfile(user);
            }
          },
          error: (error, stackTrace) => const Center(
            child: Text("Error"),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ));
  }

  void Function() _handleEdit(BuildContext context, WidgetRef ref) {
    return () {
      ref.read(mainBeamerDelegateProvider).beamToNamed(EditProfileScreen.route);
    };
  }

  void _handleLogOut(BuildContext context) async {
    // ignore: use_build_context_synchronously
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => Center(
                child: CustomModal(
              title: '¿Estás seguro que quieres cerrar sesión?',
              onPressedFunction: () async {
                await ref.read(authRepositoryProvider).signOut();
                ref
                    .read(mainBeamerDelegateProvider)
                    .beamToNamed(WelcomeScreen.route);
              },
            )));
  }

  Widget renderCompletedProfile(User user) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: Column(
          children: [
            user.imageUrl != null
                ? renderPic(user.imageUrl!)
                : SizedBox(
                    width: 110,
                    height: 110,
                    child: Image.asset(
                      'images/default_pic.png',
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
            Text(
              '${user.name} ${user.lastName}',
              style: const CustomFont.subtitle01(ColorPalette.neutral100),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              user.email,
              style: const CustomFont.body01(ColorPalette.secondary200),
            ),
            const SizedBox(
              height: 32,
            ),
            InfoCard(
              title: 'Informacion Personal',
              firstLabel: 'FECHA DE NACIMIENTO',
              firstContent: user.birthDate!,
              secondLabel: 'GENERO',
              secondContent: user.genre!,
            ),
            const SizedBox(
              height: 32,
            ),
            InfoCard(
              title: 'Datos de contacto',
              firstLabel: 'TELEFONO',
              firstContent: user.phoneNumber!,
              secondLabel: 'E-MAIL',
              secondContent: user.contactEmail!,
            ),
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
                      onPressedFunction: _handleEdit(context, ref)),
                  const SizedBox(
                    height: 8,
                  ),
                  isLoading
                      ? const CircularProgressIndicator(
                          color: ColorPalette.primary100,
                        )
                      : CtaButton(
                          isTransparent: true,
                          isDisabled: false,
                          text: "Cerrar sesion",
                          onPressedFunction: () {
                            _handleLogOut(context);
                          })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget renderNewProfile(User user) {
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
              Text(
                "${user.name} ${user.lastName}",
                style: const CustomFont.subtitle01(ColorPalette.neutral100),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "¡Completá tu perfil para tener acceso a mejores oportunidades!",
                style: CustomFont.body01(ColorPalette.neutral75),
                softWrap: true,
                textAlign: TextAlign.center,
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
            onPressedFunction: _handleEdit(context, ref),
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

  Widget renderPic(String imageUrl) {
    
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(42),
        ),
        child: CircleAvatar(
          radius: 42,
          child: ClipOval(
            child: Image.network(
                
                imageUrl,
                fit: BoxFit.cover,
                width: 84,
                height: 84,
                errorBuilder: (context, error, stackTrace) {
                  // This widget will be displayed if the image fails to load
                  return Image.asset(
                    'images/offline_post.jpeg', // Replace 'default_image.png' with your default image asset path
                    fit: BoxFit.cover,
                    width: 84,
                    height: 84,
                  );
                },
              ),
          ),
          ),
        );
  }
}
