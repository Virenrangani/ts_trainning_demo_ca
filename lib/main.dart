import 'dart:ui';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:ts_training_demo_ca/di/injection.dart';
import 'package:ts_training_demo_ca/feature/auth/presentation/page/login_page.dart';
import 'package:ts_training_demo_ca/feature/auth/presentation/page/sign_up_page.dart';
import 'package:ts_training_demo_ca/feature/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:ts_training_demo_ca/feature/dashboard/presentation/pages/dashboard.dart';
import 'firebase_options.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  Injection().configDependencies();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FirebaseAnalytics.instance
      .setAnalyticsCollectionEnabled(true);

  FlutterError.onError=FirebaseCrashlytics.instance.recordFlutterFatalError;

  PlatformDispatcher.instance.onError=(error,stack){
    FirebaseCrashlytics.instance.recordError(error, stack,fatal: true);
    return true;
  };

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavBar()
    );
  }
}
