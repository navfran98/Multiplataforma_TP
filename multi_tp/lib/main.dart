import 'package:beamer/beamer.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:multi_tp/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multi_tp/utils/logger.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Inicializar Firebase Crashlytics
  FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);

  // Establecer un manejador de errores global
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  
  runApp(
    // For widgets to be able to read providers, we need to wrap the entire
    // application in a "ProviderScope" widget.
    // This is where the state of our providers will be stored.
    ProviderScope(
      observers: [RiverpodLogger()],
      child: const App(),
    ),
  );
}

class RiverpodLogger extends ProviderObserver {
  @override
  void didUpdateProvider(
      ProviderBase<Object?> provider,
      Object? previousValue,
      Object? newValue,
      ProviderContainer container,
      ) {
    logger.d('''
{
  "provider": "${provider.name ?? provider.runtimeType}",
  "newValue": "$newValue"
}''');
  }
}

class App extends ConsumerWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mainBeamerDelegate = ref.watch(mainBeamerDelegateProvider);
    
    return MaterialApp.router(
      title: 'Ser Manos',
      // Routing
      routerDelegate: mainBeamerDelegate,
      routeInformationParser: BeamerParser(),
      backButtonDispatcher: BeamerBackButtonDispatcher(
        delegate: mainBeamerDelegate,
        fallbackToBeamBack: false
      ),

      // Debugging
      debugShowCheckedModeBanner: false,
    );
  }
}

