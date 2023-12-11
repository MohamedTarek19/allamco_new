
import 'package:allamco_project/bussiness_logic/cubits/biometric_cubits/biometric_auth_cubit.dart';
import 'package:allamco_project/bussiness_logic/cubits/phone_auth/phone_cubit.dart';
import 'package:allamco_project/bussiness_logic/cubits/property_cubit/property_cubit.dart';

import 'package:allamco_project/presentation/screens/region_language_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';
import 'package:flutter/services.dart';

import 'presentation/screens/payment_screens/payment_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => PhoneCubit(),),
      BlocProvider(create: (context) => BiometricAuthCubit(),),
      BlocProvider(create: (context) => PropertyCubit()..initailizeProperty(),),

    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: const <Locale>[Locale('en', 'US'),],
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AnimatedSplashScreen(
        splashIconSize: double.infinity,
        duration: 2500,
        animationDuration: const Duration(seconds: 3),
        splash: Image.asset(
          'assets/images/splash.png', fit: BoxFit.fill,
          height: double.infinity, width: double.infinity,),
        splashTransition: SplashTransition.fadeTransition,
        nextScreen: RegionLanguageScreen(),
        //nextScreen: RegionLanguageScreen(),
      ),
    );
  }
}

