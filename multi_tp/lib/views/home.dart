import 'package:flutter/material.dart';
import 'package:multi_tp/design_system/cells/cards/profile_pic_card.dart';
import 'package:multi_tp/design_system/cells/custom_modal.dart';
import 'package:multi_tp/design_system/cells/forms/personal_form.dart';
import 'package:multi_tp/design_system/molecules/buttons/cta_button.dart';
import 'package:multi_tp/design_system/molecules/buttons/short_button.dart';
import 'package:multi_tp/design_system/tokens/colors.dart';
import 'package:multi_tp/design_system/tokens/font.dart';
import 'package:multi_tp/design_system/molecules/inputs/searchfield.dart';
import 'package:multi_tp/design_system/molecules/components/volunteering_card.dart';
import 'package:multi_tp/design_system/molecules/components/currentvolcard.dart';
import 'package:multi_tp/design_system/molecules/components/novolunteering.dart';
import 'package:multi_tp/design_system/molecules/components/vacante.dart';
import 'package:multi_tp/design_system/cells/custom_modal.dart';
import 'package:multi_tp/design_system/cells/cards/news_card.dart';
import 'package:multi_tp/design_system/cells/cards/input_card.dart';
import 'package:multi_tp/design_system/cells/cards/info_card.dart';
import 'package:multi_tp/views/profile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: _HomePageContent(),
    );
  }
}



class _HomePageContent extends StatelessWidget {
  late TabController _tabController;

  @override
  Widget build(BuildContext context) {
    _tabController = DefaultTabController.of(context);
    return Scaffold(
      backgroundColor: ColorPalette.secondary10,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: ColorPalette.secondary90,
        title: Image.asset(
          'images/Logo_rectangular.png',
          fit: BoxFit.fill,
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(52),
          child: Material(
            color: ColorPalette.secondary100,
            child: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                  color: ColorPalette.secondary200,
                  border: Border(
                    bottom:
                        BorderSide(width: 3.0, color: ColorPalette.neutral0),
                  )),
              tabs: <Widget>[
                Tab(
                  height: 52,
                  child: Text("Postularse",
                      style: CustomFont.button(ColorPalette.neutral0)),
                ),
                Tab(
                  height: 52,
                  child: Text("Mi Perfil",
                      style: CustomFont.button(ColorPalette.neutral0)),
                ),
                Tab(
                  height: 52,
                  child: Text("Novedades",
                      style: CustomFont.button(ColorPalette.neutral0)),
                ),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        children: <Widget>[
          Container(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SearchField(),
                  const SizedBox(
                    height: 32,
                  ),
                  const Visibility(
                      visible: true,
                      child: Column(
                        children: [
                          Text(
                            "Tu Actividad",
                            style:
                                CustomFont.headline01(ColorPalette.neutral100),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          CurrentVolCard(),
                          SizedBox(
                            height: 24,
                          )
                        ],
                      )),
                  const Text(
                    "Voluntariados",
                    style: CustomFont.headline01(ColorPalette.neutral100),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 24),
                  renderVolunteering(),                
                ],
              )),
          const ProfilePage(),
          const Center(
            child: Text("It's sunny here"),
          ),
        ],
      ),
    );
  }

  Widget renderVolunteering(){
    //TODO: aca va la cantidad de voluntariados que hay
    if(false){
      return NoVolunteering();
    } else {
      return Expanded(
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return const ListTile(
                contentPadding: EdgeInsets.all(0),
                title: VolunteeringCard(),
                subtitle: SizedBox(height: 24),
              );
          },
        ),
      );
    }
  }
}
