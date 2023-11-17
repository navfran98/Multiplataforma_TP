import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multi_tp/presentation/design_system/tokens/colors.dart';
import 'package:multi_tp/presentation/design_system/tokens/font.dart';
import 'package:multi_tp/presentation/screens/news_screen.dart';
import 'package:multi_tp/presentation/screens/profile_screen.dart';
import 'package:multi_tp/presentation/screens/volunteering_screen.dart';
import 'package:multi_tp/router.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static const route = "/home";
  static const routeName = "home";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => HomeScreenState();

}

class HomeScreenState extends ConsumerState<HomeScreen> with SingleTickerProviderStateMixin{
  late TabController _tabController;

  final List<Widget> _tabs = [
    const VolunteeringScreen(),
    const ProfileScreen(),
    const NewsScreen()
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    final location = ref.read(mainBeamerDelegateProvider).configuration.location;
    _tabController.index = getCurrentIndex(location);
  }

  int getCurrentIndex(String location) {
    return location.contains('news')
        ? 2
        : location.contains('profile')
        ? 1
        : 0;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // @override
  // Widget build(BuildContext context) {
  //   return DefaultTabController(
  //     initialIndex: 0,
  //     length: 3,
  //     child: _HomePageContent(),
  //   );
  // }

  void _onItemTapped(GlobalKey<BeamerState> key, int index) {
    if (index == 0) {
      key.currentState!.routerDelegate
          .beamToNamed(VolunteeringScreen.route);
    } else if (index == 1) {
      key.currentState!.routerDelegate
          .beamToNamed(ProfileScreen.route);
    } else if (index == 2) {
      key.currentState!.routerDelegate
          .beamToNamed(NewsScreen.route);
    }
  }

  @override
  Widget build(BuildContext context) {
    var beamerKey = GlobalKey<BeamerState>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: ColorPalette.secondary90,
        title: Image.asset(
          'images/Logo_rectangular.png',
          fit: BoxFit.fill,
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(52),
          child: Material(
            color: ColorPalette.secondary100,
            child: TabBar(
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: const BoxDecoration(
                  color: ColorPalette.secondary200,
                  border: Border(
                    bottom:
                        BorderSide(width: 3.0, color: ColorPalette.neutral0),
                  )),
              onTap: (index) => _onItemTapped(beamerKey, index),
              tabs: const <Widget>[
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
      body: Beamer(
        key: beamerKey,
        routerDelegate: BeamerDelegate(
          transitionDelegate: const NoAnimationTransitionDelegate(),
          initialPath: '/home/volunteering',
          locationBuilder: RoutesLocationBuilder(
            routes: {
              VolunteeringScreen.route : (context, state, data) => const VolunteeringScreen(),
              ProfileScreen.route : (context, state, data) => const ProfileScreen(),
              NewsScreen.route : (context, state, data) => const NewsScreen()
            }
          )
        ),
      ),
    //     _tabController = DefaultTabController.of(context);
    //     var beamerKey = GlobalKey<BeamerState>();
    // return Scaffold(
    //   appBar: AppBar(
    //     centerTitle: false,
    //     backgroundColor: ColorPalette.secondary90,
    //     title: Image.asset(
    //       'images/Logo_rectangular.png',
    //       fit: BoxFit.fill,
    //     ),
    //     bottom: const PreferredSize(
    //       preferredSize: Size.fromHeight(52),
    //       child: Material(
    //         color: ColorPalette.secondary100,
    //         child: TabBar(
    //           indicatorSize: TabBarIndicatorSize.tab,
    //           indicator: BoxDecoration(
    //               color: ColorPalette.secondary200,
    //               border: Border(
    //                 bottom:
    //                 BorderSide(width: 3.0, color: ColorPalette.neutral0),
    //               )),
    //           tabs: <Widget>[
    //             Tab(
    //               height: 52,
    //               child: Text("Postularse",
    //                   style: CustomFont.button(ColorPalette.neutral0)),
    //             ),
    //             Tab(
    //               height: 52,
    //               child: Text("Mi Perfil",
    //                   style: CustomFont.button(ColorPalette.neutral0)),
    //             ),
    //             Tab(
    //               height: 52,
    //               child: Text("Novedades",
    //                   style: CustomFont.button(ColorPalette.neutral0)),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
      // body: TabBarView(
      //   children: <Widget>[
      //     Container(
      //       color: ColorPalette.secondary10,
      //       child: Column(
      //         children: [
      //           Container(
      //             color: ColorPalette.secondary10,
      //             padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
      //             child: const Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 SearchField(),
      //                 SizedBox(
      //                   height: 32,
      //                 ),
      //                 Visibility(
      //                     visible: true,
      //                     child: Column(
      //                       children: [
      //                         Text(
      //                           "Tu Actividad",
      //                           style: CustomFont.headline01(
      //                               ColorPalette.neutral100),
      //                         ),
      //                         SizedBox(
      //                           height: 16,
      //                         ),
      //                         CurrentVolCard(),
      //                         SizedBox(
      //                           height: 24,
      //                         )
      //                       ],
      //                     )),
      //                 Text(
      //                   "Voluntariados",
      //                   style: CustomFont.headline01(ColorPalette.neutral100),
      //                   textAlign: TextAlign.start,
      //                 ),
      //                 const SizedBox(height: 24),
      //               ],
      //             ),
      //           ),
      //           renderVolunteering(),
      //         ],
      //       ),
      //     ),
      //     const ProfileScreen(),
      //     renderNews(),
      //   ],
      // ),
    );
  }
}
