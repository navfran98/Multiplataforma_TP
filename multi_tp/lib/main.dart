import 'package:flutter/material.dart';
import 'package:multi_tp/router.dart';
import 'package:multi_tp/design_system/tokens/colors.dart';
import 'package:multi_tp/design_system/tokens//font.dart';
import 'package:multi_tp/views/login.dart';
import 'package:multi_tp/views/welcome.dart';
import 'package:multi_tp/views/user_welcome.dart';
import 'package:multi_tp/views/signup.dart';
import 'package:multi_tp/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}



//TODO: falta agregar "roboto" como font a los text
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Test"),
      ),
      body: Center(
        child: Container(
          decoration:
              const BoxDecoration(color: ColorPalette.neutral0, boxShadow: [
            BoxShadow(
                blurRadius: 6,
                spreadRadius: 2,
                offset: Offset(0, 2),
                color: Color.fromRGBO(0, 0, 0, 0.15)),
            BoxShadow(
                blurRadius: 2,
                spreadRadius: 0,
                offset: Offset(0, 1),
                color: Color.fromRGBO(0, 0, 0, 0.3))
          ]),
          margin: EdgeInsets.symmetric(horizontal: 90),
          height: 234,
          width: double.infinity,
          child: Column(
            children: [
              Image.asset(
                'images/Landscape-Color.jpg',
                fit: BoxFit.fill,
                height: 138,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      alignment: AlignmentDirectional.centerStart,
                      height: 72,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "ACCION SOCIAL",
                            style: CustomFont.overline(ColorPalette.neutral75),
                            textAlign: TextAlign.start,
                          ),
                          const Text(
                            "Un Techo para mi Pais",
                            style:
                                CustomFont.subtitle01(ColorPalette.neutral100),
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Container(
                            padding:
                                const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
                            height: 28,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.0),
                              color: ColorPalette.secondary25,
                            ),
                            child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text("Vacantes:",
                                      style: CustomFont.body02(
                                          ColorPalette.neutral100)),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.person,
                                        color: ColorPalette.secondary200,
                                        size: 20,
                                      ),
                                      Text("10",
                                          style: CustomFont.subtitle01(
                                              ColorPalette.secondary200))
                                    ],
                                  ),
                                ]),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    const Row(
                      children: [
                        Icon(
                          Icons.favorite_border,
                          size: 24,
                          color: ColorPalette.primary100,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Icon(
                          Icons.location_pin,
                          size: 24,
                          color: ColorPalette.primary100,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
