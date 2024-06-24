import 'package:flutter/material.dart';
import 'package:infant_incubator/view/infant_incubator/infant_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
  FlutterNativeSplash.remove();
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(
      //   useMaterial3: false,
      //   // primarySwatch: Colors.blue,
      // ),
      debugShowCheckedModeBanner: false,
      home: InfantScreen(),
    );
  }
}
