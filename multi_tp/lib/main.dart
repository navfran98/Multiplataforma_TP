import 'package:flutter/material.dart';
import 'package:multi_tp/views/login.dart';
import 'package:multi_tp/views/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: LoginPage(),
      routes: {
        '/welcome/': (context) => const WelcomePage(),
      },
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
        child: Material(
          elevation: 10,
          child: Container(
            width: 328,
            height: 234,
            child: Column(
              children: [
                Image.asset('images/Landscape-Color.jpg', fit: BoxFit.fill),
                Container(
                  padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        alignment: AlignmentDirectional.centerStart,
                        width: 232,
                        height: 72,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "ACCION SOCIAL",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10,
                                  letterSpacing: 1.5,
                                  color: Color.fromRGBO(102, 102, 102, 1)),
                              textAlign: TextAlign.start,
                            ),
                            const Text(
                              "Un Techo para mi Pais",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  letterSpacing: 0.15,
                                  color: Color.fromRGBO(25, 25, 25, 1)),
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
                                color: const Color.fromRGBO(202, 229, 251, 1),
                              ),
                              child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "Vacantes:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          letterSpacing: 0.4,
                                          color: Color.fromRGBO(25, 25, 25, 1)),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.person,
                                          color: Color.fromRGBO(13, 71, 161, 1),
                                          size: 20,
                                        ),
                                        Text(
                                          "10",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16,
                                              letterSpacing: 0.15,
                                              color: Color.fromRGBO(
                                                  13, 71, 161, 1)),
                                        )
                                      ],
                                    ),
                                  ]),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 24,
                        width: 64,
                        child: const Row(
                          children: [
                            Icon(
                              Icons.favorite_border,
                              size: 24,
                              color: Colors.green,
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Icon(
                              Icons.location_pin,
                              size: 24,
                              color: Colors.green,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                TextButton(onPressed: (){
                    Navigator.of(context).pushNamed('/welcome/');
                    }, child: Text("HOLAAA"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
